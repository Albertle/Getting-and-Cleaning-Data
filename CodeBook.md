#This codebook file explain the variables of the data frames created by run_analysis
#Data Frame : new_dataset
The merged dataset of X_train and X_test. All the variable name comes from features.txt file.  
Besides, new_dataset contains the activity and subject variable.  
Activity describe which of the six activities did the participator perform  
Subject describe who performed this activity, since there are 30 volunteers so the value range from 1 to 30  
#Data Frame : new_mean_std_dataset
The dataset consist of all the mean and std measurement and the activity and subject column  
The variable names of this data frame are just inherit from the new_dataset data frame
#Data Frame : new_mean_dataset
The data frame with the average of each variable for each activity and each subject.  
The variable names are inherit from new_mean_std_dataset with a subtle modification. All the variable name are attached with "-mean" 
except activity and subject  
