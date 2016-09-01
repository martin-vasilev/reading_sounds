
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

colnames(es)<- c("ID", "cit", "year", "design", "sound", "sound_type", "db",
                 "task", "measure", "d", "var_d", "g", "var_d")


# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")