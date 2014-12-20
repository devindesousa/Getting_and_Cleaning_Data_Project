setwd("~/Desktop/Github/Getting_and_Cleaning_Data_Project/")

install.packages("plyr")
library(plyr)

# 1. Merge the Training and test datasets to make one data set.
a <- read.table("./UCI HAR Dataset//test//X_test.txt")
b <- read.table("./UCI HAR Dataset//train/X_train.txt")
X_combined <- rbind(a, b)
c <- read.table("./UCI HAR Dataset//test//y_test.txt")
d <- read.table("./UCI HAR Dataset//train/y_train.txt")
Y_combined <- rbind(c, d)
e <- read.table("./UCI HAR Dataset//test//subject_test.txt")
f <- read.table("./UCI HAR Dataset//train/subject_train.txt")
Subjects_combined <- rbind(e, f)

# Read in other data
features <- read.table("./UCI HAR Dataset//features.txt")
activity_type <- read.table("./UCI HAR Dataset//activity_labels.txt")

colnames(Subjects_combined) <- "SubjectID"
colnames(Y_combined) <- "activityID"
colnames(X_combined) <- features[,2]

allData <- cbind(Subjects_combined, Y_combined, X_combined)

# 2. Extracts only the measurements on the mean and std for each measurement
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

X_combined <- X_combined[, mean_and_std_features]

names(X_combined) <- features[mean_and_std_features, 2]

# 3. Use descriptive activity names to name activities in dataset
Y_combined[, 1] <- activity_type[Y_combined[, 1], 2]
# Update allData
allData <- cbind(Subjects_combined, Y_combined, X_combined)

# 4. Appropriately label dataset with variable names
original_colnames <- colnames(allData)

for (i in 1:length(original_colnames)) 
{
  original_colnames[i] = gsub("\\()","",original_colnames[i])
  original_colnames[i] = gsub("^(t)","Time-",original_colnames[i])
  original_colnames[i] = gsub("^(f)","Freq-",original_colnames[i])
  original_colnames[i] = gsub("-std$"," [Standard Deviation]",original_colnames[i])
  original_colnames[i] = gsub("-mean"," [Mean]",original_colnames[i])
  original_colnames[i] = gsub("Acc","Accelerometer",original_colnames[i])
  original_colnames[i] = gsub("Gyro","Gyroscopic",original_colnames[i]) 
  original_colnames[i] = gsub("Mag","Magnitude",original_colnames[i])
  original_colnames[i] = gsub("BodyBody","Body",original_colnames[i])
};

updated_colnames <- original_colnames;
colnames(allData) <- updated_colnames;

# 5. Create Independent tidy data set with the average of each variable for each activity and each subject
output_tidy_dataset = aggregate(X_combined, by=list(activity = allData$activityID, subject=allData$SubjectID), mean)

write.table(output_tidy_dataset, "output_tidy_dataset.txt", row.names = FALSE, sep="\t")
