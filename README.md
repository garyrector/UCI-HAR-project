##Coursera Getting and Cleaning Data course project

**The work here implements a solution based on the dataset referenced below:**

             Davide Anguita, Alessandro Ghio, Luca Oneto, 
             Xavier Parra and Jorge L. Reyes-Ortiz. 
             Human Activity Recognition on Smartphones using a Multiclass 
             Hardware-Friendly Support Vector Machine. 
             International Workshop of Ambient Assisted Living (IWAAL 2012). 
             Vitoria-Gasteiz, Spain. Dec 2012
             
**The files contained in this repo are:**

*    README.md ..............This file -- start reading here to understand my submission
*    run_analysis.R .........R script to read raw data and prepare final tidy data set
*    CodeBook.md ............Markdown file that describes the raw data, variables, analysis, and output data
*    AnalysisLog.txt ........Example run-time execution log output from the R script above
*    DataSummary.txt ........Example summary file output from script
*    TidyDataSet.txt ........Intermediate tidy data output from script
*    TidyDataAverages.txt ...Final tidy data file output from script

**The script run_analysis.R assumes:**

*    The original raw dataset has been downloaded and unzipped
*    Dataset is "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
*    Working directory contains the contents of the UCI HAR Dataset created by the unzip
*    The data contained in the Inertial Signals directories is not needed (see CodeBook for explanation)
*    Sufficient memory and disk space is available

**The processing and analysis done by run_analysis.R is:**

*    Read observation data files, subject data files,
        activity data files, activity description file, and variable description file.
*    Replace the activity numeric codes with character string labels.
*    Replace the variable names with the meaningful descriptive names provided by original investigators.
*    Identify the variables that contain mean or standard deviation observations.
*    Filter out all of the variables that are not mean or std values.
*    Create an intermediate filtered tidy data set that joins the training and test data sets,
        and joins the subject and activity observations.
*    Create a final tidy data set that contains the mean values of the intermediate tidy data,
        where the mean is grouped by the activity and subject.
*    Write the intermediate and final tidy data sets to disk files.
*    Create a disk file logging execution steps to verifying performance and completeness,
        and a disk file containing a summary of the data processed and output.


    

    
    
    
