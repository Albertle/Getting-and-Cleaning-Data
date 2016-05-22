run_analysis <- function(whole_dataset_dir)
{
        # import the package
        library(plyr)
        setwd(whole_dataset_dir)
        activity_labels <- read.table("activity_labels.txt", sep = "")
        features <- read.table("features.txt", sep = "")
        subject_train <- read.table("train/subject_train.txt", sep = "")
        subject_test <- read.table("test/subject_test.txt", sep = "")
        x_train <- read.table("train/X_train.txt", sep = "")
        y_train <- read.table("train/y_train.txt", sep = "")
        x_test <- read.table("test/X_test.txt", sep = "")
        y_test <- read.table("test/y_test.txt", sep = "")
        # label the name of each col
        names(x_train) <- as.character(features[,2])
        names(x_test) <- as.character(features[,2])
        # merge two dataset
        new_dataset <- rbind(x_train, x_test)
        # label the activities
        y_train[1] <- activity_labels[,2][y_train[[1]]]
        y_test[1] <- activity_labels[,2][y_test[[1]]]
        # merge y_train,y_test and subject_train,subject_test dataset
        new_y <- rbind(y_train[1], y_test[1])
        new_subject <- rbind(subject_train[1],subject_test[1])
        # integrate the activity and subject data into the new dataset
        new_dataset <- mutate(new_dataset, activity = new_y[,1], subject = new_subject[,1])
        # create the required measurement dataset
        # 1.select all the variables whose name contians mean and std but do not contain
        # meanFraq which I reckon donot belong to the mean measurement
        # 2.the newly created dataset include the activity and subject variable 
        mean_std_index <- which(grepl("mean|std", names(new_dataset)) & !grepl("meanFreq", names(new_dataset)))
        activity_index <- length(names(new_dataset)) - 1
        subject_index <- length(names(new_dataset))
        new_mean_std_dataset <- new_dataset[, c(mean_std_index, activity_index, subject_index)]
        # finally create the mean dataset
        library(dplyr)
        
        grouped_dataset <- group_by(new_mean_std_dataset, subject, activity)
        last_index <- length(names(grouped_dataset)) - 2
        new_mean_dataset <- summarize_each(grouped_dataset, funs(mean))

        # create new label & label the new dataset
        names(new_mean_dataset)[3:last_index] <- paste0(names(new_mean_dataset), "-mean")[3:last_index]

        write.table(new_mean_dataset, "new_mean_dataset.txt", row.names = FALSE)
        return(list(new_dataset = new_dataset, new_mean_std_dataset = new_mean_std_dataset, new_mean_dataset = new_mean_dataset))
}