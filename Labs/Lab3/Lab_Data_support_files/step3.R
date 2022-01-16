#Step 3 - working with postcodes - This step requires prior execution of step1.R and step2.R

#Get list of Australian postcodes (from the Australian post office)
codes = read.csv("valid_postcodes.csv", sep=",")
pcodes = codes$Pcode

#recall that uPcodes contains list of unique post code numbers from the data file

#Question1: What does this next line of R-code find?
new <- uPcodes[which(!uPcodes %in% pcodes)]
print(new)

#Question2: Show how often each element in "new" occurs in "Pcodes"
#...