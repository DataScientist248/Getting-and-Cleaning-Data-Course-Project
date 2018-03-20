library(dplyr)

# reading training data
X_train <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/train/subject_train.txt")

#reading test data
X_test <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/test/subject_test.txt")

#reading features - data description
variable_names <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/features.txt")

#reading activity labels
activity_labels <- read.table("/Users/chiragsubramanian/Downloads/UCI HAR Dataset/activity_labels.txt")

#1 - Merges the training and the test sets to create one data set.
X_complete_final <- rbind(X_train, X_test)
Y_complete_final <- rbind(Y_train, Y_test)
Subject_complete_final <- rbind(Subject_train, Subject_test)

#2 - Extracts only the measurements on the mean and standard deviation for each measurement.
selected_variables <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_complete_final <- X_complete_final[,selected_variables[,1]]
head(X_complete_final)

#3 - Uses descriptive activity names to name the activities in the data set
colnames(Y_complete_final) <- "activity"
Y_complete_final$activitylabel <- factor(Y_complete_final$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_complete_final[,-1]
head(activitylabel)

#4 - Appropriately labels the data set with descriptive variable names.
colnames(X_complete_final) <- variable_names[selected_variables[,1],2]
colnames(X_complete_final)
head(colnames(X_complete_final))

#5 - From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Subject_complete_final) <- "subject"
complete_final <- cbind(X_complete_final, activitylabel, Subject_complete_final)
complete_final_mean <- complete_final %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))
write.table(complete_final_mean, file = "/Users/chiragsubramanian/Downloads/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
