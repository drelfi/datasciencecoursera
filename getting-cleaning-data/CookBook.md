# UCI HAR Dataset Cookbook

This document describes the output of the script created for making the UCI HAR Dataset tidy.

The first topic worth to mention is the difference between variables and observations.

* Variables are all the calculated fields in addition to the grouping of the observations depending on changing factor for each observation. In this project, variables are described later in a separate section
* Observations are the values gotten while the controlled variables are fixed. 

According to tidy data definition:

1. Each variable forms a column.
1. Each observation forms a row.
1. Each type of observational unit forms a table

## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the data contains 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Output

The output of this analysis is a data frame containing the mean of all the variables calculated based on the 3-axial gyroscope and accelerometer data captured by each of the volunteers doing a particular activity.

In a glympse, the output is as follow:

   subject   |    activity.name| time.BodyAccelerometer.mean.X | time.BodyAccelerometer.mean.Y | ... 
-------------|-----------------|-------------------------------|-------------------------------|-----
       2     |      STANDING   |                  0.2779115    |               -0.01842083 | ... 
       2     |       SITTING   |                  0.2770874    |               -0.01568799 | ... 
       2     |        LAYING   |                  0.2813734    |               -0.01815874 | ... 
  ...        |       ...       |                 ...           |               ...         | ... 


## Considerations



## Variables

