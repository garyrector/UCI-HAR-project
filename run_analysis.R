###----------------------------------------------------------------------------
### Coursera, Getting and Cleaning Data, February 2015
### Project assignment submitted by G.Rector
### This script implements a solution based on the dataset referenced below:
###             Davide Anguita, Alessandro Ghio, Luca Oneto, 
###             Xavier Parra and Jorge L. Reyes-Ortiz. 
###             Human Activity Recognition on Smartphones using a Multiclass 
###             Hardware-Friendly Support Vector Machine. 
###             International Workshop of Ambient Assisted Living (IWAAL 2012). 
###             Vitoria-Gasteiz, Spain. Dec 2012
###----------------------------------------------------------------------------
### This script assumes that the file 
###     "https://d396qusza40orc.cloudfront.net/
###     getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
### has been downloaded and unzipped and that the working directory
### is set to either the "UCI HAR Dataset" directory as created by the unzip
### or to a directory containing all of the contents of UCI HAR Dataset.
### 
### This script creates and writes the following files:
###     "AnalysisLog.txt"       execution run-time log
###     "DataSummary.txt"       summary of data analyzed
###     "TidyDataSet.txt"       tidy data from steps 1:4 of the assignment
###     "TidyDataAverages.txt"  final tidy data set from step 5
###
### A few rows of the TidyDataAverages set are also printed on the console.
### All temp variables and data frames are removed except TidyDataAverages.
###----------------------------------------------------------------------------
###             First, read the training and test sets, count variables
###----------------------------------------------------------------------------
write(paste(Sys.time(),"----- run_analysis.R execution log -----")
      ,file="AnalysisLog.txt")
trainobs <- read.table("train/X_train.txt")
testobs <- read.table("test/X_test.txt")
otrain <- nrow(trainobs)
otest <- nrow(testobs)
v <- ncol(trainobs)
write(paste(Sys.time(),"Training and test observation data read")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Read the corresponding subject data tables and name the columns
###----------------------------------------------------------------------------
trainsubj <- read.table("train/subject_train.txt")
testsubj <- read.table("test/subject_test.txt")
colnames(trainsubj)[1] <- "subjectID"
colnames(testsubj)[1] <- "subjectID"
write(paste(Sys.time(),"Subject data read")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Read the corresponding activity labels and data tables
###----------------------------------------------------------------------------
activity <- read.table("activity_labels.txt")
trainact <- read.table("train/y_train.txt")
testact <- read.table("test/y_test.txt")
write(paste(Sys.time(),"Activity data read")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Replace the activity id values with corresponding labels
###----------------------------------------------------------------------------
trainact <- activity[match(trainact$V1,activity$V1),2]
testact <- activity[match(testact$V1,activity$V1),2]
write(paste(Sys.time(),"Activity numeric values replaced with labels")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Bind the subject and activity variables to the observations
###----------------------------------------------------------------------------
trainset <- cbind(trainobs,trainsubj,trainact)
testset <- cbind(testobs,testsubj,testact)
colnames(trainset)[v+2] <- "activity"
colnames(testset)[v+2] <- "activity"
write(paste(Sys.time(),"Subject and activity variables joined to observations")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Bind the training and test sets into a single table
###----------------------------------------------------------------------------
fullset <- rbind(trainset,testset)
write(paste(Sys.time(),"Training and test data sets combined into one set")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Get the variable names that are means or standard deviations
###----------------------------------------------------------------------------
varnames <- read.table("features.txt")
m <- grep("mean",tolower(varnames$V2),fixed=TRUE)
s <- grep("std",tolower(varnames$V2),fixed=TRUE)
keep = sort(c(m,s))
n <- length(keep)
write(paste(Sys.time(),"Mean and standard deviation variables identified")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Keep just these columns of data plus subjectID and activity
###----------------------------------------------------------------------------
tidyset <- fullset[,c(keep,v+1,v+2)]
colnames(tidyset)[1:n] <- as.character(varnames[keep,2])
write(paste(Sys.time(),"First tidy data set created")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Create averages of tidy data grouped by subject and activity
###----------------------------------------------------------------------------
TidyDataAverages <- aggregate(tidyset[,1:n]
                        ,by=list(tidyset$subjectID,tidyset$activity),FUN=mean)
colnames(TidyDataAverages)[1:2] <- c("subjectid","activity")
write(paste(Sys.time(),"Final tiny data set of averages created")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Output tidy data files 
###----------------------------------------------------------------------------
write.table(tidyset,"TidyDataSet.txt",row.name=FALSE)
write.table(TidyDataAverages,"TidyDataAverages.txt",row.name=FALSE)
print(head(TidyDataAverages))
write(paste(Sys.time(),"Tiny data set files written")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Output summary file 
###----------------------------------------------------------------------------
write("----- Data Summary -----"
      ,file="DataSummary.txt")
write(paste("Number of training observations:",otrain)
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of test observations:",otest)
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of variables, including subjects and activities:",v+2)
      ,file="DataSummary.txt",append=TRUE)
write("Subjects in training set:"
      ,file="DataSummary.txt",append=TRUE)
write(unique(trainsubj[,1])
      ,file="DataSummary.txt",append=TRUE)
write("Subjects in test set:"
      ,file="DataSummary.txt",append=TRUE)
write(unique(testsubj[,1])
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of activities:",nrow(activity))
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of observations in tidy set 1:",otrain+otest)
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of variables in tidy set 1:",n+2)
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of observations in Averages set:",nrow(TidyDataAverages))
      ,file="DataSummary.txt",append=TRUE)
write(paste("Number of variables averaged by activity and subject:",n)
      ,file="DataSummary.txt",append=TRUE)
write(paste(Sys.time(),"Summary file written")
      ,file="AnalysisLog.txt",append=TRUE)
###----------------------------------------------------------------------------
###             Clean up and exit
###----------------------------------------------------------------------------
remove(activity,fullset,testobs,testset,testsubj,tidyset,trainobs,trainset
       ,trainsubj,testact,trainact,otest,otrain
       ,v,varnames,m,s,keep,n)
write(paste(Sys.time(),"run_analysys.R completed")
      ,file="AnalysisLog.txt",append=TRUE)
print(paste(Sys.time(),"run_analysys.R completed"))
###----------------------------------------------------------------------------