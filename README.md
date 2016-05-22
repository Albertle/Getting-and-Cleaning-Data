# Getting-and-Cleaning-Data -- run_analysis.R file
The final Coursera project of Getting and Cleaning Data 
# Parameter
This file contains a function named run_analysis which takes the directory of original data as parameter.  
For instance, On my own computer the original dataset located in:  
C:\Users\\....\Documents\5.2data\UCI HAR Dataset\UCI HAR Dataset, under this directory it contains the original data files & directories:  
-test dir  
-train dir  
-activity_labels.txt  
-features.txt  
-features_info.txt  
-README.txt  
So when invoke this script, I pass the parameter like this:  
run_analysis("C:/Users/..../Documents/5.2data/UCI HAR Dataset/UCI HAR Dataset")  
and all the dataset will be loaded into R in the script.
You do not have to read in all the data :)  

# return value
function run_analysis have three return value  
-the merged dataset after step 1, contains all the measurements and the activity and subject columns. So it's a 10299 * 563 dimension data frame  
-the mean and std measurement dataset created after step 2, here I only extracted the mean() and std() measurement, meanFreq() is not considered. So is's a 10299 * (66+2) dimension data frame  
-the grouped dataset created according to the instruction of step 5  
these three data frame is packed in a list object and it's the return value  
# Sometimes errors will occur like " Error: found duplicated column name". This seems a bug in RStudio and reopen it can solve this   problem. Thx!   
