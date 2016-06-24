require(plyr) 
setwd("~/coursera") 
 ## Reading in the data from files 
features = read.table('./features.txt',header=FALSE) 
activity_labels = read.table('./activity_labels.txt',header=FALSE) 
subjectTrain = read.table('./train/subjects_train.txt',header = FALSE) 
xTrain = read.table('./train/x_train.txt',header=FALSE) 
yTrain = read.table('./train/y_train.txt',header=FALSE) 
colnames(activity_labels) = c('activityId','activity_labels') 
colnames(subjectTrain) = c('subjectId'') 
 colnames(xTrain) = features[,2] 
 colnames(yTrain) = c('activityId') 
 #####1. Merges the training and the test sets to create one data set 
 ## Making final training set by merging yTrain, subjectTrain, xTrain 
 trainingData=cbind(subjectTrain,xTrain,yTrain) 
 ## Now read in the test data 
 subjectTest = read.table('./test/subject_test.txt',header=FALSE) 
 xTest = read.table('./test/x_test.txt',header=FALSE)
 yTest = read.table('./test/y_test.txt',header=FALSE)
 colnames(subjectTest) = c('subjectTest')
 colnames(xTest) = feature[,2] 
 colnames(yTest) = "activityId" 
 ## Making final test set by merging 
 testData = cbind(subjectTest,xTest,yTest) 
 ## Combine training+test data  
 finalData = rbind(trainingData,testData) 
 colNames = colnames(finalData) 
 
 #####2. Extract only the measurements on the mean and standard deviation for each measurement 
 finalData_mean_std = finalData[,grepl("mean|std|Subject|ActivityId"),colNames] 
 
 
 #####3. Uses descriptive activity names to name the activities in the data set 
 finalData_mean_std = join(finalData,activity_labels,by="ActivityId",match='first') 
 colNames  = colnames(finalData)  
 

 

 #####4. Appropriately label the data set with descriptive activity names 
 for (i in 1:length(colNames))  
 {colNames[i] = gsub("\\()","",colNames[i])  
      colNames[i] = gsub("-std$","StdDev",colNames[i])  
      colNames[i] = gsub("-mean","Mean",colNames[i])  
      colNames[i] = gsub("^(t)","time",colNames[i])  
      colNames[i] = gsub("^(f)","freq",colNames[i])  
      colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])  
      colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])  
      colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])  
      colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])  
      colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])  
      colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])  
      colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])  
     } 
 colnames(finalData) = colNames 
 

 

 #####5. Create a second, independent tidy data set with the average of each variable for each activity and each subject 
 finalDataNoActivityType = finalData[,names(finalData) != 'activity_labels'] 
 tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean) 
 tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE) 
 write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t') 
