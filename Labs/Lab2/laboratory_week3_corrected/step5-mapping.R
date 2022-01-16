# -------------------- MAPPING OF SMALL AREAS (GEO) --------------------------
# Plot the map of ireland, coloured by the clusters the map to show locations.

#plotting map with ggplot requires some data preprocessing.

#get the colour for each area defined in the data
cluster_details <- data.frame(id=data$id, cluster=som_cluster[som_model$unit.classif])

# WARNING - these operations are computationally heavy (~ 30 seconds).
if (small_areas){
  mappoints <- fortify(ireland_map, region="SMALL_AREA")
  mappoints <- merge(mappoints, data, by="id")
  mappoints <- merge(mappoints, cluster_details, by="id")  
} else {
  mappoints <- fortify(ireland_map, region="CSOED")
  mappoints <- merge(mappoints, data, by="id")
  mappoints <- merge(mappoints, cluster_details, by="id") 
}
rm(cluster_details)

# Finally map the areas and colour by cluster
ggplot(mappoints) + aes(long, lat, group=group, fill=factor(cluster)) + geom_polygon()  + coord_equal() + scale_fill_manual(values = pretty_palette)
#+ geom_path(colour="white", alpha=0.5, size=0.2) # if you want an outline

