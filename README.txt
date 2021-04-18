
The script must be run with the samsung folder "UCI HAR Dataset" pasted in the work directory (must be unzipped)

Q1 : The training and test datasets are merged (training data first, test data second)

Q4 : For practical reasons the variable names are attributed to the columns now

Q2 : For each pattern, the mean and standard deviation are selected from main dataset based on the column name (first all the means, then the std)

Q3 : The activity index is retrieved and a name is attributed to each measure based on the Activity label .txt file in the folder

Q5 : The test subject is attributed to each measurement, the dataset is divided by group (first by subject, then by activity) for which the means are calculated for all the variables