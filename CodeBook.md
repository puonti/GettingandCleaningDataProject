# Study Design

The actual data is collected by "Human Activity Recognition Using Smartphones Dataset" project.

## Description of the data collection
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Instruction list

1. Run the initial.R file
2. Run the run_analysis.R file

After step one you will have the raw dataset in your "./data/" folder.

## Short description of the run_analysis.R content

The script take from the raw data only those colums, which have in label 'mean()' or 'std()'.
In those train and test datasets is added the activity information and the subject id.
Those 2 (train and test) data set is put together in one big dataset.
From that big dataset is calculated average for each measurements to every subject and activity.
The subject and activity is explained in the Code Book chapter.
In the end the dataset is exported to csv format and named "tidy_data_puonti.txt". The postfix .txt is because the coursera web site supports that format, but not .csv format.


# Code Book

This is describing the variables in the tidy data set "tidy_data_puonti.txt"

Feature Selection 
=================

(this chapter is copied from the raw dataset material)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals were much bigger. 
The only variables which is taken in account in this tidy data set is the:

mean(): Mean value  
std(): Standard deviation

## Units

All the measurements are normalized and bounded within [-1,1].

Accelerometer values are in standard gravity units 'g'.  
Velocity units are radians/second.


Activity
=================

There is 6 different activity

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Subject
=================

There were 30 subject, which is anonymous and coded only by numbering them from 1-30.
