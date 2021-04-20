run_analysis <- function (){
  library(dplyr)
  
"This script only works if the UCI HAR Dataset folder is unzipped in the working
  directory"
    
"Merging Training and test data for Measurments (X), activities (Y) and subjects"
  XMergedData <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"),read.table("./UCI HAR Dataset/test/X_test.txt"))
  YMergedData <- rbind(read.table("./UCI HAR Dataset/train/y_train.txt"),read.table("./UCI HAR Dataset/test/y_test.txt"))
  SubjectData <- rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"),read.table("./UCI HAR Dataset/test/subject_test.txt"))
  
"Attribution of descriptive activity names"
  ActivityLabel <- (read.table("./UCI HAR Dataset/activity_labels.txt"))
  YMergedData <- ActivityLabel[YMergedData[,"V1"],"V2"]
  
"Merging Subject data, activity data and all variables data"  
  MergedData <- cbind(SubjectData,YMergedData,XMergedData)
  
"Appropriately label the data set with descriptive variable names"   
  NamesTable <- read.table("./UCI HAR Dataset/features.txt")
  colnames(MergedData) <- c("Subject_Number","Activity", NamesTable[,2])
  
"Selecting Means and Std for each variable and grouping data by subject and activity"
  MergedData2 <- cbind(MergedData[,1:2], select(MergedData, contains("mean")|contains("std")))
  MergedData2 <- MergedData2%>%group_by(Subject_Number, Activity)%>%summarise_all(mean)
  
"Writing the tidy dataset"    
  write.table(MergedData2, file="Tidy_Dataset_Submission",row.names = FALSE)
}
