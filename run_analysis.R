## Getting and Cleaning Data - course project
## A full description is available at the site where the data was obtained:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Here are the data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## You should create one R script called run_analysis.R that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## 1. Merge the training and test sets
## Check if UCI HAR Dataset exists 
## Otherwise create new folder called "Getting Data Project", download zipped dataset and unzip
## Note files will be automatically extracted into another new folder called UCI HAR Dataset
## List file names to get an idea of what is in the file

path <- getwd()
if (!file.exists("UCI HAR Dataset")) 
    {url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile <- "Dataset.zip"
    download.file(url, zipfile)
    unzip(zipfile, overwrite=TRUE)}
    input <- file.path("UCI HAR Dataset")

list.files(input, all.files=FALSE, recursive=TRUE)

## No need to use Inertial Signals folders as explained in course discussion forum
## Readme says train/X_train.txt=training set, train/y_train.txt=training labels and train/subject_train.txt=subjects
## Read training files and give names to columns in label and subject file
## Merge files  (each has 7,352 obs of 1 var so cbind)

trainset <- read.table(file.path(input,"train","X_train.txt"))
trainlabel <- read.table(file.path(input,"train","y_train.txt"))
colnames(trainlabel) <- "Label"
trainsubject <- read.table(file.path(input,"train","subject_train.txt"))
colnames(trainsubject) <- "Subject"
mergetrain <- cbind(trainsubject, trainlabel, trainset)

## Readme says test/X_test.txt=test set, test/y_test.txt=test labels and test/subject_test.txt=subjects
## Read test files and give names to columns in label and subject file
## Merge files  (each has 2,947 obs of 1 var so cbind)

testset <- read.table(file.path(input,"test","X_test.txt"))
testlabel <- read.table(file.path(input,"test","y_test.txt"))
colnames(testlabel) <- "Label"
testsubject <- read.table(file.path(input,"test","subject_test.txt"))
colnames(testsubject) <- "Subject"
mergetest <- cbind(testsubject, testlabel, testset)

## Merge test and train sets - both have 561 variables so use rbind

mergeset <- rbind(mergetrain, mergetest)


## 2. Extract only the measurements on the mean and standard deviation 
## Read the file features.txt for all the measurement names and append to merged dataset

features <- read.table(file.path(input, "features.txt"))
featurename <- as.character(features[,2])
headers <- c("Subject", "Label", featurename)
colnames(mergeset) <- headers

## Identify and subset columns measuring mean or standard deviation
## Only extracts those with mean() or std() at end as those are true measures of mean or std in this context

mergeset1 <- mergeset[, 1:2]
mergeset2 <- mergeset[(grepl(("mean\\(\\)|std\\(\\)"), headers))]
mergesubset <- cbind(mergeset1, mergeset2)


## 3. Uses descriptive activity names to name the activities in the data set
## Read activity names in activity_labels.txt file

activity <- read.table(file.path(input, "activity_labels.txt"))
colnames(activity) = c("Label", "Activity")

## Merge "activity" with dataset 
mergesubset <- merge(mergesubset, activity, by="Label", all.x=TRUE)

## Order by subject, remove Label column and rearrange data set so Activity is second column
mergesubset <- mergesubset[, c(2,69,3:68)]
mergefinal <- mergesubset[order(mergesubset$Subject), ]


## 4. Appropriately label the data set with descriptive activity names
## Replace abbreviations with fuller descriptions as laid out in features_info.txt
## Also remove special characters
names(mergefinal) <- tolower(names(mergefinal))
names(mergefinal) <- sub("^t", "time", names(mergefinal))
names(mergefinal) <- sub("^f", "frequency", names(mergefinal))
names(mergefinal) <- gsub("acc", "acceleration", names(mergefinal))
names(mergefinal) <- gsub("std", "standarddeviation", names(mergefinal))
names(mergefinal) <- gsub("mag", "magnitude", names(mergefinal))
names(mergefinal) <- gsub("gyro", "gyroscope", names(mergefinal))
names(mergefinal) <- gsub("-","", names(mergefinal))
names(mergefinal) <- gsub("\\(|\\)", "", names(mergefinal))


## 5. Create a second, independent tidy data set with the average of 
## each variable for each activity and each subject

## Activate dplyr library, group table by subject and activity, and find the mean of each
## remaining column by subject and activity
library(dplyr)
mergesum <- mergefinal %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

## Write final data set to txt file in working directory
write.table(mergesum, "tidyanalysis.txt", row.names=FALSE)