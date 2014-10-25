require(data.table)
require(plyr)
#Feature table
features<-read.table("UCI HAR Dataset/features.txt")

#Activity labels
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt")
names(activitylabels)<-c("activity","description")

#Training labels
traininglabels<-read.table("UCI HAR Dataset/train/y_train.txt")
names(traininglabels)<-c("activity")
#Training Data
trainingdata<-read.table("UCI HAR Dataset/train/X_train.txt",header=F)
#Traning labels based on the description
trainlabels<-data.frame(activity=join(traininglabels,activitylabels)[,"description"])

#Test lables
testlabels<-read.table("UCI HAR Dataset/test/y_test.txt")
names(testlabels)<-c("activity")
#Test data
testdata<-read.table("UCI HAR Dataset/test/X_test.txt",header=F)
#Test labels based on the description
testlabels<-data.frame(activity=join(testlabels,activitylabels)[["description"]])

#Test subject
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(subjecttest)<-c("subject")
#Traning subject
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
names(subjecttrain)<-c("subject")
#Extract only the relevant Features we need - means and standard deviations
relevantfeatures<-features[features[["V2"]] %like% c("mean\\(\\)") | features[["V2"]] %like% c("std\\(\\)"),]
testdata<-testdata[,relevantfeatures[["V1"]]]
trainingdata<-trainingdata[,relevantfeatures[["V1"]]]
#Set Appropriate column names
names(testdata)<-gsub("\\)","",gsub("\\(","",tolower(gsub("-","",relevantfeatures[["V2"]]))))
names(trainingdata)<-gsub("\\)","",gsub("\\(","",tolower(gsub("-","",relevantfeatures[["V2"]]))))

#Create test and training datasets with descriptive activities and subjects
testdata<-cbind(subjecttest,testlabels,testdata)
trainingdata<-cbind(subjecttrain,trainlabels,trainingdata)

#Finally Merge both datasets
finaldata<-rbind(testdata,trainingdata)

#Write tidy data set as CSV
write.csv(finaldata,file="output_activity_table.csv",row.names=FALSE)

#Second tidy data set
finaltidy<-ddply(finaldata,.(subject,activity),function(x){
        colMeans(x[,c(3:68)])
})

#Write second tidy data set as CSV
write.csv(finaltidy,file="output_activity_text.txt",row.names=FALSE)
