Code Book

Majority of the descriptions are taken from the site with the source of the datasets:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

1)	Variables

Mainly there are two datasets – train and test one.  In each of them for each record it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
In all_Dataset (produced in the fourth step) there are 10299 observations of 21 variables.
In tidy_Dataset (produced in the fifth step) there are 180 observations of 21 variables.
For both datasets names of variables are the same. The difference is that in the latter you will find a mean of the variables presented in the former.
activity_Id – from 1 to 6
subject_Id  - from 1 to 30 (30 people who participated in the experiment)
time(…) – measurements of time and frequency body acceleration etc. 
activity_Type – walking, walking upstairs, walking downstairs, sitting, standing, laying

2)	Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

3)	Transformations
All the transformations and work performed to clean up the data are described in README.md file and the run_analysis.R code in this repo.
