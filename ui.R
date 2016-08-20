# This is the UI Code for CA Results 
# Author: Samuel Kirschner Date: 1.30.2016 Version 1.0
# install necessary packages
library(sqldf)
library(shiny)
library(shinydashboard)
library(shinythemes)
library(DT)
library(rCharts)
library(dygraphs)

shinyUI(fluidPage(
  theme = shinytheme("United"),
  
  
  
  sidebarLayout(
    sidebarPanel( tags$head(
      tags$style(type="text/css", "select { max-width: 240px; }"),
      tags$style(type="text/css", ".span4 { max-width: 290px; }"),
      tags$style(type="text/css", ".well { max-width: 280px; }")
    ),
    fluidRow(
      dateRangeInput('dateRange',
                     label = 'Date range input: yyyy-mm-dd',
                     start = Sys.Date() - 2, end = Sys.Date() + 2
      ),
      actionButton("run","Run Query"))),
    
    mainPanel(
      navbarPage("Menu",id=NULL,header=NULL,footer=NULL,
                 tabPanel("Map",fluidRow(
                   leafletOutput("mymap")
                 )))
      
      
      
    )
  ))
)