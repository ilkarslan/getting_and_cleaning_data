# 1. Merge training and test sets and create one data set.

temp1 <- read.table("train/X_train.txt")
temp2 <- read.table("test/X_test.txt")
X <- rbind(temp1, temp2)

temp1 <- read.table("train/subject_train.txt")
temp2 <- read.table("test/subject_test.txt")
S <- rbind(temp1, temp2)

temp1 <- read.table("train/y_train.txt")
temp2 <- read.table("test/y_test.txt")
Y <- rbind(temp1, temp2)

# 2. Extract mean and standard deviation 
features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))  # see last slide of the lecture Editing Text Variables (week 4)

# 3. Use descriptive activity names 

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately label the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "tidy_data_set.txt")

# 5. Create a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
      for (a in 1:numActivities) {
            result[row, 1] = uniqueSubjects[s]
            result[row, 2] = activities[a, 2]
            tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
            result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
            row = row+1
      }
}
write.table(result, "tidy_data_with_means.txt")