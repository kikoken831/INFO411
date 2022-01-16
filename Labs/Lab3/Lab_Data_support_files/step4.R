#Step 4 - working with dates - This step requires prior execution of step1.R

#get all date of births (DOB)
dates = data$DOB
bdates <- as.Date(dates, "%d%B%Y");

ubdates = unique(bdates)
print(paste("Number of unique DOBs: ", length(ubdates)))

ubdates[order(as.Date(ubdates, format="%Y-%m-%d"))]

#Question: Does the list of DOBs contain outliers or noise points? Justify/explain your answer!



#more on dates...
#The data file in assignment 1 has a date field that contains Date + time in microseconds
#To compute a taxi drivers' speed we need to know the time difference between two data points.
#How to compute differences in time among the entries in the data file?
#The following example shows this...

#Say we have a list of date+time in the format of the taxi-driver dataset
datelist = c('2014-02-01 00:00:24.6+01','2014-02-01 00:00:24.0+01','2014-02-12 02:10:14.8+01')

#R can convert this into standard form as follows:
dlstandard = as.POSIXlt(datelist)

#differences in time:
diff1 = dlstandard[1] - dlstandard[2]
diff2 = dlstandard[2] - dlstandard[3]

print(paste("First time difference:  ", diff1))
print(paste("Second time difference: ", diff2))

#Do you notice a problem here?
#Lets look at the two date objects
diff1;diff2

#Thus, diff1 is expressed in seconds, diff2 is expressed in days

#Solution: use difftime to control the time units as follows:
diff1 = difftime(dlstandard[1], dlstandard[2])
diff2 = difftime(dlstandard[2], dlstandard[3])

print(paste("First time difference:  ", diff1))
print(paste("Second time difference: ", diff2))
