###############################################
###MAP GENERATION SCRIPT

##install libraries (comment out if already installed)####
install.packages("oz")
install.packages("leaflet")
install.packages("leaflet.esri")
install.packages("RColorBrewer")
##load libraries
library(oz) #generate map of australia
library(leaflet) #load map packages
library(leaflet.esri)
library(RColorBrewer) #load colour packages

#read in data
setwd("") #set working directory
df <- read.csv('', header = TRUE, stringsAsFactors = TRUE) #read in data

levels <- levels(df$sp) #create variable with species data as levels

###create map

MAPsmaller <- leaflet() %>% 
  addEsriBasemapLayer(esriBasemapLayers$Streets, autoLabels = TRUE) %>% ###set map type
  setView( lng = 151.251869, lat = -33.696294, zoom = 5) %>% #### set map centre and zoom
  addCircleMarkers(lng = df$Longitude, lat = df$Latitude,  ####add circles, set coordinate columns
                   radius = 4, color = pal(df$sp), weight = 2, stroke = TRUE, fillOpacity = 0.85, ###circle properties, colour by species
                   fill = TRUE, label = df$subpop) %>% ### labelled by subpop 
addLegend(position = 'topleft',  ###add legend, by colours
          colors = pal(levels), 
          labels = levels, opacity = 0.5,
          title = '')%>%

addScaleBar(position = c("bottomright")) %>%# Add a Scale Bar 
  addMiniMap(position = "topleft", width = 120, height = 150, #add mini map
             collapsedWidth = 19, collapsedHeight = 19, zoomLevelOffset = -4.8,
             zoomLevelFixed = FALSE, centerFixed = FALSE, zoomAnimation = TRUE,
             toggleDisplay = FALSE, autoToggleDisplay = FALSE,
             minimized = FALSE, aimingRectOptions = list(color = "#ff7800", weight = 1, clickable = FALSE), 
             shadowRectOptions = list(color = "#000000",
             weight = 1, clickable = FALSE, opacity = 0, fillOpacity = 0),
             strings = list(hideText = "Hide MiniMap", showText = "Show MiniMap"),
             tiles = NULL, mapOptions = list())

  
MAPsmaller ###run to show final map

