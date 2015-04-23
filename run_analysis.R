#PROYECTO GETTING AND CLEANING DATA

#libraries used
library(dplyr)
library(plyr)
library (reshape2)
library(data.table)

#all the files are in working directory

#1A
suj_test = read.table ("subject_test.txt", header=F, colClasses = c("factor"))
suj_test = data.frame(suj_test); colnames (suj_test) = "sujeto"   #assign a name "sujeto"
# 2A
type_test = read.table ("y_test.txt", header=F, colClasses = c("factor"))
type_test = data.frame(type_test); colnames (type_test) = "prueba"   #assign a name "sujeto"
type_test = mapvalues(type_test$prueba,  from = c("1", "2", "3", "4", "5", "6"), to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"), warn_missing = TRUE)
#3A
result_test = read.table ("X_test.txt", header=F) #resultados de todas las pruebas
colnames (result_test)= seq(1:561)
#4A
features_test = read.table ("features.txt", header=F, colClasses = c("numeric", "factor"))
colnames (features_test) = c("code", "name")
#5A
names(result_test) = features_test [match(names(result_test), features_test[, "code"]), "name"]
#6A
x= "Test"
subset = rep (x, 2947)
#7A
Test_file = cbind (subset, suj_test, type_test, result_test)
write.table(Test_file, file="Test.txt")

#open train files 
suj_test = read.table ("subject_train.txt", header=F, colClasses = c("factor"))
suj_test = data.frame(suj_test); colnames (suj_test) = "sujeto"   #assign a name "sujeto"
# tipo de actividad asiganda a cada sujeto
type_test = read.table ("y_train.txt", header=F, colClasses = c("factor"))
type_test = data.frame(type_test);  colnames (type_test) = "prueba"   #assign a name "sujeto"
type_test = mapvalues(type_test$prueba,  from = c("1", "2", "3", "4", "5", "6"), to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"), warn_missing = TRUE)

#valores obtenidos en cada prueba
result_test = read.table ("X_train.txt", header=F) #resultados de todas las pruebas
colnames (result_test)= seq(1:561)
#renombrar las columnas de result_test según el archivo features_test
names(result_test) = features_test [match(names(result_test), features_test[, "code"]), "name"]
#merge all columns with an indicator of Test
y= "Train"
subset = rep (y, 7352)
head (subset)
Train_file = cbind (subset, suj_test, type_test, result_test)
head(Train_file)
write.table(Train_file, file="Train.txt")

#merge both files train and test
final_file = rbind (Test_file, Train_file)
dim (final_file)
write.table(final_file, file="final.txt",  row.name=FALSE)

final= read.table ("final.txt", header=T)
final= data.table(final)
dim(final)
subset = select(final, 1:3)
subset1 = select(final, contains("mean"))
subset2 = select(final, contains("std"))
head(subset)
final_subset= cbind (subset, subset1, subset2)
head(final_subset)
write.table(final_subset, file="final_subset.txt",  row.name=FALSE)

cel_meas = read.table ("final_subset.txt", header=T)
cel_meas = data.table (cel_meas)

cel_melt = melt(cel_meas, id=c("subset", "sujeto", "type_test"))
cel_data = dcast(cel_melt, subset + type_test + sujeto ~ variable, mean)
dim (cel_data)

write.table (cel_data, "cel_data.txt", row.name=FALSE)
