##load libraries

library(oz) 
library(leaflet)
library(leaflet.esri)
library(leaflet.providers)
library(RColorBrewer)

setwd("")


data <- read.csv("postcodes.csv")

bins <- c(0, 1, 2, 4, 6, 8, 10, 12, 14, 16)
pal <- colorBin("YlOrRd", domain = data$percentage, bins = bins)

MAPsmaller <- leaflet() %>% 
  addEsriBasemapLayer(esriBasemapLayers$Gray, autoLabels = TRUE) %>% 
  setView(lng = 151.239674, lat = -33.689667, zoom = 10.5) %>%
  addCircles(lng = data$Longitude, lat = data$Latitude, weight = 2,
             radius = data$percentage *110, popup = data$Postcode, color = pal(data$percentage), fillOpacity = 0.8, stroke = TRUE) %>%



  # Add a Scale Bar 
  addScaleBar(position = c("bottomright")) %>%
  addMiniMap(position = "topleft", width = 120, height = 150,
             collapsedWidth = 19, collapsedHeight = 19, zoomLevelOffset = -4.8,
             zoomLevelFixed = FALSE, centerFixed = FALSE, zoomAnimation = TRUE,
             toggleDisplay = FALSE, autoToggleDisplay = FALSE,
             minimized = FALSE, aimingRectOptions = list(color = "#ff7800", weight
                                                         = 1, clickable = FALSE), shadowRectOptions = list(color = "#000000",
                                                                                                           weight = 1, clickable = FALSE, opacity = 0, fillOpacity = 0),
             strings = list(hideText = "Hide MiniMap", showText = "Show MiniMap"),
             tiles = NULL, mapOptions = list()) %>%
############Legends
addLegend(pal=pal, values=data$percentage, opacity=0.9, title = "%", position = "bottomright" ) 

MAPsmaller

