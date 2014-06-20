# 1. Merge the training and the test sets to create one data set.


#  1.1. Reading all needed datasets.
#	- for training dataset

x_Train <- read.table('./train/x_train.txt',header=F); 
y_Train <- read.table('./train/y_train.txt',header=F); 
features <- read.table('./features.txt',header=F); 
activity_Labels <- read.table('./activity_labels.txt',header=F); 
subject_Train <- read.table('./train/subject_train.txt',header=F); 

#	- for test dataset

x_Test <- read.table('./test/x_test.txt',header=F); 
y_Test <- read.table('./test/y_test.txt',header=F); 
subject_Test <- read.table('./test/subject_test.txt',header=F); 

# 	1.2. Assignment of the column names to the data read above
#	- column names for training dataset

colnames(x_Train) = features[,2];
colnames(y_Train) = "activity_Id";
colnames(activity_Labels) = c('activity_Id','activity_Type');
colnames(subject_Train) = "subject_Id";

# 	- column names for test dataset

colnames(x_Test) = features[,2];
colnames(y_Test) = 'activity_Id';
colnames(subject_Test) = 'subject_Id';

#	1.3. Creating the full datasets
# 	- full training dataset

training_Dataset <- cbind(y_Train,subject_Train,x_Train);

# 	- full test dataset

test_Dataset <- cbind(y_Test,subject_Test,x_Test);

# 	1.4. Merging training and test datasets 

all_Data <- rbind(training_Dataset,test_Dataset);

#   1.5. Information about the progress of transformations

print("Datasets merged");

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 	2.1. Creation of the vector which helps to identify columns with mean or standard deviation

col_Names <- colnames(all_Data);
mean_or_sd <- (grepl("activity..",col_Names) | grepl("subject..",col_Names) | grepl("-mean..",col_Names) & !grepl("-meanFreq..",col_Names) & !grepl("mean..-",col_Names) | grepl("-std..",col_Names) & !grepl("-std()..-",col_Names));

# 	2.2 Creation of the dataset with the given measurements. 

all_Data <- all_Data[mean_or_sd ==T];

#   2.3. Information about the progress of transformations

print("Means and standard deviations calculated")


# 3. Use descriptive activity names to name the activities in the dataset.

all_Data <- merge(all_Data,activity_Labels,by='activity_Id',all.x=T);

print("Activities' descriptions added");

# 4. Appropriately label the dataset with descriptive activity names.

col_Names <- colnames(all_Data);

for (i in 1:length(col_Names))
{
  col_Names[i] = gsub("\\()","",col_Names[i])
  col_Names[i] = gsub("-std$","StdDev",col_Names[i])
  col_Names[i] = gsub("-mean","Mean",col_Names[i])
  col_Names[i] = gsub("^(t)","time",col_Names[i])
  col_Names[i] = gsub("^(f)","frequency",col_Names[i])
  col_Names[i] = gsub("gravity","Gravity",col_Names[i])
  col_Names[i] = gsub("([Bb]ody[Bb]ody|body)","Body",col_Names[i])
  col_Names[i] = gsub("gyro","Gyro",col_Names[i])
  col_Names[i] = gsub("AccMag","AccMagnitude",col_Names[i])
  col_Names[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",col_Names[i])
  col_Names[i] = gsub("JerkMag","JerkMagnitude",col_Names[i])
  col_Names[i] = gsub("GyroMag","GyroMagnitude",col_Names[i])
};

print("Appropriate labels added");

# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
# 	5.1. Creating table without a column with activity_Labels 

colnames(all_Data) = col_Names;
independent_Data <- all_Data[,names(all_Data) !='activity_Type'];

# 	5.2. Summarizing the independent_Data to include just the mean of each variable for each activity and each subject

tidy_Dataset <- aggregate(independent_Data [,names(independent_Data) != c('activity_Id','subject_Id')],by=list(activity_Id= independent_Data$activity_Id,subject_Id = independent_Data$subject_Id),mean);

# 	5.3. Merging the tidyData with activityType to include descriptive acitvity names

tidy_Dataset <- merge(tidy_Dataset,activity_Labels,by='activity_Id',all.x=TRUE);

# 	5.4. Exporting the tidy_Dataset

write.table(tidy_Dataset, './tidy_Dataset.txt',row.names=T,sep='\t');

#   5.5. Information about the progress of transformations

print("Tidy dataset exported")
