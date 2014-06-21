# setwd('C:/Users/Vadim/Dropbox/School/Coursera/2014_3_Getting_Cleaning_Data/Project')
setwd('C:/Dropbox/School/Coursera/2014_3_Getting_Cleaning_Data/Project')


require(plyr)

## Read Data
############################

# zipped data file located in the working directory 
fileZip = 'getdata-projectfiles-UCI HAR Dataset.zip'

# test and train measurment data
test = read.table(unz(fileZip, 'UCI HAR Dataset/test/X_test.txt'))
train = read.table(unz(fileZip, 'UCI HAR Dataset/train/X_train.txt'))

# activity codes
activity = read.table(unz(fileZip, 'UCI HAR Dataset/activity_labels.txt'))
# activity data
testActivity = read.table(unz(fileZip, 'UCI HAR Dataset/test/y_test.txt'))
trainActivity = read.table(unz(fileZip, 'UCI HAR Dataset/train/y_train.txt'))

# subject identifiers
testSubject = read.table(unz(fileZip, 'UCI HAR Dataset/test/subject_test.txt'))
trainSubject = read.table(unz(fileZip, 'UCI HAR Dataset/train/subject_train.txt'))

# features info (column names)
features = read.table(unz(fileZip, 'UCI HAR Dataset/features.txt'))




## Step 1
## Merge the training and the test sets to create one data set.
##################################################################

# merge subject id, activity code, and measurements
test = cbind(testSubject, testActivity, test)
train = cbind(trainSubject, trainActivity, train)

# combine measurements
dat1 = rbind(test,train)

# rename features columnnames
names(dat1)[1:2] = c('subject', 'activityCode')
dat1[1:5,1:5]


## Step 2
## Extract only the measurements on the mean and standard deviation 
## for each measurement.
####################################################################

# rename features columnnames
names(features) = c('col', 'var')

# define an index of column names that contain
# either 'mean()' or 'std()' substrings
idx = grep("mean\\(\\)|std\\(\\)", features$var)

# extract mean and std measurements using 
# the index (adjusted for first two extra variables) 
dat2 = dat1[,c(1,2,idx+2)] 



## Step 3
## Use descriptive activity names to name the activities 
## in the data set
##################################################################

# change Activity labels to lower case
activity[,2] = tolower(activity[,2])

# rename activity column names
names(activity) = c('activityCode', 'activity')

# merge activity data codes with labels
dat3 = merge(activity, dat2, all.y = T, by = 'activityCode')

# drop activity codes
dat3 = dat3[,-1]



## Step 4
## Appropriately label the data set with descriptive variable names
#####################################################################

# extract feature names using the index from Step 2
features2 = features[idx, 2, drop=F]

# remove "," and "-" characters
features2$var = gsub("\\-|\\,", "", features2$var)

# replace mean() and std() with more readable strings
features2$var = gsub("mean\\(\\)", "Mean", features2$var)
features2$var = gsub("std\\(\\)", "Std", features2$var)

# expand time and frequency domain prefixes
features2$var = gsub("^t","time",features2$var)
features2$var = gsub("^f","freq",features2$var)

# apply clean feature names to measurements data
names(dat3)[-(1:2)] = features2$var
print(names(dat3))




## Step 5
## Create a data set with the average of each variable 
## for each activity and each subject
#####################################################################

dat4 = ddply(dat3, .(subject, activity), numcolwise(mean))




## Save the dataset into a text file
##########################################################
write.table(dat4, 'tidy_data.txt', sep = '\t', row.names = F, quote = F)

