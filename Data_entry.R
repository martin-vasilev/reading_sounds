
# Martin R. Vasilev, 2016

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R")


# Create general data frame, to be populated by the script:
data<- data.frame(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
colnames(data)<- c("ID", "N", "cit", "year", "sound", "db", "task", "measure", "mean_C", 
                  "var_C", "mean_E", "var_E", "var_type", "reference")

########################
# Start coding studies #
########################

#--- Study 1

data<- Add_data(data, ID= 1, N=40, cit= "Sörqvist et al. (2010)", year=2010, sound="speech",
                db= c(70+75)/2, task= "reading comprehension", measure= "corr_answers",
                mean_C= 11.55, var_C= 2.24, mean_E= 10.58, var_E= 2.93, var_type= "SD",
                reference= "Sörqvist, P., Halin, N., & Hygge, S. (2010). Individual differences in susceptibility to the effects of speech on reading comprehension. Applied Cognitive Psychology, 24(1), 67-76. doi:10.1002/acp.1543"
                )
# data from Table 1

data<- Add_data(data, ID= 1, N=40, cit= "Sörqvist et al. (2010)", year=2010, sound="speech",
                db= c(70+75)/2, task= "reading comprehension", measure= "reading_speed",
                mean_C= 14.22, var_C= 3.00, mean_E= 14.41, var_E= 2.56, var_type= "SD",
                reference= "Sörqvist, P., Halin, N., & Hygge, S. (2010). Individual differences in susceptibility to the effects of speech on reading comprehension. Applied Cognitive Psychology, 24(1), 67-76. doi:10.1002/acp.1543"
                )
# data from Table 1

#############
# Save data #
#############

save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")
