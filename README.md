General description

In this repo  you will find a run_analysis.R code which transforms raw datasets into one tidy dataset ready for later analysis.
The code works when it is in the same folder as the folder with all the needed datasets (source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and the working directory is set there.

How the code works?

Mainly there are 5 steps that the code executes.

1)	Merging datasets (train and test) into one.
	a.	Reading all the files needed to create one dataset. (read.table function)
	b.	Assigning names to columns in those datasets. (colnames function)
	c.	Creating both full training dataset and full test dataset (adding appropriate columns by the cbind function)
	d.	Creating one full dataset (rbind function to ‘add’ rows of the full test dataset to the full training  dataset)
	e.	Printing information that the step was executed.

2)	Extracting only the measurement on the mean and standard deviation for each measurement.
	a.	Creating variable that will help to identify columns with means and standard deviations needed (colnames function for the whole dataset)
	b.	Assigning logical vector that identifies means and standard deviations needed (grepl function helps to find only the chosen names of columns)
	c.	Changing this one dataset into new one which contains dataset only with the measurement on the mean and standard deviation.
	d.	Printing information that the step was executed.

3)	Giving names to the activities in the dataset.
	a.	Adding activities’ names (merging the whole dataset with loaded dataset containing appropriate descriptions by activity_Id)
	b.	Printing information that the step was executed.

4)	Appropriately label the dataset with descriptive activity names.
	a.	Updating names of columns (reassignment of the column names by colnames function)
	b.	Executing a loop which finds in each column name specific strings, for example “-std$”, and replace it with more comprehensible strings as “StdDev” with gsub function
	c.	Printing information that the step was executed.

5)	Creating independent tidy dataset with the average of each variable for each activity and each subject.
	a.	Creating independent dataset (deleting column with activity type from the whole dataset)
	b.	Extracting the mean of each variable for each activity and each subject (6 activities x 30 subjects = 180 rows; aggregate function)
	c.	Assigning column with activity type (by merge function).
	d.	Exporting created independent tidy dataset.
	e.	Printing information that the step was executed.

