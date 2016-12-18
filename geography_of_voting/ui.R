library(kohonen)
library(RColorBrewer) 
library(fields) 

# you will need this saved self-organized-map object
saved_som <- readRDS("saved_som.rds")
source("som_c_plot.R")
library(shiny)
variables_titles <- read.csv("variables_titles.csv")


shinyUI(fluidPage(

  titlePanel("A Self-Organized Map of Voting Patterns in the US"),
  
  # Sidebar with a slider input for number of bins
  
  fluidRow(
    column(12, sidebarPanel(
      selectInput("title", label = h3("Select variable"),
                  choices = variables_titles$TITLE,
                  selected = variables_titles$TITLE[2])
    ))
  ),
  
  fluidRow(
        column(5, plotOutput("thePlot", width="100%")),
        column(5, plotOutput("referencePlot", width="100%"))
  )
  
  
  # sidebarLayout(
  #   sidebarPanel(
  #     selectInput("title", label = h3("Select variable"),
  #                 choices = variables_titles$TITLE,
  #                 selected = variables_titles$TITLE[1])
  #   ),
  # 
  #   # Show a plot of the generated distribution
  #   mainPanel(
  #     fluidRow(
  #       column(6, plotOutput("thePlot")),
  #       column(6, plotOutput("referencePlot"))
  #     )
  #   )
  # )
))
