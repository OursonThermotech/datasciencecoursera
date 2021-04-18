run_analysis <- function (){
  library(dplyr)
  
"This script only works if the UCI HAR Dataset folder is unzipped in the working
  directory"
    
"Q1 : Merging Training and test data"
  MergedData <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"),read.table("./UCI HAR Dataset/test/X_test.txt"))
 
"Q4 : Appropriately label the data set with descriptive variable names"   
  NamesTable <- read.table("./UCI HAR Dataset/features.txt")
  colnames(MergedData) <- NamesTable[,2]
  
"Q2 : Selecting Means and Std for each variable"
  Mean_Std_Data <- select(MergedData, contains("mean")|contains("std"))
  
"Q3 : Descriptive activity names"
  YMergedData <- rbind(read.table("./UCI HAR Dataset/train/y_train.txt"),read.table("./UCI HAR Dataset/test/y_test.txt"))
  ActivityLabel <- (read.table("./UCI HAR Dataset/activity_labels.txt"))
  Mean_Std_Data <- cbind(Activity = ActivityLabel[YMergedData[,"V1"],"V2"],Mean_Std_Data)
  
"Q5 : "  
  "Subject number attribution"
  SubjectData <- rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"),read.table("./UCI HAR Dataset/test/subject_test.txt"))
  Mean_Std_Data <- cbind(Subject_Number = SubjectData[,"V1"],Mean_Std_Data)
  MergedData2 <- Mean_Std_Data%>%group_by(Subject_Number, Activity)%>%summarise_all(mean)
  return(MergedData2)
}