# Processing steps
Processing is done in 5 consecutive steps according to instructions for this assignment:
* __Step 1:__ Merging training and test data sets into one data set
-- Data files for training set (*X_train.txt*, *y_train.txt* and *subject_train.txt*) are loaded using function *read.table*
-- Data files for test set (*X_test.txt*, *y_test.txt* and *subject_test.txt*) are loaded using function *read.table*
-- Test and train data sets are merged using *rbind*
-- As a result we get merged test and trainig data sets in separate tables for feature values (`x_data`), subject identifiers (`subject_data`) and activity labels (`y_data`).
* __Step 2:__ Extract only columns that contain features with mean and standard deviation
-- Descriptive feature names are loaded from file *features.txt* into variable `features`
-- Indexes for features that contain *mean()* or *std()* in their names are extracted into variable `mean_std_features`
-- Table containing feature values `x_data` is subset using index list `mean_std_features`
-- Column names in table `x_data` are set to appropriate feature names read from file *features.txt* using indexes in `mean_std_features`
* __Step 3:__ Activity codes are replaced with descriptive names
-- A single column name in table `y_data` is changed to *activity*
-- Descriptive activity names (and mapping to activity codes) are loaded from file *activity_labels.txt* into variable `activities`
-- Data in column *activity* in table `y_data` is converted to factor (using function __factor__) and labeled with descriptive names. Activity code (levels) is taken from the first column of `activities` and descriptive names (labels) from the second column of `activities`.
* __Step 4:__ Column names are set to descriptive names
-- Single coumn in table `subject_data` is named *subject_id*
* __Step 5:__ Selected features values are summarized using mean function by activity and subject
-- Features values table (variable `x_data`), activity labels table (variable `y_data`) and subject identifiers (variable `subject_data`) are merged by columns using function __cbind__ into variable `complete_data`.
-- Merged data in variable `complete_data` is melted (using function __melt__) into narrow table by columns *subject_id* and *activity* and saved in variable `narrow_table` 
-- Function __dcast__ is used on table `narrow_table` to summarize data per *subject_id* and *activity* applying __mean__ function for each of the features (in column *variable* in table `narrow_table`). Summarized data is saved in variable `final_summarized` 
-- Finally, data from table `final_summarized` is exported to CSV file *tidy_dataset.csv* using function __write.csv__. Row names are intentionally excluded.




