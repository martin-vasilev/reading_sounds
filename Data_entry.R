
# Martin R. Vasilev, 2016

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R")


# Create general data frame, to be populated by the script:
data<- data.frame(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
colnames(data)<- c("ID", "N_C", "N_E", "sample", "cit", "year", "design", "sound", "sound_type", "db", "task", "measure", "mean_C", 
                  "var_C", "mean_E", "var_E", "var_type", "reference")

########################
# Start coding studies #
########################

#----------------
#--- Study 1 ---#
#----------------
data<- Add_data(data, ID= 1, N_C=40, sample="adults", cit= "Sörqvist et al. (2010)", year=2010, design="within", 
                sound="speech",
                sound_type= "native", db= c(70+75)/2, task= "reading comprehension/ select word", 
                measure= "num_correct", mean_C= 11.55, var_C= 2.24, mean_E= 10.58, var_E= 2.93, var_type= "SD",
                reference= "Sörqvist, P., Halin, N., & Hygge, S. (2010). Individual differences in susceptibility to the effects of speech on reading comprehension. Applied Cognitive Psychology, 24(1), 67-76. doi:10.1002/acp.1543"
                )
# data from Table 1
# native speech not explicitly stated, but was deduced from the context of the paper

data<- Add_data(data, ID= 1, N_C=40, sample="adults", cit= "Sörqvist et al. (2010)", year=2010, design="within", sound="speech",
                sound_type= "native", db= c(70+75)/2, task= "reading comprehension/ select word", 
                measure= "reading_speed", mean_C= 14.22, var_C= 3.00, mean_E= 14.41, var_E= 2.56, var_type= "SD",
                reference= "Sörqvist, P., Halin, N., & Hygge, S. (2010). Individual differences in susceptibility to the effects of speech on reading comprehension. Applied Cognitive Psychology, 24(1), 67-76. doi:10.1002/acp.1543"
                )
# data from Table 1
# native speech not explicitly stated, but was deduced from the context of the paper


#----------------
#--- Study 2 ---#
#----------------

# noise vs silence, proportion correct
data<- Add_data(data, ID= 2, N_C=70, N_E=50, sample="children", cit= "Ljung et al. (2009)", year=2009, 
                design="between", sound="noise", sound_type= "traffic", db= 62, 
                task= "select word", measure= "prop_correct", mean_C= 0.69, var_C= 0.19, mean_E= 0.66,
                var_E= 0.18, var_type= "SD",
                reference= "Ljung, R., Sörqvist, P., & Hygge, S. (2009). Effects of road traffic noise and irrelevant speech on children's reading and mathematical performance. Noise and Health, 11(45), 194-198."
)
# data from Table 2

# noise vs silence, reading speed
data<- Add_data(data, ID= 2, N_C=70, N_E=50, sample="children", cit= "Ljung et al. (2009)", year=2009, 
                design="between", sound="noise", sound_type= "traffic", db= 62, 
                task= "select word", measure= "reading_speed", mean_C= 38.19, var_C= 4.48, mean_E= 33.74,
                var_E= 8.09, var_type= "SD",
                reference= "Ljung, R., Sörqvist, P., & Hygge, S. (2009). Effects of road traffic noise and irrelevant speech on children's reading and mathematical performance. Noise and Health, 11(45), 194-198."
)
# data from Table 2

# noise vs speech, proportion correct
data<- Add_data(data, ID= 2, N_C=70, N_E=66, sample="children", cit= "Ljung et al. (2009)", year=2009, 
                design="between", sound="speech", sound_type= "babble", db= 62, 
                task= "select word", measure= "prop_correct", mean_C= 0.69, var_C= 0.19, mean_E= 0.72,
                var_E= 0.15, var_type= "SD",
                reference= "Ljung, R., Sörqvist, P., & Hygge, S. (2009). Effects of road traffic noise and irrelevant speech on children's reading and mathematical performance. Noise and Health, 11(45), 194-198."
)
# data from Table 2

# noise vs speech, reading speed
data<- Add_data(data, ID= 2, N_C=70, N_E=66, sample="children", cit= "Ljung et al. (2009)", year=2009, 
                design="between", sound="speech", sound_type= "babble", db= 62, 
                task= "select word", measure= "reading_speed", mean_C= 38.19, var_C= 4.48, mean_E= 37.18,
                var_E= 4.96, var_type= "SD",
                reference= "Ljung, R., Sörqvist, P., & Hygge, S. (2009). Effects of road traffic noise and irrelevant speech on children's reading and mathematical performance. Noise and Health, 11(45), 194-198."
)
# data from Table 2

#----------------
#--- Study 3 ---#
#----------------



#############
# Save data #
#############

save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")


