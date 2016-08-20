library(leaflet)
library(htmltools)
library(shiny)

shinyServer(function(input,output){
  
output$mymap<-renderLeaflet({
  birds<-read.csv("BirdTestData.csv", header = TRUE)
  
  birds$COMMON.NAME<-as.character(birds$COMMON.NAME)
  birds$LOCALITY<-as.character(birds$LOCALITY)
  birds$OBSERVATION.DATE<-as.Date(birds$OBSERVATION.DATE,"%m/%d/%Y")
  bird_1<-subset(birds,COMMON.NAME =="American Kestrel" & OBSERVATION.DATE > "2015-01-01" & OBSERVATION.DATE < "2015-01-21")
  
  
bird_map<-leaflet(bird_1) %>% addTiles()%>% addCircleMarkers(~bird_1$LONGITUDE, ~bird_1$LATITUDE,weight=1,
                                                                   radius = ~2, popup = ~htmlEscape(bird_1$LOCALITY))
bird_map
}
)
})