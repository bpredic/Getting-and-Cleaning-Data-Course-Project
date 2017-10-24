# Assignment for Getting and Cleaning Data Course
In order to demonstrate data cleaning skills in this assignment, data from ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) was used.

### In order to successfully run the submitted R script following steps must be taken
- R script file (run_analysis.R) must be copied in the working directory
- A ZIP archive containing data must be downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- Downloaded data archive file must be unzipped into the working directory
-- Files *features.txt* and *activity_labels.txt* should be located in the same directory as script *run_analysis.R* (working directory)
-- Training data (files *X_train.txt*, *y_train.txt* and *subject_train.txt*) should be located in subdirectory *train*
-- Test data (files *X_test.txt*, *y_test.txt* and *subject_test.txt*) should be located in subdirectory *test*
-- Files listed above are the only files from the data set that are used for this assignment. Data set archive contains other files that are not used.
- Script (*run_analysis.R*) uses __reshape2__ package to be installed. The script loads that library in the first line.

When script successfully completes execution a tidy data set is saved in a TXT formatted file *tidy_dataset.txt* (resulting file is included in this repository).

Script internals are explained in detail in [CodeBook](CodeBook.md)