#Goal:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Q1:
## label file
features <- read.table("features.txt",
                       col.names = c("label","featurename"))
actlab <- read.table("activity_labels.txt",
                     col.names = c("label","activename"))
## load train data
subtrain <- read.table('./train/subject_train.txt', 
                       col.names = c('subjectId'))
xtrain <- read.table('./train/X_train.txt')
ytrain <- read.table('./train/y_train.txt')
## load test data
subtest <- read.table('./test/subject_test.txt', 
                      col.names = c('subjectId'))
xtest <- read.table('./test/X_test.txt')
ytest <- read.table('./test/y_test.txt')
## combine train data
colnames(xtrain) <- features$featurename
colnames(ytrain) <- "activityLabels"
traindata <- cbind(subtrain,xtrain,ytrain)
## combine test data 
colnames(xtest) <- features$featurename
colnames(ytest) <- "activityLabels"
testdata <- cbind(subtest,xtest,ytest)
## merge traindata and test data 
data <- rbind(traindata,testdata)

##Q2:
meansddata <- data[, c(1, grep( ".*mean[(])|.*std[(])", 
                                x = names(data)), 563)]

##Q3:
meanSdData$activityLabels <- as.factor(meanSdData$activityLabels)
meansddata$activity <- factor(meanSdData$activityLabels,
                              levels = actlab$label,
                              labels = actlab$activename)

##Q4
colnames(meansddata) <- gsub("[(])","",names(meansddata))
meansddata <- meansddata[,c(1,69,2:68)]

##Q5

library(dplyr)
tinydata <- group_by(meansddata, subjectId, activity) %>% 
        summarize_all(mean)

