#install.packages("dplyr")
#install.packages("readxl")

# Commented out the above because have already been installed. Uncomment to install the packages.
library(dplyr)
library(readxl)

# Function to remove the first three columns and the first row from the GoI census file 
census_cleanup <- function(filename){
  filename = filename[-c(1), -c(1:3)]
  return(filename)
}

state_census <- function(state_nam){
  STATE_DATA <- india_statecensus[india_statecensus$Name==state_nam,]
  return(STATE_DATA)
}

filename <- read_excel("../data/PC01_A01_India_Census_2001_mod.xlsx")
india_census <- census_cleanup(filename)

india_statecensus <- india_census[india_census$Political_Subdivision=="STATE",]
india_INDIAcensus <- india_census[india_census$Political_Subdivision=="INDIA",]

print("Enter the name of the state whose data you require: ")
state_nam = readline()
india_STATEcensus <- state_census(state_nam)

india_STATEcensus <- india_STATEcensus[c(1:3),]
india_INDIAcensus <- india_INDIAcensus[c(1:3),]

