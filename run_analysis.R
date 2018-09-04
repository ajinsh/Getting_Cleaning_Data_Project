## 0. Load the necessary packages
library(reshape2)

## 1. Download the zip file and unzip it
furl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(furl,destfile="./HAR.zip")
unzip("HAR.zip")

## 2. Read the activity labels and feature labels
actL<-read.table("./UCI HAR Dataset/activity_labels.txt")
feat<-read.table("./UCI HAR Dataset/features.txt")

## 3. Read only the columns which contain Mean and Standard Deviation as mentioned 
## in Req.- Step 3)
fil_featI<-grep(".*mean.*|.*std.*", feat[,2])
fil_featL<-feat[fil_featI,2]

## 4. Collect train values and form train data set - fin_train

trAct<-file("UCI HAR Dataset/train/y_train.txt")
trainAct<-read.table(trAct)
colnames(trainAct)<-"activity"

trVal<-file("UCI HAR Dataset/train/X_train.txt")
trainVal<-read.table(trVal)[fil_featI]
colnames(trainVal) <- as.vector(fil_featL)


trsubj<-file("UCI HAR Dataset/train/subject_train.txt")
trsubject<-read.table(trsubj)
colnames(trsubject)<-"subject"

fin_train<-cbind(trsubject,trainAct,trainVal)

## 5. Do the same process as for test data set - fin_test
tsAct<-file("UCI HAR Dataset/test/y_test.txt")
testAct<-read.table(tsAct)
colnames(testAct)<-"activity"

tsVal<-file("UCI HAR Dataset/test/X_test.txt")
testVal<-read.table(tsVal)[fil_featI]
colnames(testVal) <- as.vector(fil_featL)


tstsubj<-file("UCI HAR Dataset/test/subject_test.txt")
testsubject<-read.table(tstsubj)
colnames(testsubject)<-"subject"


fin_test<-cbind(testsubject,testAct,testVal)

##6. Finally merge the train and test data set 

fin_data<-rbind(fin_train,fin_test)

##7. Clean up the colnames and replace activity with descriptive names as mentioned in 
## Req - Steps 3 and 4

colnames(fin_data)<-gsub("[()-]","",colnames(fin_data))
colnames(fin_data)<-gsub("mean","Mean",colnames(fin_data))
colnames(fin_data)<-gsub("std","Std",colnames(fin_data))
fin_data$activity<-factor(fin_data$activity,levels=actL[,1],labels = actL[,2])

##8. Calculate average values across all vector variables for a given subject and activity
## as mentioned in Req - Step 5. Also write the output to tidy_data.txt
melted_data<-melt(fin_data,id.vars =c(1:2),measure.vars = -c(1:2) )
mean_meltdata<-dcast(melted_data,subject+activity~variable,mean)


write.table(mean_meltdata,file = "tidy_data.txt", row.names=FALSE, col.names= TRUE)