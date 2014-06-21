DataCleaningProject
===================

Project for the Getting and Cleaning Data course 
------------------------------------------------

# Introduction

This repository contains an analysis script called run_analysis.R which is designed to produce the tidy set required for the course project for the [Getting and Cleaning Data](https://class.coursera.org/getdata-004/) course.

The raw data is collected from the accelerometers from the Samsung Galaxy S smartphone as reported by Anguita et al. (2012). The data for the project is sourced from: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

A full description is available at the site where the data was obtained: 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

The project takes all of the raw data taken from 30 volunteers performing six different activities and extracts the recorded mean and standard deviations of each of the recorded variables.  From this set of features the mean of each variable is calculated grouped by volunteer and activity type.

# Instructions
1. Download the dataset ZIP file from the above link.
2. Expand the ZIP file in the same directory as the run_analysis.R script so that there is a 'UCI HAR Dataset' directory. Do not change the internal directory structure.
3. Run the analysis.R script.
4. An output file, meanData_by_activity_subjectid.txt, will be produced; see the codebook for a detailed desciption of the file contents.

# Codebook
The codebook,  code\_book.md in this repository, contains a detailed description of all variables. 
