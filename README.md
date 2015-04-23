---
title: "ReadMe"
author: "Garcidueñas MD"
date: "Thursday, April 23, 2015"
output: html_document
---
 
# All the files mus bu in the working directory: X_test, X_train. y_test, y_train, subject_test, subject_train and features

#The first part of the scrip works with test data (X_test, subject_test, features)
#1A read the subject_test as a factor (colClasses) and assign the name "sujeto" (colnames)
#2A read the type test file as a factor (coLClasses) an assign the name "prueba" (colnames) use the (mapvalues) function to reassing the label activity type to the y_test file 1 for Walking, 2 for walking upstairs etc
#3A the X-test was read with header=F, I assign a sequence 1:561 as the colum names (colnames)
#4A read the features file with the name of each variable measured the first as an ID (numeric) and the seccond as a factor and rename each column 
#5A I used the match function to take each name from the features file and replace each one of the X_test file
#6A I created a indicator variable for all the rows in te test file named subset creatin a reetition of "test"
#7A bind all the columns (cbind)  to create a data frame with the subject, type of activity and results in it.
#8A write the file (write.table) as test file (or train_file)

#repeat the exact same procedure for the train files markes as B

#A I use de rbind fuction to merge both tables (rbind)

#B I created 3 subsets subset= column 1:3 (subset, type, sujeto), subset1= mean of each measure (select and contain), subset2= SD of each measure (select and contain)

#C create a variable named final subset binding the 3 subsets

#D I use the melt function  usin subset, sujeto and type as "ID" and the rest of variables as "variable"

#E I used the dcast function to divide the dataset with the average of each variable for each activity and each subject

#F write a definite file as cel_data.txt


#CODEBOOK
#subset: factor variable with 2 levels "test" and "training"
#type_test: factor variable with 6 levels for the type of activity 1: walking, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS,     4 SITTING, 5 STANDING,  6 LAYING
#sujeto: number of subject 1-30
#the rest of variables are the means and SD of  body and gravity acceleration signals (BodyAcc, GravityAcc), linear acceleration and angular velocity were derived in time to obtain Jerk signals (BodyAccJerk, BodyGyroJerk), magnitude of  three-dimensional signals were using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag), Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. each variable was measured in vectro x, Y and Z
#each value indicatins mean and SD

t' to denote time
  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
'f' to indicate frequency domain signals  
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag
