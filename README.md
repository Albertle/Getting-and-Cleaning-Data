# Getting-and-Cleaning-Data
The final Coursera project of Getting and Cleaning Data 
# run_analysis.R file
This file contains a function named run_analysis which takes the directory of original data as parameter.  
For instance, On my own computer the original dataset located in:  
C:\Users\**\Documents\5.2data\UCI HAR Dataset\UCI HAR Dataset, under this directory it contains the original data files & directories:  
-test dir  
-train dir  
-activity_labels.txt  
-features.txt  
-features_info.txt  
-README.txt  
So when invoke this script, I pass the parameter like this:  
run_analysis("C:/Users/**/Documents/5.2data/UCI HAR Dataset/UCI HAR Dataset")  
and all the dataset will be loaded into R in the script.
You do not have to read in all the data :)  
# Sometimes errors will occur like " Error: found duplicated column name". This seems a bug in RStudio and reopen it can solve this   problem. Thx!   
