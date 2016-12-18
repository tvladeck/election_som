# pres stuff

# devtools::install_github("deleetdk/USA.county.data")

setwd("~/Dropbox/Gradient/Research/Election Analysis/SOM/")


library(USA.county.data)
data(USA_county_data)
library(scales)
library(dplyr)
library(kohonen)
library(randomForest)
library(RColorBrewer) 
library(fields) 
source("som_c_plot.R")


tidy_data <- 
  USA_county_data %>% 
  filter(!is.na(dem16_frac))


tidy_data <- 
  tidy_data %>% 
  mutate(dem_votes = as.integer(dem16_frac * Total.Population),
         rep_votes = as.integer(rep16_frac * Total.Population)
  )

som_data <- 
  tidy_data %>% 
  dplyr::select(
    dem16_frac
    ,Less.Than.High.School
    ,At.Least.High.School.Diploma
    ,At.Least.Bachelor.s.Degree
    ,Graduate.Degree
    ,School.Enrollment
    ,Median.Earnings.2010.dollars
    # ,White.not.Latino.Population
    # ,African.American.Population
    # ,Native.American.Population
    # ,Asian.American.Population
    # ,Population.some.other.race.or.races
    # ,Latino.Population
    ,Children.Under.6.Living.in.Poverty
    ,Adults.65.and.Older.Living.in.Poverty
    ,Total.Population
    ,Preschool.Enrollment.Ratio.enrolled.ages.3.and.4
    ,Poverty.Rate.below.federal.poverty.threshold
    ,Gini.Coefficient
    ,Child.Poverty.living.in.families.below.the.poverty.line
    ,Management.professional.and.related.occupations
    ,Service.occupations
    ,Sales.and.office.occupations
    ,Farming.fishing.and.forestry.occupations
    ,Construction.extraction.maintenance.and.repair.occupations
    ,Production.transportation.and.material.moving.occupations
    ,White
    ,Black
    ,Hispanic
    ,Asian
    ,Amerindian
    ,Other
    ,White_Asian
    ,SIRE_homogeneity
    ,median_age
    ,Poor.physical.health.days
    ,Poor.mental.health.days
    ,Low.birthweight
    ,Teen.births
    ,Children.in.single.parent.households
    ,Adult.smoking
    ,Adult.obesity
    ,Diabetes
    ,Sexually.transmitted.infections
    ,HIV.prevalence.rate
    ,Uninsured
    ,Unemployment
    ,Violent.crime
    ,Homicide.rate
    ,Injury.deaths
    ,Infant.mortality
  ) %>% 
  na.roughfix

a <- som_data %>% scale

elec_som <- 
  xyf(a[, -1], a[, "dem16_frac"], 
      grid = somgrid(xdim = 30, ydim = 30, topo="hexagonal"))

# saved_elec_som <- elec_som
# save(saved_elec_som, file = "saved_elec_som")
load("saved_elec_som")

plotCplane(saved_elec_som, Y = T)

reg_som <- 
  som(a, grid = somgrid(xdim = 30, ydim = 30, topo="hexagonal"))

som_data <- 
  tidy_data %>% 
  dplyr::mutate(
    swing = dem16_frac / dem12_frac
  ) %>% 
  dplyr::select(
    swing
    ,Less.Than.High.School
    ,At.Least.High.School.Diploma
    ,At.Least.Bachelor.s.Degree
    ,Graduate.Degree
    ,School.Enrollment
    ,Median.Earnings.2010.dollars
    # ,White.not.Latino.Population
    # ,African.American.Population
    # ,Native.American.Population
    # ,Asian.American.Population
    # ,Population.some.other.race.or.races
    # ,Latino.Population
    ,Children.Under.6.Living.in.Poverty
    ,Adults.65.and.Older.Living.in.Poverty
    ,Total.Population
    ,Preschool.Enrollment.Ratio.enrolled.ages.3.and.4
    ,Poverty.Rate.below.federal.poverty.threshold
    ,Gini.Coefficient
    ,Child.Poverty.living.in.families.below.the.poverty.line
    ,Management.professional.and.related.occupations
    ,Service.occupations
    ,Sales.and.office.occupations
    ,Farming.fishing.and.forestry.occupations
    ,Construction.extraction.maintenance.and.repair.occupations
    ,Production.transportation.and.material.moving.occupations
    ,White
    ,Black
    ,Hispanic
    ,Asian
    ,Amerindian
    ,Other
    ,White_Asian
    ,SIRE_homogeneity
    ,median_age
    ,Poor.physical.health.days
    ,Poor.mental.health.days
    ,Low.birthweight
    ,Teen.births
    ,Children.in.single.parent.households
    ,Adult.smoking
    ,Adult.obesity
    ,Diabetes
    ,Sexually.transmitted.infections
    ,HIV.prevalence.rate
    ,Uninsured
    ,Unemployment
    ,Violent.crime
    ,Homicide.rate
    ,Injury.deaths
    ,Infant.mortality
  ) %>% 
  na.roughfix

a <- som_data %>% scale

elec_som <- 
  xyf(a[, -1], a[, "swing"], 
      grid = somgrid(xdim = 30, ydim = 30, topo="hexagonal"))

# swing_som <- elec_som
# save(swing_som, file = "swing_som")


