#Question 1
#Write a loop to spell out the letters of your family name one letter at a time.
for(i in strsplit("KendrickKee","")[[1]]){
  print(i)
}
ln <- "Japit"
for(i in 1:nchar(ln)){
  print(substring(ln,i,i))
}
#Question 2
#1. Load the dataset into R by installing rattle.data, loading the package, 
#and then typing data(weather). Look at its help file by typing help(weather).
install.packages("rattle.data")
library("rattle.data")
data(weather)
help(weather)
#2 Make parallel (side-by-side) boxplots of MinTemp grouped by RainTomorrow 
#using the function boxplot. Does the lowest temperature attained that day
#appear to be associated with whether it rains the next day?
boxplot(MinTemp~RainTomorrow,data=weather,main="Minimum temperature grouped by days where it rains tomorrow",
        xlab = "Will it rain tomorrow?", ylab = "Minimum temperature")
boxplot(MinTemp~RainTomorrow,data=weather,main="Min Temperature vs Rain Tomorrow",xlab="Minimum Temperature",ylab="Rain Tomorrow",notch = TRUE,varwidth = TRUE,col = c("green","red"))

#3 Using the hist function, make a histogram of the variable Sunshine. 
#Comment on the distribution.
#(I.e., unimodiality vs. bimodality, skewness, outliers, etc.)
hist(weather$Sunshine,main = "Distribution of Sunshine",
     sub = "Bi-Modal Distribution",xlab="Sunshine levels on day")
hist(weather$Sunshine, xlab="The number of hours of bright sunshine in the day",col = "green",border = "red", breaks = 100)
#4 Using the table function, make a contingency table from the RainTomorrow and WindGustDir variables
#in the weather data. Then, using this table, 
#make a mosaic plot of WindGustDir against RainTomorrow.
#Which orientation (i.e., which variable on the horizontal and which on vertical)
#is more informative in this case?
#(Hint: Transpose the table to change the orientation). 
#Comment on any patterns you observe.

q4 <- table(data.frame("Rain Tomorrow" = weather$RainTomorrow,"Wind Direction" = weather$WindGustDir))
mosaicplot(q4)
q4 <- table(data.frame("Wind Direction" = weather$WindGustDir,"Rain Tomorrow" = weather$RainTomorrow))
mosaicplot(q4, color = TRUE)

#5. Using the pairs function, make a scatterplot matrix of all the quantitative variables in the dataset, colouring the points according to whether it rains the next day. Comment on any major patterns you see. In particular,
#(a) Which pairs of variables appear to have the strongest correlation? Why do you think they do?
#(b) Which variables have the best ”separation” between rainy and non-rainy tomorrows? That is, which variables are good discriminators for rain on the following day irrespective of the other variables?
#Hint: If the dataset has been loaded into a data frame named weather, you can extract just the quantitative variables using the following code:
#weather[, sapply(weather, is.numeric)]
#5a
ds <- weather[,sapply(weather, is.numeric)]
pairs(ds,col=weather$RainTomorrow)
