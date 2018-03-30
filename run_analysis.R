# Gather libraries
library(plyr)
library(dplyr)

# Assumes Samsung data is in your directory
# TRAIN
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# TEST
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# FEATURES AND LABELS
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Create "source" columns to indicate where the data comes from
subject_train <- mutate(subject_train, source = "train")
subject_test <- mutate(subject_test, source = "test")

# Bind rows for subject, X, y respectively first
subject_comb <- rbind(subject_train, subject_test)
y_comb <- rbind(y_train, y_test)
X_comb <- rbind(X_train, X_test)

# Name variables correctly for subject, X, and y file
# subjects: one operation is sufficient - change variable name
subject_comb <- rename(subject_comb, subject = V1)
# y and activity labels: Change variable names
y_comb <- rename(y_comb, activity_number = V1)
activity_labels <- rename(activity_labels, f_activity_number = V1, activity = V2)
y_comb <- rename(y_comb, activity = V2)
# X: use features.txt to set correct variable names for X data set
names(X_comb) <- features$V2

# Bind columns to create one data set
merged <- cbind(subject_comb, y_comb, X_comb)

# Use the activity labels provided
merged <- merge(merged, activity_labels, by.x = "activity_number", by.y = "f_activity_number", all = TRUE)

# X: filter for mean and standard deviation measurements, keep the other most important variables
merged <- merged[ , grepl("[Mm]ean|[Ss]td|activity|subject|source", names(merged))]
merged <- merged[ , !grepl("meanFreq|activity_number", names(merged))]

# Tidy data: group by subject and activity, use mean function for measurements, hide other variables
tidy_data <- merged %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean)) %>%
  select(-source)

write.table(tidy_data, file = "./tidydata.txt", row.names = FALSE)
