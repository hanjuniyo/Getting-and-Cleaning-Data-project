# Getting-and-Cleaning-Data-project
Coursera 3rd course 4th week

This repository contains the R script and documentation for the Coursera "Getting and Cleaning Data" course project.

### Project Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Dataset

Human Activity Recognition Using Smartphones Data Set

### Files in this Repository

CodeBook.md: A code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

tidy.R: The R script that performs the data preparation and then followed by the 5 steps required as described in the course project's definition.

tidy_data.txt: The exported final data set created by the tidy.R script.

### How to run the script

Ensure you have R installed on your system.

Install the required packages dplyr and data.table if they are not already installed.

`install.packages("dplyr")`
`install.packages("data.table")`

Download the run_analysis.R file to your local machine.

Set your working directory in R to the folder where you saved the script.

Run the script:

`source("tidy.R")`

The script will automatically:

1) Download the dataset zip file (if not present).

2) Unzip the data.

3) Read the training and test datasets.

4) Merge data.

5) Generate a file named tidy_data.txt in your working directory.