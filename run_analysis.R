library(reshape2)

# Step 1
# Loading data into tables
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Merging training and test data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Get feature names with mean() or std() 
features <- read.table("features.txt")
mean_std_features <- grep("(mean|std)\\(\\)", features[, 2])

# Subset only columns for mean and std features
x_data <- x_data[,mean_std_features]

# Fix column names, get names from features
names(x_data) <- features[mean_std_features,2]


# Step 3
# Fix column name for activity 
names(y_data) <- "activity"

# Replace activity codes with descriptive names
activities <- read.table("activity_labels.txt")

# Convert activity codes to factor with descriptive labels
y_data$activity <- factor(y_data$activity, levels=activities[,1], labels=activities[,2])

# Step 4
# Fix column name for subject id
names(subject_data) <- "subject_id"

# Step 5
# Bind all data by columns in a single data set
complete_data <- cbind(x_data, y_data, subject_data)

# Summarize data by subject and activity
#summarized_data <- ddply(complete_data, .(subject,activity),summarize, )
narrow_table <- melt(complete_data, id=c("subject_id","activity"))
final_summarized <- dcast(narrow_table, subject_id+activity ~ variable, mean)

# Export final data set
write.table(final_summarized, "tidy_dataset.txt", row.names = FALSE)