# Quiz data.table code Week 1 

# Reading in data
quiz_data <- fread('hw1_data.csv')

# Column names of the dataset 
names(quiz_data)

# First two rows 
quiz_data[c(1,2)]

# Number of rows in data.table
nrows(quiz_data)

# Extracting the last 2 rows of the data.table (either expression would work) 
tail(quiz_data,2)
quiz_data[c(.N-1,.N)]

# Removing Missing Values 
quiz_data[complete.cases(quiz_data),]

# Ozone values are above 31 and Temp values are above 90. etc
quiz_data[Ozone > 31 & Temp > 90]