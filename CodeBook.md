
# Code Book

In this book i first list all the variables and variable names in the "tidy.txt" which is in the repo. 
I then give a short explaination of how "run_analysis.R" solves the problems in this assignment.

## Identifiers

* ID - subject
* activity - The activity of subject when measured.

## Features

" 'ID'
* 'activity'
* 'tBodyAcc_mean_X'
* 'tBodyAcc_mean_Y'
* 'tBodyAcc_mean_Z'
* 'tGravityAcc_mean_X'
* 'tGravityAcc_mean_Y'
* 'tGravityAcc_mean_Z'
* 'tBodyAccJerk_mean_X'
* 'tBodyAccJerk_mean_Y'
* 'tBodyAccJerk_mean_Z'
* 'tBodyGyro_mean_X'
* 'tBodyGyro_mean_Y'
* 'tBodyGyro_mean_Z'
* 'tBodyGyroJerk_mean_X'
* 'tBodyGyroJerk_mean_Y'
* 'tBodyGyroJerk_mean_Z'
* 'tBodyAccMag_mean'
* 'tGravityAccMag_mean'
* 'tBodyAccJerkMag_mean'
* 'tBodyGyroMag_mean'
* 'tBodyGyroJerkMag_mean'
* 'fBodyAcc_mean_X'
* 'fBodyAcc_mean_Y'
* 'fBodyAcc_mean_Z'
* 'fBodyAcc_meanFreq_X'
* 'fBodyAcc_meanFreq_Y'
* 'fBodyAcc_meanFreq_Z'
* 'fBodyAccJerk_mean_X'
* 'fBodyAccJerk_mean_Y'
* 'fBodyAccJerk_mean_Z'
* 'fBodyAccJerk_meanFreq_X'
* 'fBodyAccJerk_meanFreq_Y'
* 'fBodyAccJerk_meanFreq_Z'
* 'fBodyGyro_mean_X'
* 'fBodyGyro_mean_Y'
* 'fBodyGyro_mean_Z'
* 'fBodyGyro_meanFreq_X'
* 'fBodyGyro_meanFreq_Y'
* 'fBodyGyro_meanFreq_Z'
* 'fBodyAccMag_mean'
* 'fBodyAccMag_meanFreq'
* 'fBodyBodyAccJerkMag_mean'
* 'fBodyBodyAccJerkMag_meanFreq'
* 'fBodyBodyGyroMag_mean'
* 'fBodyBodyGyroMag_meanFreq'
* 'fBodyBodyGyroJerkMag_mean'
* 'fBodyBodyGyroJerkMag_meanFreq'
* 'tBodyAcc_std_X'
* 'tBodyAcc_std_Y'
* 'tBodyAcc_std_Z'
* 'tGravityAcc_std_X'
* 'tGravityAcc_std_Y'
* 'tGravityAcc_std_Z'
* 'tBodyAccJerk_std_X'
* 'tBodyAccJerk_std_Y'
* 'tBodyAccJerk_std_Z'
* 'tBodyGyro_std_X'
* 'tBodyGyro_std_Y'
* 'tBodyGyro_std_Z'
* 'tBodyGyroJerk_std_X'
* 'tBodyGyroJerk_std_Y'
* 'tBodyGyroJerk_std_Z'
* 'tBodyAccMag_std'
* 'tGravityAccMag_std'
* 'tBodyAccJerkMag_std'
* 'tBodyGyroMag_std'
* 'tBodyGyroJerkMag_std'
* 'fBodyAcc_std_X'
* 'fBodyAcc_std_Y'
* 'fBodyAcc_std_Z'
* 'fBodyAccJerk_std_X'
* 'fBodyAccJerk_std_Y'
* 'fBodyAccJerk_std_Z'
* 'fBodyGyro_std_X'
* 'fBodyGyro_std_Y'
* 'fBodyGyro_std_Z'
* 'fBodyAccMag_std'
* 'fBodyBodyAccJerkMag_std'
* 'fBodyBodyGyroMag_std'
* 'fBodyBodyGyroJerkMag_std'

## Activity Labels
1 WALKING 
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

## Solving the assignment.
I first decided to find the relevant features by using the grep() function.
I also found the indexes for these features so i could extract the correct
columns later on. I cleaned up the titles a bit. 

I then loaded the training data, subselected relevant features, and merged
this data with the subject id data and activity data found in separate files. 

I repeated this step with the test data.

I finally merged the test- and train data with rbind() and changed the activity
values from numbers to the values described above.

To calculate the average of all features grouped by subject ID and activity
I used the Dplyr package.
