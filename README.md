# GettingCleaningDataCourseProject

##run_analysis.R Summary

The script does the following

- loads into data frames the data found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- adds names from feature list to X_test and X_train data sets so descriptive names are available
- adds names to activity reference table and activity outcome dataset so that descriptions can be added to activity labels
- merges activity outcome to reference table to add descriptive text column
- merges outcomes with device data
- filters out variables that are not the standard deviation or mean
- does all the above for test and training sets and then row binds them
- melts the data so the variables are in a column
- computes averages by subject, activity, and variable into a final tidy dataset. 


#CodeBook

The final dataset contains five columns
- Subject: Id of the subject being measured. Anonymous so just an ID
- Activity: Activity they were doing ...sitting standing...etc
- Variable: name of data coming from device
- Count: Number of rows averaged
- Avg: Average of variable for that subject and acivity

See features_info.txt in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 for detailed explanation of variables and their meanings 