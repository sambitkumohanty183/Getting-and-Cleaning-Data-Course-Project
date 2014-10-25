# Introduction

This code book explains how the data was transformed in to a tidy data set from the source at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and describes the variables in the output file.
More details description on data set can found from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Program Description

*The program starts by reading all the relevant data files.

```{r }
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt':Training subject

- 'test/subject_test.txt': Test subject
```

*Next it transforms the filters only the columns necessary to create the tidy data set.

*It cleans up the column names to remove dashes and brackets.

*Next it column binds the the test data set and training data sets with their respective subject codes and activity.

*Finally it row binds both the data sets.

*For the final data set we are using ddply where we are grouping by subject and activity. Then calculating the colMeans using an inline function.
 
* More detailed information check the inline code comments.





### Variable Descriptions

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
- mean: Mean value
- std: Standard deviation

### Variables in the Data Set
The following variables are present in the codebook

Variable Name|Desciption|
|-------------|-----------|
subject| The ID of the subject from 1 to 30|
activity| The Descriptive activity, such as walking etc |
tbodyaccmeanx| |
tbodyaccmeany| | 
tbodyaccmeanz| | 
tbodyaccstdx| | 
tbodyaccstdy| | 
tbodyaccstdz| | 
tgravityaccmeanx| | 
tgravityaccmeany| | 
tgravityaccmeanz| | 
tgravityaccstdx| | 
tgravityaccstdy| | 
tgravityaccstdz| | 
tbodyaccjerkmeanx| | 
tbodyaccjerkmeany| | 
tbodyaccjerkmeanz| | 
tbodyaccjerkstdx| | 
tbodyaccjerkstdy| | 
tbodyaccjerkstdz| | 
tbodygyromeanx| | 
tbodygyromeany| | 
tbodygyromeanz| | 
tbodygyrostdx| | 
tbodygyrostdy| | 
tbodygyrostdz| | 
tbodygyrojerkmeanx| | 
tbodygyrojerkmeany| | 
tbodygyrojerkmeanz| | 
tbodygyrojerkstdx| | 
tbodygyrojerkstdy| | 
tbodygyrojerkstdz| | 
tbodyaccmagmean| | 
tbodyaccmagstd| | 
tgravityaccmagmean| | 
tgravityaccmagstd| | 
tbodyaccjerkmagmean| | 
tbodyaccjerkmagstd| | 
tbodygyromagmean| | 
tbodygyromagstd| | 
tbodygyrojerkmagmean| | 
tbodygyrojerkmagstd| | 
fbodyaccmeanx| | 
fbodyaccmeany| | 
fbodyaccmeanz| | 
fbodyaccstdx| | 
fbodyaccstdy| | 
fbodyaccstdz| | 
fbodyaccjerkmeanx| | 
fbodyaccjerkmeany| | 
fbodyaccjerkmeanz| | 
fbodyaccjerkstdx| | 
fbodyaccjerkstdy| | 
fbodyaccjerkstdz| | 
fbodygyromeanx| | 
fbodygyromeany| | 
fbodygyromeanz| | 
fbodygyrostdx| | 
fbodygyrostdy| | 
fbodygyrostdz| | 
fbodyaccmagmean| | 
fbodyaccmagstd| | 
fbodybodyaccjerkmagmean| | 
fbodybodyaccjerkmagstd| | 
fbodybodygyromagmean| | 
fbodybodygyromagstd| | 
fbodybodygyrojerkmagmean| | 
fbodybodygyrojerkmagstd| | 