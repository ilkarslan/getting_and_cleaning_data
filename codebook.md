Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

1. Merges the training and test sets to create one data set

train/subject_train.txt with test/subject_test.txt : creates a 10299 x 1 data frame with subject IDs,

train/y_train.txt with test/y_test.txt : creates a 10299 x 1 data frame with activity IDs.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Creates a 10299 x 66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).

3. RUses descriptive activity names to name the activities in the data set walkingupstairs

walkingdownstairs

sitting

standing

laying

4. Appropriately labels the data set with descriptive activity names. 

Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs.

The result is saved as tidy_data_set.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. Names of the attributes are similar to the following:

tbodyacc-mean-x

tbodyacc-mean-y

tbodyacc-mean-z

tbodyacc-std-x

tbodyacc-std-y

tbodyacc-std-z

tgravityacc-mean-x

tgravityacc-mean-y

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The result is saved as tidy_data_with_means.txt, a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.
