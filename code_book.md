---
title: "Code book"
---

This code book summarizes the file ```tidydata.txt```.

## Identifiers

* ```subject``` - ID of the test subject (volunteer). Numeric.
    + 1 - 30: Thirty volunteers in experiments
* ```activity``` - The type of activity performed. Character.
    + WALKING
    + WALKING UPSTAIRS
    + WALKING DOWNSTAIRS
    + SITTING
    + STANDING
    + LAYING

## Measurements

Various signals from the experiments were used to estimate variables. In the following signal variables (measurements):

* ```mean()```: Mean value
* ```std()```: Standard deviation

### Variables

* ```tBodyAcc-mean()-X```: Numeric
* ```tBodyAcc-mean()-Y```: Numeric
* ```tBodyAcc-mean()-Z```: Numeric
* ```tBodyAcc-std()-X```: Numeric
* ```tBodyAcc-std()-Y```: Numeric
* ```tBodyAcc-std()-Z```: Numeric
* ```tGravityAcc-mean()-X```: Numeric
* ```tGravityAcc-mean()-Y```: Numeric
* ```tGravityAcc-mean()-Z```: Numeric
* ```tGravityAcc-std()-X```: Numeric
* ```tGravityAcc-std()-Y```: Numeric
* ```tGravityAcc-std()-Z```: Numeric
* ```tBodyAccJerk-mean()-X```: Numeric
* ```tBodyAccJerk-mean()-Y```: Numeric
* ```tBodyAccJerk-mean()-Z```: Numeric
* ```tBodyAccJerk-std()-X```: Numeric
* ```tBodyAccJerk-std()-Y```: Numeric
* ```tBodyAccJerk-std()-Z```: Numeric
* ```tBodyGyro-mean()-X```: Numeric
* ```tBodyGyro-mean()-Y```: Numeric
* ```tBodyGyro-mean()-Z```: Numeric
* ```tBodyGyro-std()-X```: Numeric
* ```tBodyGyro-std()-Y```: Numeric
* ```tBodyGyro-std()-Z```: Numeric
* ```tBodyGyroJerk-mean()-X```: Numeric
* ```tBodyGyroJerk-mean()-Y```: Numeric
* ```tBodyGyroJerk-mean()-Z```: Numeric
* ```tBodyGyroJerk-std()-X```: Numeric
* ```tBodyGyroJerk-std()-Y```: Numeric
* ```tBodyGyroJerk-std()-Z```: Numeric
* ```tBodyAccMag-mean()```: Numeric
* ```tBodyAccMag-std()```: Numeric
* ```tGravityAccMag-mean()```: Numeric
* ```tGravityAccMag-std()```: Numeric
* ```tBodyAccJerkMag-mean()```: Numeric
* ```tBodyAccJerkMag-std()```: Numeric
* ```tBodyGyroMag-mean()```: Numeric
* ```tBodyGyroMag-std()```: Numeric
* ```tBodyGyroJerkMag-mean()```: Numeric
* ```tBodyGyroJerkMag-std()```: Numeric
* ```fBodyAcc-mean()-X```: Numeric
* ```fBodyAcc-mean()-Y```: Numeric
* ```fBodyAcc-mean()-Z```: Numeric
* ```fBodyAcc-std()-X```: Numeric
* ```fBodyAcc-std()-Y```: Numeric
* ```fBodyAcc-std()-Z```: Numeric
* ```fBodyAccJerk-mean()-X```: Numeric
* ```fBodyAccJerk-mean()-Y```: Numeric
* ```fBodyAccJerk-mean()-Z```: Numeric
* ```fBodyAccJerk-std()-X```: Numeric
* ```fBodyAccJerk-std()-Y```: Numeric
* ```fBodyAccJerk-std()-Z```: Numeric
* ```fBodyGyro-mean()-X```: Numeric
* ```fBodyGyro-mean()-Y```: Numeric
* ```fBodyGyro-mean()-Z```: Numeric
* ```fBodyGyro-std()-X```: Numeric
* ```fBodyGyro-std()-Y```: Numeric
* ```fBodyGyro-std()-Z```: Numeric

## Steps in script

* Load libraries for `plyr` and `dplyr`
* The Samsung data is read in to different data sets using `read.table`.
    + List of measurements (features).
    + Activity labels.
    + Test sets: subjects, measurements (X) and activities (y).
    + Train sets: subjects, measurements (X) and activities (y).
    + Intertial signal data is not included.
* Include a `source` variable in subject data sets to indicate where the data is from and ensure traceability.
* Bind rows together (`rbind`) in test and train sets; for subjects, measurements (X) and activities (y) respectively.
* Make descriptive variable names for subject, activities and for measurements. Use the activity label data set when naming variables in activities (y) (`rename` function). Use the list of measurements (features) to name variables in measurements (X) (`names` function).
* Bind columns together (`cbind`) for all the data sets.
* Make descriptive activity names by matching on activity number (`merge` function).
* Only extract the measurements on the mean and standard deviation.
    + Use the `grepl`function
    + Look for upper and lower case versions of the word "mean" and "std" - `[Mm]ean|[Ss]td`
    + Keep variables `activity`, `subject` and `source`
    + Exclude the `meanFreq()` measurements and `activity_number` variable
* Group by subject and activity and average for each variable.
    + Use `group_by` for both subject and activiy
    + Use function `summarise_each` and apply `mean` on measurement variables
    + Exclude `source` variable in tidy data
    + The tidy data is in a "wide" format, ie. each measurement is a column.
* The tidy data is written to the file `tidydata.txt` in your working directory (`write.table` function).
