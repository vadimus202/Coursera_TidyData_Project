# Human Activity Recognition Using Smartphones Dataset

This repo contains an R script "run_analysis.R" that reads and cleans data to create a tidy, analysis-ready dataset.  

The script requires the **"plyr"** package and **"getdata-projectfiles-UCI HAR Dataset.zip"** raw input data saved in the same working directory as the R script.   

The R script does the fillowing:  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The sript will also save the final dataset in the working directory as a **tab-delimited** text file called "tidy_data.txt".  

The **codebook** describing the dataset is provided in "codebook.md" file.  





