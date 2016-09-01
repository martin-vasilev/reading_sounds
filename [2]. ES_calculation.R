
# Martin R. Vasilev, 2016

#-----------------------------------------------#
# Script for calculating effect sizes from data #
#-----------------------------------------------#

rm(list=ls())

source("Functions/get_es.R")

# Load data:
load("Data/data.Rda")


# Calculate Effect sizes
es<- get_es(data)


# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")