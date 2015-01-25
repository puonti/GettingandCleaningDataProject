###########################################################################
# Instruction:
#
#  You should create one R script called run_analysis.R that does the following. 
# 
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
#      each activity and each subject.
# 
# Good luck!
###########################################################################

###########################################################################
# Prerequisites
# there is the needed dataset in "./UCI HAR Dataset/" folder
# I made the dataset with the initial.R script, but it is
# included in this git repo already
###########################################################################

###########################################################################
# Libraries
# install it if needed
library(plyr)
# install.packages("dplyr")
library(dplyr)
###########################################################################



###########################################################################
# Handling the columns to be taken from the actual datafile
# this is for the instrucion 
#   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#
features <- read.table("./UCI HAR Dataset/features.txt")

# this is the index of what columns have to be taken
# only features what have in the name 'mean()' or 'std()' is wanted
feature_cols <- grep("(mean|std)\\(\\)",features$V2)

# LOAD the datasets and clean only wanted features
#
train_raw_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_raw_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

# taking only wanted features
train_data <- train_raw_data[,feature_cols]
test_data <- test_raw_data[,feature_cols]

# name the columns, because now they are "V1", "V2"..
col_names <- features[feature_cols,2]
colnames(train_data) <- col_names
colnames(test_data) <- col_names
###########################################################################


###########################################################################
# Adding the activity information to the datasets
#   3. Uses descriptive activity names to name the activities in the data set
#
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# reading train and test activity_data
train_activity_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_activity_data <- read.table("./UCI HAR Dataset/test/y_test.txt")

# putting the labels to the activity_data
train_activity_label <- join(train_activity_data,activity_labels, type="inner")
test_activity_label <- join(test_activity_data,activity_labels, type="inner")

# adding the subject to the dataset
# first getting the subject to memory
train_subject_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_subject_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")

train_subject_activity <- cbind(train_subject_data,train_activity_label[,"V2"])
test_subject_activity <- cbind(test_subject_data,test_activity_label[,"V2"])
###########################################################################

###########################################################################
# name the field
#   4. Appropriately labels the data set with descriptive variable names. 
names(train_subject_activity)[1] <- "subject_id"
names(test_subject_activity)[1] <- "subject_id"
names(train_subject_activity)[2] <- "activity_label"
names(test_subject_activity)[2] <- "activity_label"

train <- cbind(train_subject_activity,train_data)
test <- cbind(test_subject_activity,test_data)
#
###########################################################################

###########################################################################
#   1. Merges the training and the test sets to create one data set.
# doing merge for the two dataset
# before merge checking row count 
dim(test_data)[1] + dim(train_data)[1]
# [1] 10299

dataset <- rbind(train,test)

# checking that the rowcount match
dim(dataset)[1]
# [1] 10299
###########################################################################


###########################################################################
#   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
#      each activity and each subject.
average_dataset <- ddply(dataset, .(subject_id,activity_label), numcolwise(mean))

# check for myself
# this should return 6*30= 180 rows and 66+2=68 columns
dim(average_dataset)
# [1] 180  68
###########################################################################

# doing the tidy file, for putting it to the coursera website
 write.table(average_dataset, file = "tidy_data_puonti.txt", row.name=FALSE)