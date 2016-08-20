#### Mapping Application for Bird Data #######
library(leaflet)
library(htmltools)
birds<-read.csv("BirdTestData.csv", header = TRUE)

birds$COMMON.NAME<-as.character(birds$COMMON.NAME)
birds$LOCALITY<-as.character(birds$LOCALITY)
birds$OBSERVATION.DATE<-as.Date(birds$OBSERVATION.DATE,"%m/%d/%Y")
bird_1<-subset(birds,COMMON.NAME =="American Kestrel" & OBSERVATION.DATE > "2015-01-01" & OBSERVATION.DATE < "2015-01-21")


per_falcon_map<-leaflet(bird_1) %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 3) %>%
  addCircles(lng = ~bird_1$LONGITUDE, lat = ~bird_1$LATITUDE,weight=3,
             radius = ~300
  )


per_falcon_map<-leaflet(bird_1) %>% addTiles()%>% addCircleMarkers(~bird_1$LONGITUDE, ~bird_1$LATITUDE,weight=1,
                                                                   radius = ~2, popup = ~htmlEscape(bird_1$LOCALITY))

per_falcon_map