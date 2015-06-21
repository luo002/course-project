#unzip downloaded files

unzip("getdata-projectfiles-UCI HAR Dataset (1).zip")

set working dir
#read/scan into table

x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")

x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")

features<-read.table("features.txt")
activity_labels<-read.table("activity_labels.txt")

subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")

#1, understand the data
dim(x_test)
dim(y_test)
dim(subject_test)
dim(x_train)
dim(y_train)
dim(subject_train)
dim(features)
head(features)
head(y_test)
head(subject_train)

#qustion 1 Merges the training and the test sets to create one data set.
#1.1merges y_train,subject_train,x_train
train_set<-cbind(y_train,subject_train,x_train)
#name columns for tain_set
colnames(train_set)<-c("subject","Activity",as.character(features[,2]))
#1.2merges y_test,subject_test,x_test
test_set<-cbind(y_test,subject_test,x_test)
#name the columns of the test data
colnames(test_set)<-c("subject","Activity",as.character(features[,2]))
#1.3combine the test and train datas
whole_data<-rbind(train_set,test_set)

#question 2 Extracts only the measurements on the mean and standard deviation for each measurement.
#doesnot work: subset (whole_data, colnames(whole_data)=="mean")
#does not work:data_extract<-select(whole_data,subject,Activity,matches("mean"))
meanstd<-grep("mean|std", names(whole_data), value=TRUE)
data_extract<-whole_data[,c("subject","Activity",meanstd)]
#question 3:Uses descriptive activity names to name the activities in the data set
#first copy activity_labels.txt
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING
whole_data$subject<-factor(whole_data$subject,levels=c(1,2,3,4,5,6),labels= c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

#question 4
#Appropriately labels the data set with descriptive variable names.
#I did it in the question 1.2
#question 5
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
data.table(whole_data)
#whole_data_tidy<-whole_data%.% group_by(subject,Activity)%.%mutate(subjectm = mean(subject),Activitym=mean(Activity))%.%
data_tidy<-aggregate(.~subject +Activity, whole_data,mean)

write.table(data_tidy, file = ("tidydata.txt"))
