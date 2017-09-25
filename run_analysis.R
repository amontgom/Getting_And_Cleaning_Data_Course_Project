#Read in the data, must already be local
XTrainData <- read.table("./data/GettingCleaningProject/train/X_train.txt")
XTestData <- read.table("./data/GettingCleaningProject/test/X_test.txt")
YTrainData <- read.table("./data/GettingCleaningProject/train/Y_train.txt")
YTestData <- read.table("./data/GettingCleaningProject/test/Y_test.txt")
SubjTrainData <- read.table("./data/GettingCleaningProject/train/subject_train.txt")
SubjTestData <- read.table("./data/GettingCleaningProject/test/subject_test.txt")



#1. Merges the training and the test sets to create one data set.
mergedDataX = rbind(XTrainData, XTestData)
mergedDataY = rbind(YTrainData, YTestData)
mergedDataSubj = rbind(SubjTrainData, SubjTestData)



#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#Reads in the headers
features <- read.table("./data/GettingCleaningProject/features.txt")

#Finds the mean and standard deviation columns
meanAndStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

#Sticks them in a new dataset
mergedDataXMS <- mergedDataX[, meanAndStd]



#3. Uses descriptive activity names to name the activities in the data set.
#Applies headers to merged dataset
names(mergedDataXMS) <- features[meanAndStd, 2]
names(mergedDataXMS) <- tolower(names(mergedDataXMS))
names(mergedDataXMS) <- gsub("\\(|\\)", "", names(mergedDataXMS))

#Reads in and cleans activity labels
activity_labels <- read.table("./data/GettingCleaningProject/activity_labels.txt")
activity_labels[, 2] <- tolower(as.character(activity_labels[, 2]))
activity_labels[, 2] <- gsub("_", "", activity_labels[, 2])

#Applies them to the Y data
mergedDataY[, 1] = activity_labels[mergedDataY[, 1], 2]

#Gives cleaner names to the Y and Subject data
colnames(mergedDataY) <- 'activitytype'
colnames(mergedDataSubj) <- 'subjectnumber'



#4. Appropriately labels the data set with descriptive variable names.
#Applies labels
fullData <- cbind(mergedDataSubj, mergedDataY, mergedDataXMS)

#Writes out data
write.table(fullData, "./data/GettingCleaningProject/fullData.txt")



#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Averages data by activity type and subject numbers
averagedData <- aggregate(x = fullData, by = list(activity_type = fullData$activitytype, subject_number = fullData$subjectnumber), FUN = mean)

#Removes extraneous labels
averagedData <- subset(averagedData, select = -c(subjectnumber, activitytype))

#Writes out data
write.table(fullData, "./data/GettingCleaningProject/averagedData.txt")