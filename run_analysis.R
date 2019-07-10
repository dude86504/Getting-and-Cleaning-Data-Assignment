#######################################################################
# GETTING AND CLEANING DATA COURSE PROJECT                            #
#######################################################################
# If you place the folder at: "C:\", the code should run properly. 


#loading packages
library(dplyr)
library(data.table)

# ########## FINDING RELEVANT FEATURES ################################

features <- read.table("C:/UCI HAR Dataset/features.txt")

# What are the relevant features?
rel.features <- c(grep("mean", features$V2, value = T), # Mean
                  grep("std", features$V2, value = T)) # Standard Dev


# What are the indices of these features? 
rel.feature.indices <- which(features$V2 %in% rel.features)

# CLEANING NAMES:
rel.features <- gsub("\\()","",rel.features) # removing ()
rel.features <- gsub("-","_",rel.features) # Changing "-" to "_"

rm(features)

########### PREPARING TRAINING DATA ###################################

# Loading and subsetting Training data.
train <- read.table("C:/UCI HAR Dataset/train/X_train.txt")
train <- train[,rel.feature.indices]

# loading subject_IDs
subject_id <- read.table("C:/UCI HAR Dataset/train/subject_train.txt") %>%
        rename(ID = V1)

# loading Activity
activity <- read.table("C:/UCI HAR Dataset/train/y_train.txt") %>%
        rename(activity = V1)

# Merging subject ID, activity with Train:
train <- cbind(subject_id,activity, train)


######################## Preparing Test Data #########################

#Loading Test Data.
test <- read.table("C:/UCI HAR Dataset/test/X_test.txt")[,rel.feature.indices]

# loading test ID
test.ID <- read.table("C:/UCI HAR Dataset/test/subject_test.txt") %>%
        rename(ID = V1)

# loading test activity
test.activity <- read.table("C:/UCI HAR Dataset/test/y_test.txt") %>%
        rename(activity = V1)

# Binding Id, activity and test data. 
test <- cbind(test.ID,test.activity,test)

################################ Merging Train & test  ##################

Complete <- rbind(train, test)
names(Complete)[3:length(names(Complete))] <- rel.features

#=========================#
# PART 1:3 Print Complete #
#=========================#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
Complete[1:10,1:7]

################################ Renaming activities ####################

#=================================#
# PART 4 Changed activity values  #
#=================================#
# - Appropriately labels the data set with descriptive variable names.

Complete$activity[Complete$activity == 1] <- "walking"
Complete$activity[Complete$activity == 2] <- "walking upstairs"
Complete$activity[Complete$activity == 3] <- "walking downstairs"
Complete$activity[Complete$activity == 4] <- "sitting"
Complete$activity[Complete$activity == 5] <- "standing"
Complete$activity[Complete$activity == 6] <- "laying"

################################ Renaming activities ####################

#=============================#
# PART 5 Print Complete.avg   #
#=============================#
# Created a new object: Complete.avg. which is the mean of all the relevant  
# variables grouped by ID and activity.

Complete.avg <- as.data.frame(Complete) %>%
        group_by(ID, activity) %>%
        summarise_all(mean)
        
Complete.avg[1:10,1:7] 

rm(activity, subject_id, test, test.activity, test.ID, train, rel.feature.indices,rel.features)


# Exporting Complete
write.csv()