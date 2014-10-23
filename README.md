GettingDataProject
------------------

This is the course project for Coursera's Getting and Cleaning Data. 

Here are the raw data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script called run_analysis.R does the following:

1. Merges the training and the test sets to create one data set. First checks if the user already has the data set downloaded. If not, creates new folder called "Getting Data Project", downloads zipped dataset and unzips it

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive activity names. Replaces abbreviations with fuller descriptions as laid out in features_info.txt

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

6. Writes final data set to txt file in working directory
write.table(mergesum, "tidyanalysis.txt", row.names=FALSE)