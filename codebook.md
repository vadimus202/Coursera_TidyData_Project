# Human Activity Recognition Using Smartphones Dataset

## Original raw datasets
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 


## Analysis-ready tidy dataset
The cleaned dataset contains the following columns:  

- **subject**:  
Unique numeric ID (1-30) that identifies each the 30 volunteers  
- **activity**:  
For each of the 30 subjects, the dataset contains 6 rows, one for each of the activties labeled as "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", or "laying".  
- **measurements**:  
For each subject and activity the average of 66 variables is reported in columns 2-68. Features are normalized (unitless) and bounded within [-1,1]. The measurement variable names are described below.  


## Measurement Naming Convention  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccXYZ and timeGyroXYZ. These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccXYZ and timeGravityAccXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkXYZ and timeBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

timeBodyAccXYZ  
timeGravityAccXYZ  
timeBodyAccJerkXYZ  
timeBodyGyroXYZ  
timeBodyGyroJerkXYZ  
timeBodyAccMag  
timeGravityAccMag  
timeBodyAccJerkMag  
timeBodyGyroMag  
timeBodyGyroJerkMag  
freqBodyAccXYZ  
freqBodyAccJerkXYZ  
freqBodyGyroXYZ  
freqBodyAccMag  
freqBodyAccJerkMag  
freqBodyGyroMag  
freqBodyGyroJerkMag   


The set of variables that were estimated from these signals are:  
Mean: Mean value  
Std: Standard deviation


