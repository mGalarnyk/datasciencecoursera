# Getting and Cleaning Data Project John Hopkins Coursera
# Author: Michael Galarnyk

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load Packages and get the Data
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# Load activity labels + features
activityLabels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("classLabels", "activityName"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames"))
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
featuresWanted.names <- features[featuresWanted, featureNames]

# Load train datasets
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, featuresWanted, with = FALSE]
#[featuresWanted]
trainActivities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"))
trainSubjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"))
train <- cbind(trainSubjects, trainActivities, train)

# Load test datasets
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, featuresWanted, with = FALSE]
testActivities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"))
testSubjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"))
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)

colnames(allData) <- c("subject", "activity", featuresWanted.names)

# Convert classLabels to activityName basically. More explicit. 
allData[, activity] <- factor(allData[, activity]
                              , levels = activityLabels[["classLabels"]]
                              , labels = activityLabels[["activityName"]])

allData[, subject] <- as.factor(allData[, subject])

allData.melted <- reshape2::melt(data = allData, id = c("subject", "activity"))
allData.mean <- reshape2::dcast(data = allData.melted, subject + activity ~ variable, mean)

data.table::fwrite(x = allData.mean, file = "tidy.txt", quote = FALSE)
data.table::fwrite(x = allData.mean, file = "tidy.csv", quote = FALSE)