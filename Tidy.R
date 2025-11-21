library(dplyr)
library(data.table)

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"

if (!file.exists(zipFile)) {
        download.file(zipUrl, zipFile, mode = "wb")
}

dat_location <- "UCI HAR Dataset"
if (!file.exists(dat_location)) {
        unzip(zipFile)
}

features <- fread(file=file.path(dat_location, "features.txt"), col.names = c("index", "featureName"))
activities <- fread(file=file.path(dat_location, "activity_labels.txt"), col.names = c("activityId", "activityLabel"))

features_Index <- grep("mean\\(\\)|std\\(\\)", features$featureName)
features_Names <- features$featureName[features_Index]

print("Reading Data...")
trainSubjects <- fread(file=file.path(dat_location, "train", "subject_train.txt"), col.names = "subject")
trainActivities <- fread(file=file.path(dat_location, "train", "y_train.txt"), col.names = "activity")
trainValues <- fread(file=file.path(dat_location, "train", "X_train.txt"), select = features_Index, col.names = features_Names)

testSubjects <- fread(file=file.path(dat_location, "test", "subject_test.txt"), col.names = "subject")
testActivities <- fread(file=file.path(dat_location, "test", "y_test.txt"), col.names = "activity")
testValues <- fread(file=file.path(dat_location, "test", "X_test.txt"), select = features_Index, col.names = features_Names)

print("Merging Data...")
train <- cbind(trainSubjects, trainValues, trainActivities)
test <- cbind(testSubjects, testValues, testActivities)
h_Act <- rbind(train, test)

colnames(h_Act) <- c("subject", features_Names, "activity")

h_Act$activity <- factor(h_Act$activity, 
                         levels = activities$activityId, 
                         labels = activities$activityLabel)

cols <- colnames(h_Act)
cols <- gsub("[\\(\\)-]", "", cols)
cols <- gsub("^t", "Time", cols)
cols <- gsub("^f", "Freq", cols)
cols <- gsub("mean", "_Mean", cols)
cols <- gsub("std", "_Std", cols)
cols <- gsub("BodyBody", "Body", cols)
cols <- gsub("X$","_X",cols)
cols <- gsub("Y$","_Y",cols)
cols <- gsub("Z$","_Z",cols)
colnames(h_Act) <- cols

print("Generating tidy data...")
h_Act_Mean <- h_Act %>% 
        group_by(subject, activity) %>%
        summarise_all(mean)

write.table(h_Act_Mean, "tidy_data.txt", row.names = FALSE, quote = FALSE)
print("tidy_data.txt is generated")