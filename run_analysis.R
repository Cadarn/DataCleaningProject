##Master script to load, combine and clean the project data

FormatVariables <-function(inputNames){
  ## Function to reformat input variable names
  ## 'inputNames' is a vector of varibale names
  
  ## Return a vector of names where the names have had all punctuation characters stripped out and
  ## is entirely lower
  
  #Create an empty vector to store the new names
  newnames <- vector()
  #Loop over the list of variable names
  for (name in inputNames){
    #Delete all punctuation characters and convert to lowercase 
    newnames <-c (newnames, tolower(gsub("[[:punct:]]", "", name)))
  }
  
  return(newnames)
}

TranslateActivity <-function(label, idnames){
  ## Function to take an  activity label oand transform it into the appropriate proper name
  ## 'label' is a vector of simple labels i.e. a vector of activity numbers
  ##
  ## 'idnames' is a data.frame that has the corresponding activity ID and activity name
  ##
  ## Returns a vector of the activity names
  names <- vector()
  for (i in 1:nrow(label)){
    names <- c(names, idnames$activity[label[i,'activity']])
  }
  return(names)
}

## ------ Stage 1: Combine testing and training data into a single master set

## Main part of script to clean data
## Assumes the UCI HAR Dataset directory exists and the folder/file structure is as expected

topdir <- 'UCI HAR Dataset'

#Load the activity ids and labels
filepath <- paste(topdir, '/activity_labels.txt', sep="")
activityid <- read.table(filepath, header=FALSE)
#Label the columns appropriately
colnames(activityid) <- c('activityID', 'activity') 
#Reformat the activity labels to remove illegal characters and uppercase letters
activityid$activity <- FormatVariables(activityid$activity)

#Load the feature ids and labels
filepath <- paste(topdir, '/features.txt', sep="")
features <- read.table(filepath, header=FALSE)
#Label the columns appropriately
colnames(features) <- c('featureID', 'featurename') 
#Reformat the feature labels to remove illegal characters and uppercase letters
features$featurename <- FormatVariables(features$featurename)

#Load the training data first
trainpath <- paste(topdir, '/train/', sep="")
#Read in the subject ids
trainsubjects <- read.table(paste(trainpath, 'subject_train.txt', sep=""), sep="")
#Read in the training features
trainfeatures <- read.table(paste(trainpath, 'X_train.txt', sep=""), sep="")
#Read in the training labels
trainlabels <- read.table(paste(trainpath, 'Y_train.txt', sep=""), sep="")

#Construct labels for the data
colnames(trainsubjects) <- 'subjectid'
colnames(trainfeatures) <- features$featurename
colnames(trainlabels) <- 'activity'

#Need to switch the activity labels from ID number to actual name
trainlabels$activity <- TranslateActivity(trainlabels, activityid)

#Combine all of this into a single data.frame
train <- cbind(trainsubjects,trainfeatures,trainlabels)

#Now repeat the process for the training data
testpath <- paste(topdir, '/test/', sep="")
#Read in the subject ids
testsubjects <- read.table(paste(testpath, 'subject_test.txt', sep=""), sep="")
#Read in the test features
testfeatures <- read.table(paste(testpath, 'X_test.txt', sep=""), sep="")
#Read in the test labels
testlabels <- read.table(paste(testpath, 'Y_test.txt', sep=""), sep="")

#Construct labels for the data
colnames(testsubjects) <- 'subjectid'
colnames(testfeatures) <- features$featurename
colnames(testlabels) <- 'activity'

#Need to switch the activity labels from ID number to actual name
testlabels$activity <- TranslateActivity(testlabels, activityid)

#Combine all of this into a single data.frame
test <- cbind(testsubjects,testfeatures,testlabels)

#Combine all of the final data into a single frame 
final <- rbind(train,test)

## ------ Stage 2: Filter and manipulate the data to produce the final data set
# Find which columns contain variable means and standard deviations (std)
# Make sure to get column names rather than index
col_means <- grep('mean', names(final), value=TRUE)
col_stds <- grep('std', names(final), value=TRUE)
col_subset <- c(col_means, col_stds) 

# Add the subject ID and activity name to the column selection
restricted_cols <- c("subjectid", "activity", col_subset)

# Store restricted dataset in a varibale
restricted_data <- final[restricted_cols]

# Now calculate the mean of the data grouped by subject ID and activity type
restricted_mean <- aggregate(restricted_data[col_subset], by = list(restricted_data$activity, restricted_data$subjectid), FUN = mean)

#Renamed the grouping columns back to something descriptive i.e. subjectid, activity
names(restricted_mean) <- gsub("Group.2", "subjectid", names(restricted_mean))
names(restricted_mean) <- gsub("Group.1", "activity", names(restricted_mean))

#Write out the tidy dataset
write.table(restricted_mean, "meanData_by_activity_subjectid.txt", row.names = FALSE)
