Code Book

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

Data Source

Original data: Human Activity Recognition Using Smartphones Data Set

Input Data Set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Study Design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Transformations

The R script run_analysis.R performs the following steps to clean the data:

Merge: Merges the training and the test sets to create one data set.

Extract: Extracts only the measurements on the mean and standard deviation for each measurement.

Name Activities: Uses descriptive activity names (e.g., WALKING) to name the activities in the data set, replacing integer codes.

Label Variables: Appropriately labels the data set with descriptive variable names.

Prefix t is replaced by Time

Prefix f is replaced by Freq

mean is replaced by Mean

std is replaced by Std

BodyBody is replaced by Body

Special characters like () and - are removed.

Average: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables

Identifiers

subject: The ID of the test subject (Integer, 1 to 30).

activity: The type of activity performed (Factor with 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Measurements

All measurements are floating-point values, normalized and bounded within [-1,1].

Time Domain Signals (Prefix: Time)

TimeBodyAcc_Mean_X/Y/Z

TimeBodyAcc_Std_X/Y/Z

TimeGravityAcc_Mean_X/Y/Z

TimeGravityAcc_Std_X/Y/Z

TimeBodyAccJerk_Mean_X/Y/Z

TimeBodyAccJerk_Std_X/Y/Z

TimeBodyGyro_Mean_X/Y/Z

TimeBodyGyro_Std_X/Y/Z

TimeBodyGyroJerk_Mean_X/Y/Z

TimeBodyGyroJerk_Std_X/Y/Z

TimeBodyAccMag_Mean

TimeBodyAccMag_Std

TimeGravityAccMag_Mean

TimeGravityAccMag_Std

TimeBodyAccJerkMag_Mean

TimeBodyAccJerkMag_Std

TimeBodyGyroMag_Mean

TimeBodyGyroMag_Std

TimeBodyGyroJerkMag_Mean

TimeBodyGyroJerkMag_Std

Frequency Domain Signals (Prefix: Freq)

FreqBodyAcc_Mean_X/Y/Z

FreqBodyAcc_Std_X/Y/Z

FreqBodyAccJerk_Mean_X/Y/Z

FreqBodyAccJerk_Std_X/Y/Z

FreqBodyGyro_Mean_X/Y/Z

FreqBodyGyro_Std_X/Y/Z

FreqBodyAccMag_Mean

FreqBodyAccMag_Std

FreqBodyAccJerkMag_Mean

FreqBodyAccJerkMag_Std

FreqBodyGyroMag_Mean

FreqBodyGyroMag_Std

FreqBodyGyroJerkMag_Mean

FreqBodyGyroJerkMag_Std

Note: Acc denotes Accelerometer, Gyro denotes Gyroscope, Mag denotes Magnitude, Jerk denotes Jerk signals.