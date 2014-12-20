Getting_and_Cleaning_Data_Project
=================================

Ths repository contains the following documents:
- README.md, which explains how the code works.
- CODEBOOK.md, which explains the variables used.
- UCI HAR Dataset, which contains the input data (i.e. Human Activity Recognition Using Smatphones Datasetdata - www.smartlab.ws)
- runAnanlysis.R, which is a script that takes the input data from above and extracts the meaningful data and outputs this to the text file below.
- output_tidy_dataset.txt, which contains the output data once parsed and cleaned using the run_Analysis.R script.

=================================

Steps followed & logical sections in the code are as follows:
1. Reads in the UCI datasets (x_test.txt, x_train.txt, y_test.txt, y_train.txt, subject_test.txt, subject_train.txt) and merges this into one dataframe as well as features.txt and activity_labels.txt.
2. Extracts only the mean and standard deviation measurements from the combined x(test and train) results.
3. Labels the activity names appropriately.
4. Appropriately labels the dataset with more descriptive names, i.e. not shortened versions.
5. Aggregates & averages the variables for each activity and each subject then outputs this to a tidy dataset file.
