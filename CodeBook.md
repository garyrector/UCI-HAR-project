##This document describes 
    1. The raw data
    2. Study design and summary choices made
    3. Tidy data variables

**Raw data**

    The raw data used in this work is contained in the UCI HAR Dataset. 
    
    The Inertial Signals data not used directly here was the starting point for the original investigators, 
    who produced the intermediate processed set of data used as the starting point for this work. Please see 
    the README.txt file included in the download for further information of their processing.
    
    There were no missing, null, , blank, or NaN data values discovered in any file.
    
    The intermediate "raw" data includes:
    
        activity_labels.txt, which maps activity descriptions to numeric codes
        features.txt, which lists all of the 561 variable names
        subject_train.txt, a table of subject ids for the training set observations
        subject_test.txt, a table of subject ids for the test set observations
        X_train.txt, table of 7352 training observations of 561 variables
        X_test.txt, table of 2947 test observations of 561 variables
        y_train.txt, table of activity codes for the training observations
        y_test.txt, table of activity codes for the test observations

**Study Design and Summary Choices**

    The source data was downloaded from the internet site
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    using the R function download.file() with method="auto" and then unzipped with unzip().
    
    All of the data files listed above were input by the use of read.table().
    
    Activity labels were substituted for activity codes through the use of the match() function.
    
    The variables included the tidy data sets were selected from the observations
    by using grep() to find variable names containing either "main" or "std" (case blind).
    The resulting set has 86 variables. The subject and activity variables were added to these by using cbind().
    The training and test data sets were joined by using rbind().
    
    The first tidy data set containing 10299 observations was then aggregated
    according to the course project assignment requirements. The means of the 86 mean and std variables
    were computed, grouped by activity and subject id. This was done by using aggregate().
    
**The Variables**

    The intermediate tidy data set, "TidyDataSet.txt" has 10299 observations of 88 variables, and
    the final tidy data set "TidyDataAverages.txt" has 180 observations of the same 88 variables.
    
    Quoting the original investigators (downloaded README.txt)
    with respect to the 86 continuous variables in the final data set:
    "- Features are normalized and bounded within [-1,1].
     - Each feature vector is a row on the text file."

    Because these variables are normalized, they are unitless.

    There are 2 other variables which are columns 87 and 88, respectively, of "TidyDataSet.txt"
    and columns 1 and 2, respectively of the final tidy data set "TidyDataAverages.txt": 
        subjectID, an ordinal variable with values between 1:30
        activity, a categorical variable with values in 
            ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING",LAYING")
    
    The 86 continuous variables are described in the features_info.txt file included in the download.
    In order to avoid confusion, the original investigators' variable names were preserved.
    
    In the intermediate tidy data, these variables are not aggregated, 
    but in the final tidy data, the values of these variables are the mean values
    of the corresponding intermediate tidy data variables, computed over subject and activity.
    
    These variables, columns 3-88 respectively of the final tidy data set are:

            "tBodyAcc-mean()-X" 
            "tBodyAcc-mean()-Y" 
            "tBodyAcc-mean()-Z" 
            "tBodyAcc-std()-X" 
            "tBodyAcc-std()-Y" 
            "tBodyAcc-std()-Z" 
            "tGravityAcc-mean()-X" 
            "tGravityAcc-mean()-Y" 
            "tGravityAcc-mean()-Z" 
            "tGravityAcc-std()-X" 
            "tGravityAcc-std()-Y" 
            "tGravityAcc-std()-Z" 
            "tBodyAccJerk-mean()-X" 
            "tBodyAccJerk-mean()-Y" 
            "tBodyAccJerk-mean()-Z" 
            "tBodyAccJerk-std()-X" 
            "tBodyAccJerk-std()-Y" 
            "tBodyAccJerk-std()-Z" 
            "tBodyGyro-mean()-X" 
            "tBodyGyro-mean()-Y" 
            "tBodyGyro-mean()-Z" 
            "tBodyGyro-std()-X" 
            "tBodyGyro-std()-Y" 
            "tBodyGyro-std()-Z" 
            "tBodyGyroJerk-mean()-X" 
            "tBodyGyroJerk-mean()-Y" 
            "tBodyGyroJerk-mean()-Z" 
            "tBodyGyroJerk-std()-X" 
            "tBodyGyroJerk-std()-Y" 
            "tBodyGyroJerk-std()-Z" 
            "tBodyAccMag-mean()" 
            "tBodyAccMag-std()" 
            "tGravityAccMag-mean()" 
            "tGravityAccMag-std()" 
            "tBodyAccJerkMag-mean()" 
            "tBodyAccJerkMag-std()" 
            "tBodyGyroMag-mean()" 
            "tBodyGyroMag-std()" 
            "tBodyGyroJerkMag-mean()" 
            "tBodyGyroJerkMag-std()" 
            "fBodyAcc-mean()-X" 
            "fBodyAcc-mean()-Y" 
            "fBodyAcc-mean()-Z" 
            "fBodyAcc-std()-X" 
            "fBodyAcc-std()-Y" 
            "fBodyAcc-std()-Z" 
            "fBodyAcc-meanFreq()-X" 
            "fBodyAcc-meanFreq()-Y" 
            "fBodyAcc-meanFreq()-Z" 
            "fBodyAccJerk-mean()-X" 
            "fBodyAccJerk-mean()-Y" 
            "fBodyAccJerk-mean()-Z" 
            "fBodyAccJerk-std()-X" 
            "fBodyAccJerk-std()-Y" 
            "fBodyAccJerk-std()-Z" 
            "fBodyAccJerk-meanFreq()-X" 
            "fBodyAccJerk-meanFreq()-Y" 
            "fBodyAccJerk-meanFreq()-Z" 
            "fBodyGyro-mean()-X" 
            "fBodyGyro-mean()-Y" 
            "fBodyGyro-mean()-Z" 
            "fBodyGyro-std()-X" 
            "fBodyGyro-std()-Y" 
            "fBodyGyro-std()-Z" 
            "fBodyGyro-meanFreq()-X" 
            "fBodyGyro-meanFreq()-Y" 
            "fBodyGyro-meanFreq()-Z" 
            "fBodyAccMag-mean()" 
            "fBodyAccMag-std()" 
            "fBodyAccMag-meanFreq()" 
            "fBodyBodyAccJerkMag-mean()" 
            "fBodyBodyAccJerkMag-std()" 
            "fBodyBodyAccJerkMag-meanFreq()" 
            "fBodyBodyGyroMag-mean()" 
            "fBodyBodyGyroMag-std()" 
            "fBodyBodyGyroMag-meanFreq()" 
            "fBodyBodyGyroJerkMag-mean()" 
            "fBodyBodyGyroJerkMag-std()" 
            "fBodyBodyGyroJerkMag-meanFreq()" 
            "angle(tBodyAccMean,gravity)" 
            "angle(tBodyAccJerkMean),gravityMean)" 
            "angle(tBodyGyroMean,gravityMean)" 
            "angle(tBodyGyroJerkMean,gravityMean)" 
            "angle(X,gravityMean)" 
            "angle(Y,gravityMean)" 
            "angle(Z,gravityMean)"
            
