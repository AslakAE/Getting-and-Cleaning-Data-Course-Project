# README

This is a project delivery for the Coursera course "Getting and Cleaning Data", which is a course in the Data Science specialization by Johns Hopkins University. The intention of the script is to use wearable computing data from a publication [1] and prepare a tidy data set that can be used for later analysis. 

## Getting started

There are some prerequisites for ensuring that the script will work on your machine:

* The data from the publication [1] must be in your working directory.
    + The data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
* The following R packages must be installed on your computer:
    + `plyr`
    + `dplyr`
    
## Summary of steps in script

An in-depth walkthrough of the steps in the script is presented in the code book.

1. The Samsung data is read in to different data sets.
    + List of measurements (features) and activity labels.
    + Test sets: subjects, measurements (X) and activities (y).
    + Train sets: subjects, measurements (X) and activities (y).
    + Intertial signal data is not included.
2. Include a `source` variable to indicate where the data is from and ensure traceability.
3. Bind rows together in test and train sets; for subjects, measurements (X) and activities (y) respectively.
4. Bind columns together for all the data sets, after making descriptive variable names.
5. Make descriptive activity names.
6. Only extract the measurements on the mean and standard deviation.
    + Exclude the `meanFreq()` measurements
7. Group by subject and activity and average for each variable.
    + The tidy data is in a "wide" format, ie. each measurement is a column.
8. The tidy data is written to the file `tidydata.txt` in your working directory.


The `tidydata.txt` file can be viewed using the following commands:
```{r eval=FALSE}
myTidyData <- read.table("tidydata.txt", header=TRUE, stringsAsFactors = FALSE)
View(myTidyData)
```

## Acknowledgments

Data is gathered from the following publication:

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012