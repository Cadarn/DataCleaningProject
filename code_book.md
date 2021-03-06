Codebook
========

# Introduction
The raw dataset used in this project is that described by Anguita (2012) and is available from:
The raw data is collected from the accelerometers from the Samsung Galaxy S smartphone as reported by Anguita et al. (2012). The data for the project is sourced from: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

A original description is available at the site where the data was obtained and will be summarised below: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The project takes all of the raw data taken from 30 volunteers performing six different activities and extracts the recorded mean and standard deviations of each of the recorded variables.  From this set of features the mean of each variable is calculated grouped by volunteer and activity type.

Raw data
--------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database by by Anguita et al. (2012)  come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated by Anguita et al. (2012) from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors were obtained by by Anguita et al. (2012) by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

Transforming the data
---------------------
The original data is read in and the training and testing data sets have been combined into a single master dataset.  The volunteers are identified by their subject ID (a number between 1-30) with variable name 'subjectid'.  Each of the activities are assigned their name rather than the original number identification e.g. walking.

# Variable naming convention
The following steps have been taken to make the variable names readable:
* Variable names converted to lowercase.
* All punctuation marks including parenthesis and hyphens are removed from the variable names.

Final output file variables
---------------------------
All of the variables are the mean of the equivalent variable name in the raw data that have been averaged over each activity for each volunteer. Consequently there are 180 rows, 6 activities for each of the 30 volunteers.
The following descriptions explain the variable naming convention.
* The time domain signals have the prefix 't'.
* If a variable is the result of a Fast Fourier Transform (FFT) it has the prefix 'f' for frequency domain.
* The suffix describes the axis in which the accelerometer reading is taken i.e. x, y or z.
* If the variable name contains 'mean' then it is the mean recorded variable. If it contains 'std' then it is the standard deviation of the recorded variable.
* The acceleration signals are separated into 'body' and 'gravity' acceleration signals.
* The presence of 'gyro' in a variable name implies it is an angular velocity.
* The presence of 'jerk' in a variable name means it is associated to a Jerk reading.
* 'mag' means that this is the magnitude of a variable.

For example:
1. tbodyaccmeanx is the mean value of the time domain body acceleration signal in the x axis.
2. fbodyaccjerkstdy is the mean value of the standard deviation of the FFT of acceleration signal in the y axis.

The full list of 88 variables with corresponding activity and subjectid in the output file, meanData\_by\_activity_subjectid.txt, are:

* activity - One of the six activities performed: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING
* subjectid - The unique numeric identifier of the volunteer; a number in the range 1-30.
* tbodyaccmeanx  
* tbodyaccmeany 
* tbodyaccmeanz  
* tgravityaccmeanx  
* tgravityaccmeany  
* tgravityaccmeanz  
* tbodyaccjerkmeanx 
* tbodyaccjerkmeany  
* tbodyaccjerkmeanz  
* tbodygyromeanx  
* tbodygyromeany  
* tbodygyromeanz  
* tbodygyrojerkmeanx  
* tbodygyrojerkmeany  
* tbodygyrojerkmeanz  
* tbodyaccmagmean  
* tgravityaccmagmean  
* tbodyaccjerkmagmean  
* tbodygyromagmean  
* tbodygyrojerkmagmean  
* fbodyaccmeanx  
* fbodyaccmeany  
* fbodyaccmeanz  
* fbodyaccmeanfreqx  
* fbodyaccmeanfreqy  
* fbodyaccmeanfreqz  
* fbodyaccjerkmeanx  
* fbodyaccjerkmeany  
* fbodyaccjerkmeanz  
* fbodyaccjerkmeanfreqx  
* fbodyaccjerkmeanfreqy  
* fbodyaccjerkmeanfreqz  
* fbodygyromeanx  
* fbodygyromeany  
* fbodygyromeanz  
* fbodygyromeanfreqx  
* fbodygyromeanfreqy  
* fbodygyromeanfreqz  
* fbodyaccmagmean  
* fbodyaccmagmeanfreq  
* fbodybodyaccjerkmagmean  
* fbodybodyaccjerkmagmeanfreq  
* fbodybodygyromagmean  
* fbodybodygyromagmeanfreq  
* fbodybodygyrojerkmagmean  
* fbodybodygyrojerkmagmeanfreq  
* angletbodyaccmeangravity  
* angletbodyaccjerkmeangravitymean  
* angletbodygyromeangravitymean  
* angletbodygyrojerkmeangravitymean  
* anglexgravitymean  
* angleygravitymean  
* anglezgravitymean  
* tbodyaccstdx 
* tbodyaccstdy 
* tbodyaccstdz 
* tgravityaccstdx  
* tgravityaccstdy  
* tgravityaccstdz  
* tbodyaccjerkstdx  
* tbodyaccjerkstdy  
* tbodyaccjerkstdz  
* tbodygyrostdx  
* tbodygyrostdy  
* tbodygyrostdz  
* tbodygyrojerkstdx  
* tbodygyrojerkstdy  
* tbodygyrojerkstdz  
* tbodyaccmagstd  
* tgravityaccmagstd  
* tbodyaccjerkmagstd  
* tbodygyromagstd  
* tbodygyrojerkmagstd  
* fbodyaccstdx  
* fbodyaccstdy  
* fbodyaccstdz  
* fbodyaccjerkstdx  
* fbodyaccjerkstdy  
* fbodyaccjerkstdz  
* fbodygyrostdx  
* fbodygyrostdy  
* fbodygyrostdz  
* fbodyaccmagstd  
* fbodybodyaccjerkmagstd  
* fbodybodygyromagstd  
* fbodybodygyrojerkmagstd  
