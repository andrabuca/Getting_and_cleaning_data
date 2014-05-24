##CodeBook





### Data used
Run_analysis.r uses data collected from the accelerometers from the Samsung Galaxy S smartphone, collected and made available from the following link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

### Variables
Train and test data, together with their features and labels are being read in the file one by one. The names selected for the variables are suggestive for their purpose and easy to follow through the code.

### Computations
Both train and test data are being read in the workspace and merged into one data set. Labels for activities are being read and assigned to the variables. Only variables of mean and standard deviation for each activity are being used for further processing.Using a for loop, means are calculated for each activity variable and saved as a new tidy dataset. The final dataset is suggestively labelled and saved as a txt file. 
 
