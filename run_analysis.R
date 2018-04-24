dl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
t<- download.file(dl,file.path("./",basename(dl)))
unzip(file.path("./",basename(dl)), exdir="UCI")


# shared files
features<- read.table(file="./UCI/UCI HAR Dataset/features.txt")
activitylabels <-read.table(file="./UCI/UCI HAR Dataset/activity_labels.txt")
names(activitylabels)<- c("Id","name")

#test Files

testXtest<- read.table(file="./UCI/UCI HAR Dataset/test/X_test.txt")
testYtest<- read.table(file="./UCI/UCI HAR Dataset/test/Y_test.txt")
testSubjecttest<- read.table(file="./UCI/UCI HAR Dataset/test/subject_test.txt")

# join to get activity names on id
names(testYtest)<-"Id"
testYtest<- merge(testYtest,activitylabels, by="Id")

#names for x_test variables are stored in second column of features
names(testXtest)<-features[,2]

#only take mean and std deviation
testXtestClean<- testXtest[,grepl("mean()",names(testXtest))   | grepl("std()",names(testXtest))    ]

testFinal<-cbind(testXtestClean, Activity=testYtest[,2],Subject=testSubjecttest[,1])
###################################3
#train Files

trainXtrain<- read.table(file="./UCI/UCI HAR Dataset/train/X_train.txt")
trainYtrain<- read.table(file="./UCI/UCI HAR Dataset/train/Y_train.txt")
trainSubjectrain<- read.table(file="./UCI/UCI HAR Dataset/train/subject_train.txt")

# join to get activity names on id
names(trainYtrain)<-"Id"
trainYtrain<- merge(trainYtrain,activitylabels, by="Id")

#names for x_test variables are stored in second column of features
names(trainXtrain)<-features[,2]

#only take mean and std deviation
trainXtrainClean<- trainXtrain[,grepl("mean()",names(trainXtrain))   | grepl("std()",names(trainXtrain))    ]

trainFinal<-cbind(trainXtrainClean, Activity=trainYtrain[,2],Subject=trainSubjectrain[,1])
###########################3
#Final datset

Final<-rbind(trainFinal,testFinal)

library(reshape)
melted<-melt(Final,id=c("Activity","Subject"))

library(dplyr)

grouped<- group_by(melted,Activity, Subject,variable)

FinalTidy<-  summarize(grouped,count=n(),Avg=mean(value))

write.table(FinalTidy,file="TidyData.txt" ,row.name = FALSE )



