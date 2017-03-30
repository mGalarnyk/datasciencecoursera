---
title: "Reproducible Research Project 1"
author: "Michael Galarnyk"
date: "3/26/2017"
output: html_document
---

## Introduction
It is now possible to collect a large amount of data about personal movement using activity monitoring devices such as a Fitbit, Nike Fuelband, or Jawbone Up. These type of devices are part of the “quantified self” movement – a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. But these data remain under-utilized both because the raw data are hard to obtain and there is a lack of statistical methods and software for processing and interpreting the data.

This assignment makes use of data from a personal activity monitoring device. This device collects data at 5 minute intervals through out the day. The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012 and include the number of steps taken in 5 minute intervals each day.

The data for this assignment can be downloaded from the course web site:

* Dataset: [Activity monitoring data](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip) 

The variables included in this dataset are:

steps: Number of steps taking in a 5-minute interval (missing values are coded as 𝙽𝙰) </br>
date: The date on which the measurement was taken in YYYY-MM-DD format </br>
interval: Identifier for the 5-minute interval in which measurement was taken </br>
The dataset is stored in a comma-separated-value (CSV) file and there are a total of 17,568 observations in this dataset. </br>

## Loading and preprocessing the data
Unzip data to obtain a csv file.

```R
library("data.table")

fileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
download.file(fileUrl, destfile = paste0(getwd(), '/repdata%2Fdata%2Factivity.zip'), method = "curl")
unzip("repdata%2Fdata%2Factivity.zip",exdir = "data")
```

## Reading csv Data into Data.Table. 
```R
activityDT <- data.table::fread(input = "data/activity.csv")
```

## What is mean total number of steps taken per day?

1. Calculate the total number of steps taken per day

```R
Total_Steps <- activityDT[, c(lapply(.SD, sum, na.rm = TRUE)), .SDcols = c("steps"), by = .(date)] 

head(Total_Steps, 10)

#          date steps
# 1: 2012-10-01     0
# 2: 2012-10-02   126
# 3: 2012-10-03 11352
# 4: 2012-10-04 12116
# 5: 2012-10-05 13294
# 6: 2012-10-06 15420
# 7: 2012-10-07 11015
# 8: 2012-10-08     0
# 9: 2012-10-09 12811
# 10: 2012-10-10  9900
```

2. If you do not understand the difference between a histogram and a barplot, research the difference between them. Make a histogram of the total number of steps taken each day. 

```R
library(ggplot2)

png("hist1.png", width=480, height=480)

ggplot(Total_Steps, aes(x = steps)) +
    geom_histogram(fill = "blue", binwidth = 1000) +
    labs(title = "Daily Steps", x = "Steps", y = "Frequency")

dev.off()
```

3. Calculate and report the mean and median of the total number of steps taken per day

```R
Total_Steps[, .(Mean_Steps = mean(steps), Median_Steps = median(steps))]
```

## What is the average daily activity pattern?

1. Make a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

```R
IntervalDT <- activityDT[, c(lapply(.SD, mean, na.rm = TRUE)), .SDcols = c("steps"), by = .(interval)] 

ggplot(IntervalDT, aes(x = interval , y = steps)) +
    geom_line(color="blue", size=1) +
    labs(title = "Avg. Daily Steps", x = "Interval", y = "Avg. Steps per day")
```

2. Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?
```R
IntervalDT[steps == max(steps), .(max_interval = interval)]
```

## Imputing missing values

1. Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with 𝙽𝙰s)

```R
activityDT[is.na(steps), .N ]

# alternative solution
nrow(activityDT[is.na(steps),])
```

2. Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

```R
# Filling in missing values by mean of dataset. 
activityDT[is.na(steps), "steps"] <- round(activityDT[, c(lapply(.SD, mean, na.rm = TRUE)), .SDcols = c("steps")])
```

3. Create a new dataset that is equal to the original dataset but with the missing data filled in.

```R
data.table::fwrite(x = activityDT, file = "data/tidyData.csv", quote = FALSE)
```

4. Make a histogram of the total number of steps taken each day and calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

```R

# total number of steps taken per day
Total_Steps <- activityDT[, c(lapply(.SD, sum, na.rm = TRUE)), .SDcols = c("steps"), by = .(date)] 

# mean and median total number of steps taken per day
Total_Steps[, .(Mean_Steps = mean(steps), Median_Steps = median(steps))]

library(ggplot2)
ggplot(Total_Steps, aes(x = steps)) +
    geom_histogram(fill = "blue", binwidth = 1000) +
    labs(title = "Daily Steps", x = "Steps", y = "Frequency")
```

Type of Estimate | Mean_Steps | Median_Steps
--- | --- | ---
First Part (with na) | 9354.23 | 10395
Second Part (fillin in na with mean) | 10751.74 | 10656

## Are there differences in activity patterns between weekdays and weekends?

1. Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.

```R
activityDT[, dateTime := as.POSIXct(date, format = "%Y-%m-%d")]
activityDT[, `Day of Week`:= weekdays(x = dateTime)]

activityDT[grepl(pattern = "Monday|Tuesday|Wednesday|Thursday|Friday", x = `Day of Week`), "weekday or weekend"] <- "weekday"
activityDT[grepl(pattern = "Saturday|Sunday", x = `Day of Week`), "weekday or weekend"] <- "weekend"
activityDT[, `weekday or weekend` := as.factor(`weekday or weekend`)]
```

2. Make a panel plot containing a time series plot (i.e. 𝚝𝚢𝚙𝚎 = "𝚕") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.

