# GettingCleaningDataCourseProject

##run_analysis.R Summary

The script does the following

- loads the data found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into dataframes
- adds names from feature list to the tables with the features data
- Adds names to all other datasets without descriptive names
- adds description to activity outcome data frame (only has id to start)
- filters out variables that are not the standard deviation or mean
- merges acivities with device data
- does all the above for test and training sets and then row binds them
- melts the data so the variables are in a single column
- computes averages by subject, activity, and variable into a final tidy dataset. 


#CodeBook

The final dataset contains five columns
- Subject: Id of the subject being measured. 
- Activity: Activity they were doing ...sitting,standing,etc
- Variable: name of measurement coming from device
- Count: Number of rows averaged
- Avg: Average of variable for that subject and activity

See features_info.txt in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 for detailed explanation of variables and their meanings 