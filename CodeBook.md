Getting and Cleaning Data Project


Description

Additional information about the variables, data and transformations used in the course project for coursera of Johns Hopkins Getting and Cleaning Data course.

Source Data

A full description of the data used in this project can be found at The The UCI Machine Learning Repository

The source data for this project can be found here.

Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information

For each record in the dataset it is provided: 
•Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
•Triaxial Angular velocity from the gyroscope. 
•A 561-feature vector with time and frequency domain variables. 
•Its activity label. 
•An identifier of the subject who carried out the experiment.

package named plyr is required at the first line.

## Part 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in
•features.txt
•activity_labels.txt
•subject_train.txt
•x_train.txt
•y_train.txt
•subject_test.txt
•x_test.txt
•y_test.txt

Assign column names and merge to create one data set.

## Part 2. Extract only the measurements on the mean and standard deviation for each measurement.

From the merged data set is extracted and intermediate data set with only the values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").

## Part 3. Use descriptive activity names to name the activities in the data set

Merge data subset with the activityType table to include the descriptive activity names.

## Part 4. Appropriately label the data set with descriptive activity names.

Use gsub function for pattern replacement to clean up the data labels.

## Part 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.

The tidy data set contains 10299 observations with 81 variables divided in:
•an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

•a 79-feature vector with time and frequency domain signal variables (numeric)

Reference
<a name="tidy-dataset"/>Tidy data set. URL: https://github.com/jtleek/datasharing#the-tidy-data-set. Accessed 06/21/2016
