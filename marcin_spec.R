# file for marcin

# libraries you will need
library(kohonen)
library(RColorBrewer) 
library(fields) 

# you will need this saved self-organized-map object
saved_som <- readRDS("saved_som.rds")

# you will need this plotting function
source("som_c_plot.R")

# this is the reference plot
plotCplane(saved_som, Y = T, title = "HRC Voting Share")

# all other plots work like this
# plotCplane(saved_som, VARIABLE, title = TITLE)
# VARIABLES and TITLES stored in separate CSV


