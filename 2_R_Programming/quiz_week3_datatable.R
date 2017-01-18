library(datasets)
library(data.table)
iris_dt <- as.data.table(iris)

# 1 There will be an object called 'iris' in your workspace. 
# In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

# Basic data.table syntax below .
#iris_dt[ essentially SQL Where class, select statement, groupby]
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]

# 3 
# what is the absolute difference between the average horsepower of 
# 4-cylinder cars and the average horsepower of 8-cylinder cars? (interest whole number)
mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))
