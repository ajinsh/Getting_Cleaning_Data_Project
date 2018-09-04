# Getting_Cleaning_Data_Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called run_analysis.R should do:-

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As per the above requirement, `run_analyis.R` does the following in below steps:

1. Download the zip file and unzip it
2. Read the activity labels and feature labels
3. Read only the columns which contain Mean and Standard Deviation as mentioned in requirement step 2)
4. Collect train values and form train data set  to form final train dataset `fin_train`
5. Do the same process as above for test data set  to form final test dataset - `fin_test`
6. Finally merge the train and test data set 
7. Clean up the colnames and replace activity with descriptive names as mentioned in requirement - Steps 3) and 4)
8. Calculate average values across all vector variables for a given subject and activity as mentioned in requirement - Step 5). Also write the output to tidy_data.txt
