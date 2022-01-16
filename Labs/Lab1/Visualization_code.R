#### Code to reproduce the main graphics in the lecture ####

# Note that help describing what each function does can be obtained using help(FUNCTION).

# Grab the iris dataset
data(iris)

# Extract just those rows that pertain to setosa species
setosa <- subset(iris,Species=="setosa")

hist( # Make a histogram of,
  setosa$Sepal.Width, # Sepal Width,
  main="", # with no title on top,
  xlab="Sepal Width", # horizontal axis label "Sepal Width",
  freq=FALSE) # plotting proportions rather than raw counts.

lines( # Add a series of lines
  density(setosa$Sepal.Width) # interpolating the density of Sepal Widths.
)


# Empirical CDF plot
plot( # Plot the
  ecdf(setosa$Sepal.Width), # estimated CDF of Sepal Widths,
  main="", # with no title on top,
  xlab="Sepal Width" # and horizontal axis label "Sepal Width".
) 

# Parallel boxplots
boxplot( # Make a boxplot of
  Sepal.Width~Species, # Sepal Widths broken down by Species,
  data=iris, # with columns taken from data frame iris,
  notch=FALSE, # with a notch indicating the location of the mean and the 95% CI,
  ylab="Sepal Width" # and labelling the vertical axis "Sepal Width".
)


# Box-percentile plots
#library(Hmisc) # Load library Hmisc.

#SW.by.Species <- with(iris, # Using columns of the iris data frame as variables,
#                      split(Sepal.Width, Species) # split Sepal Widths up by Species.
#                      )
#Make a box-percentile plot.
#bpplot(SW.by.Species) 

Speed <- cars$speed
Distance <- cars$dist 
plot(Speed, Distance, pch=3, col="red")


# Anscombe's quartet
# Obtain the dataset.
data(anscombe)
# Put the following four plots into a 2*2 grid, and set their margins. (See par().)
par(mfrow=c(2,2),mar=c(5,5,0,0)+.05)

for(i in 1:4){ # For each of the four datasets,
  x<-anscombe[[i]] # grab the x column,
  y<-anscombe[[i+4]] # grab the y column,
  plot(x,y, # make a scatterplot,
       xlab=paste0("x",i), # labelling horizontal axis with "x" with the index of the dataset concatenated on,
       ylab=paste0("y",i)) # labelling vertical axis with "y" with the index of the dataset concatenated on,
  abline(lsfit(x,y)) # and add a least squares regression line.
}

# Legend for colour-coding of the species
plot.new() # Create a blank plot,
legend( # and add a legend
  0, 0, # in the upper-left corner,
  levels(iris$Species), # with the individual levels of Species as labels,
  fill=2:4, # and boxes filled with colours numbered 2:4,
  ncol=3, # arranged in three columns (i.e., one row).
  )

# Scatterplot matrix
pairs(# Scatterplot matrix on
  iris[,-5], # all columns of iris but the last,
  col=as.numeric(iris$Species)+1, # coloring according to the numeric code of the species,
  pch="." # and using small dots as plotting symbols.
)

# Parallel coordinate plot
library(MASS)
parcoord(iris[,-5],col=as.numeric(iris$Species)+1)
# Parallel coordinate plot (reordered)
parcoord(iris[,c(2,1,3,4)],col=as.numeric(iris$Species)+1)

# PCA biplot
PLPW.pca <- prcomp(iris[,-5], center = TRUE, scale. = TRUE)
biplot(PLPW.pca)

# PCA plot of the importance of each component
plot(PLPW.pca,main="")

library(datasets)
data(HairEyeColor)

# Bar chart of hair colours; the full list of defined can be found at http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf (among other places)
barplot( # Barplot of,
  apply(HairEyeColor, 1, sum), # frequecies summed up for each hair colour,
        col=c("black", "burlywood4", "darkorange1", "yellow") # and using these colours for bars.
        )

# Grouped and stacked bar charts of hair colours vs. eye colours
par(mfrow=c(1,2), mar=c(4,3,0,0)+.1) # Typeset the next two plots in one row.
barplot(apply(HairEyeColor, 1:2, sum), # Focus on both eye colour and hair colour (dimensions 1 and 2) this time.
        beside=TRUE, col=c("black", "burlywood4", "darkorange1", "yellow"), xlab="Eye colour")
barplot(apply(HairEyeColor, 1:2, sum), beside=FALSE, col=c("black", "burlywood4", "darkorange1", "yellow"), xlab="Eye colour")


# Mosaic plot: eye colour on the horizontal and hair colour on the vertical axis
mosaicplot(apply(HairEyeColor, 2:1, sum), main="", color=c("black", "burlywood4", "darkorange1", "yellow"))

# Mosaic plot in three dimensions
mosaicplot(HairEyeColor, main="", color=TRUE, xlab="", ylab="")



#### Code from playing around at the end ####

# Mosaic plot: hair colour on the vertical and eye colour on the horizontal axis
mosaicplot(apply(HairEyeColor, 1:2, sum),color = TRUE)

# Jittering to distinguish overlapping points
pairs(apply(iris[,-5],2,jitter), # Apply jitter to each column individually.
      col=iris$Species,pch=".")
