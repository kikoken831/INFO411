#Step 2 - requires prior execution of step1.R

#Lets get some statistics...
print(paste("Number of records read:", length(data$PIN)))

#Compute number of unique Cards
num = length(unique(data$CardNumber))
print(paste("Number of unique cards: ", num))

#Compute number of unique PINs
num = length(unique(data$PIN))
print(paste("Number of unique patients: ", num))



#Now lets have a closer look at some of the attributes. Lets start with the postcodes
Pcodes=data$postcode

#list unique values
uPcodes = unique(Pcodes)
print(paste("Number of postcode areas patients live in: ", length(uPcodes)))

#list number of ocurrences for each unique value
table(uPcodes)

#Question: Does the list of postcodes contain outliers or noise points? Justify/explain your answer!
