# Getting-and-Cleaning-Data-Course-Project
This repo was created to complete the course project for Getting and Cleaning Data.

Download and unzip the data file into your R working directory.Then, place the R source code file into the working directory.
Execute the R source code to generate the tidy data file.

Data and Variables:

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

R Code:

The R code combines the training and test datasets, and extracts partial variables to create another dataset with the mean of each variable for each activity.

Complete Dataset:

The complete dataset generated contains variables which were calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type, for all listed subjects.

The code was written in accordance with instructions for the course project. Read the training and test datasets, variable names, and subject index into RStudio.

The R Code merges the training and the test sets to create the complete set. The rbind command combines both training and test sets respectively.

Extracts only the measurements on the mean and standard deviation for each measurement. The grep command is used to get column indexes for variable name contains "mean()" or "std()"

Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor

Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
