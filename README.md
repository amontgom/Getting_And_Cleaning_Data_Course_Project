#Getting and Cleaning Data, Course Project

##The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.


##Review criteria:
1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.


##You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##The analysis script, run_analysis.R:
1. Loads the training/test data from an already-local and unzipped directory.
2. Merges the three groups of training and test data, X, Y, and subject, into a single training+test dataset per group
3. Extracts only the mean and standard deviation information from the X dataset, and creates a new dataset with it
4. Applies appropriate column names to all three datasets, drawing from features.txt (for X), activity_labels.txt (for Y), and applying subject numbers (for the subject data)
5. Binding the columns of Y and subject to X, applying new labels
6. Writes out this full dataset (fullData.txt)
7. Averages the data per subject number and activity type (i.e. creates the tidy data)
8. Removes extraneous labels
9. Writes out this averaged dataset (averagedData.txt)
