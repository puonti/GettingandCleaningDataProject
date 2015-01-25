# GettingandCleaningDataProject
Repository for Project work in the Getting and Cleaning Data Coursera Course.

This readme file is answering in the following. "You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected." 

# Scripts
## initial.R
Is needed only in beginning of the project to get the data in the use.
The data will be stored in relative path from the current folder.
The script load zip file in the "./data/getdata_projectfiles_UCI_HAR_Dataset.zip".
The zip file content will be extracted in the "./UCI HAR Dataset" folder.

## run_analysis.R
This file is the whole analysis. It does the following, but not in this order

	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for  each activity and each subject.