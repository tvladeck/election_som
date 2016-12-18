library(kohonen)
library(RColorBrewer) 
library(fields) 

# you will need this saved self-organized-map object
# saved_som <- readRDS("saved_som.rds")
load("swing_som")
saved_som <- swing_som
source("som_c_plot.R")
library(shiny)
variables_titles <- read.csv("variables_titles.csv")

shinyServer(function(input, output) {

  
  output$thePlot <- renderPlot({
    plotCplane(saved_som,
               variable = as.character(variables_titles$VARIABLE[which(variables_titles$TITLE == input$title)]),
               title = input$title)
  })
  
  output$referencePlot <- renderPlot({
    plotCplane(saved_som,
               Y = T,
               title = "Voting Swing // Red=+D / Blue=+R")
  })
  

})
