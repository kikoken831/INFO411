# Preprocessing

### LOAD LIBRARIES - install with:
#install.packages(c("kohonen", "dummies", "ggplot2", "maptools", "sp", "reshape2", "rgeos"))
library(kohonen)
library(dummies)
library(ggplot2)
library(sp)
library(maptools)
library(reshape2)
library(rgeos)

# Colour palette definition
pretty_palette <- c("#1f77b4", '#ff7f0e', '#2ca02c', '#d62728', '#9467bd', '#8c564b', '#e377c2')

### DATA PREPARATION

# Census data comes in counts of people per area. 
# To compare areas, we will convert a number of the
# stats collected into percentages. Without this, 
# the primary differentiator between the different 
# areas would be population size.

#options to explore a few different map types:
small_areas <- TRUE  # Choose between Small Areas or Electoral Districts
filter <- TRUE       # choose to filter output to Dublin area only (good for small areas)

# Load the data into a data frame
# Get the map of these areas and filter for Dublin areas.

if (small_areas){
  data_raw <- read.csv("./census_data/AllThemesTablesSA.csv")  
  ireland_map <- readShapePoly('./boundary_files/Census2011_Small_Areas_generalised20m.shp')
  #Note that the map polygons and the census data are not in the same order - rearrangement:
  data_raw <- data_raw[match(ireland_map$SMALL_AREA, data_raw$GEOGDESC),]
  idcol="GEOGDESC"
  
} else {
  data_raw <- read.csv("./census_data/AllThemesTablesED.csv")  
  names(data_raw)[1] <- "GEOGID" 
  ireland_map <- readShapePoly('./boundary_files/Census2011_Electoral_Divisions_generalised20m.shp')
  ireland_map$CSOED <- paste0("E", ireland_map$CSOED)
  #Note that the map polygons and the census data are not in the same order
  data_raw <- data_raw[match(ireland_map$CSOED, data_raw$GEOGID),]
  idcol="GEOGID"
}

#Filter now for certain counties
if (filter){
  counties <- c("Fingal", "Dublin City", "South Dublin", "Dún Laoghaire-Rathdown")
  plot_idx <- ireland_map$COUNTYNAME %in% counties
  data_raw <- data_raw[plot_idx,]
  ireland_map <- ireland_map[plot_idx,]
  rm(counties, filter, plot_idx)  
}

### -------------- Data processing -------------------------

#convert the data from summations to percentages such 
#that the characteristics of each area will be comparable.
source("./convertCSOdata.R")
data <- convertCSOdata(data_raw, idcol=idcol)

#Create SOM for Census data - simple as data is well behaved.
#remove incomplete samples:
incompletes <- which(!complete.cases(data))
#where the avr_education_level is NaN - replace with mean
data$avr_education_level[incompletes] <- mean(data$avr_education_level, na.rm=TRUE)
#recalculate after adjustment
incompletes <- which(!complete.cases(data))
if (length(incompletes) > 0){
  print(paste0("Removing ", length(incompletes), " data points that have missing values."))
  data <- data[-incompletes, ]
}
rm(incompletes)

