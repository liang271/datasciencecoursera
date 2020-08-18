Author: hanliang chen

# Goal

1. A tidy data set
2. A link to a Github repository with your script for performing the analysis
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
4. Analysis R Script

# Variables

TimeBodyAcceleration.mean...X 4 

TimeBodyAcceleration.mean...Y 5 

TimeBodyAcceleration.mean...Z 6

 TimeGravityAcceleration.mean...X 7

 TimeGravityAcceleration.mean...Y 8

 TimeGravityAcceleration.mean...Z 9

 TimeBodyAccelerationJerk.mean...X 10

 TimeBodyAccelerationJerk.mean...Y 11

 TimeBodyAccelerationJerk.mean...Z 12

 TimeBodyGyroscope.mean...X 13

 TimeBodyGyroscope.mean...Y 14 

TimeBodyGyroscope.mean...Z 15 

TimeBodyGyroscopeJerk.mean...X 16

 TimeBodyGyroscopeJerk.mean...Y 17

 TimeBodyGyroscopeJerk.mean...Z 18

 TimeBodyAccelerationMag.mean.. 19

 TimeGravityAccelerationMag.mean.. 20

 TimeBodyAccelerationJerkMag.mean.. 21

 TimeBodyGyroscopeMag.mean.. 22

 TimeBodyGyroscopeJerkMag.mean.. 23

 FrequencyBodyAcceleration.mean...X 24

 FrequencyBodyAcceleration.mean...Y 25

 FrequencyBodyAcceleration.mean...Z 26 FrequencyBodyAcceleration.meanFreq...X 27 FrequencyBodyAcceleration.meanFreq...Y 28 FrequencyBodyAcceleration.meanFreq...Z 29 FrequencyBodyAccelerationJerk.mean...X 30 FrequencyBodyAccelerationJerk.mean...Y 31 FrequencyBodyAccelerationJerk.mean...Z 32 FrequencyBodyAccelerationJerk.meanFreq...X 33 FrequencyBodyAccelerationJerk.meanFreq...Y 34 FrequencyBodyAccelerationJerk.meanFreq...Z 35 FrequencyBodyGyroscope.mean...X 36

 FrequencyBodyGyroscope.mean...Y 37

 FrequencyBodyGyroscope.mean...Z 38

FrequencyBodyGyroscope.meanFreq...X 39 FrequencyBodyGyroscope.meanFreq...Y 40 FrequencyBodyGyroscope.meanFreq...Z 41 FrequencyBodyAccelerationMag.mean.. 42 FrequencyBodyAccelerationMag.meanFreq.. 43 FrequencyBodyBodyAccelerationJerkMag.mean.. 44 FrequencyBodyBodyAccelerationJerkMag.meanFreq.. 45 FrequencyBodyBodyGyroscopeMag.mean.. 46 FrequencyBodyBodyGyroscopeMag.meanFreq.. 47 FrequencyBodyBodyGyroscopeJerkMag.mean.. 48 FrequencyBodyBodyGyroscopeJerkMag.meanFreq.. 49 Angle.TimeBodyAccelerationMean.gravity. 50 Angle.TimeBodyAccelerationJerkMean..gravityMean. 51 Angle.TimeBodyGyroscopeMean.gravityMean. 52 Angle.TimeBodyGyroscopeJerkMean.gravityMean. 53

 Angle.X.gravityMean. 54

 Angle.Y.gravityMean. 55

 Angle.Z.gravityMean. 56

 TimeBodyAcceleration.std...X 57

 TimeBodyAcceleration.std...Y 58

 TimeBodyAcceleration.std...Z 59

 TimeGravityAcceleration.std...X 60

 TimeGravityAcceleration.std...Y 61

 TimeGravityAcceleration.std...Z 62

 TimeBodyAccelerationJerk.std...X 63

 TimeBodyAccelerationJerk.std...Y 64

 TimeBodyAccelerationJerk.std...Z 65

 TimeBodyGyroscope.std...X 66

 TimeBodyGyroscope.std...Y 67

 TimeBodyGyroscope.std...Z 68

 TimeBodyGyroscopeJerk.std...X 69

 TimeBodyGyroscopeJerk.std...Y 70

 TimeBodyGyroscopeJerk.std...Z 71

 TimeBodyAccelerationMag.std.. 72 

TimeGravityAccelerationMag.std.. 73

 TimeBodyAccelerationJerkMag.std.. 74

 TimeBodyGyroscopeMag.std.. 75

 TimeBodyGyroscopeJerkMag.std.. 76

 FrequencyBodyAcceleration.std...X 77

 FrequencyBodyAcceleration.std...Y 78

 FrequencyBodyAcceleration.std...Z 79

 FrequencyBodyAccelerationJerk.std...X 80 FrequencyBodyAccelerationJerk.std...Y 81 FrequencyBodyAccelerationJerk.std...Z 82

 FrequencyBodyGyroscope.std...X 83

 FrequencyBodyGyroscope.std...Y 84

 FrequencyBodyGyroscope.std...Z 85

 FrequencyBodyAccelerationMag.std.. 86 FrequencyBodyBodyAccelerationJerkMag.std.. 87 FrequencyBodyBodyGyroscopeMag.std.. 88 FrequencyBodyBodyGyroscopeJerkMag.std.

# run_analysis.R

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.