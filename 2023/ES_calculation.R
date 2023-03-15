
# Martin R. Vasilev, 2023

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R"); source("Functions/Add_data_corr.R")
source("functions/effect_sizes.R")
#source("Functions/print_data.R")
source("functions/settings.R")


# Create general data frame, to be populated by the script:
data<- data.frame(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
colnames(data)<- c("ID", "N_C", "N_E", "sample", "cit", "year", "design", "sound", "sound_type", "db", "task", "measure", "mean_C", 
                   "var_C", "mean_E", "var_E", "var_type", "journal", "IF", "reference")

#####################
# Create a log file #
##################### 

#sink("Output/Data_entry_log.txt")

#cat(toString(Sys.time())); cat("\n"); cat("\n")
#cat("Entering data for the background sounds during reading experiments:"); cat("\n"); cat("\n")



########################
# Start coding studies #
########################


#----------------
#--- Study 1 ---#
#----------------
data<- Add_data(data, ID= 66, N_C=23, N_E = 25, sample="adults", cit= "Adam (2019)", year=2019, design="between", 
                sound="music",
                sound_type= "instrumental", db=55, task= "reading comprehension", 
                measure= "num_correct", mean_C= c(6.24+6.32)/2, var_C= c(1.27+1.30)/2, mean_E= c(6.22 + 6.06)/2, var_E= c(1.16+1.46)/2, var_type= "SD",
                journal= "Dissertation",
                reference= "Adam, E. (2019). The Influence of Background Music on Learning From Text (Doctoral dissertation, University of Geneva)."
)
# data from Table 3





#----------------
#--- Study 2 ---#
#----------------
data<- Add_data(data, ID= 67, N_C=20, N_E = 10, sample="adults", cit= "Christensen and Hansson (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "slow tempo", db=NA, task= "reading comprehension", 
                measure= "reading_rate", mean_C= 178.12, var_C= 35.41, mean_E= 178.49, var_E= 36.84, var_type= "SD",
                journal= "Dissertation",
                reference= "Christensen, T., & Hansson, T. (2018). A study of how tempo in music affects reading comprehension when consuming written news on a smartphone."
)

data<- Add_data(data, ID= 67, N_C=20, N_E = 10, sample="adults", cit= "Christensen and Hansson (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "fast tempo", db=NA, task= "reading comprehension", 
                measure= "reading_rate", mean_C= 178.12, var_C= 35.41, mean_E= 175.76, var_E= 29.85, var_type= "SD",
                journal= "Dissertation",
                reference= "Christensen, T., & Hansson, T. (2018). A study of how tempo in music affects reading comprehension when consuming written news on a smartphone."
)
# data from Table 3
# tehnically design is mixed, but the comparison we are interested in is closest to within subject


### comprehension:
data<- Add_data(data, ID= 67, N_C=20, N_E = 10, sample="adults", cit= "Christensen and Hansson (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "slow tempo", db=NA, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.42, var_C= 0.25, mean_E= 0.5, var_E= 0.16, var_type= "SD",
                journal= "Dissertation",
                reference= "Christensen, T., & Hansson, T. (2018). A study of how tempo in music affects reading comprehension when consuming written news on a smartphone."
)

data<- Add_data(data, ID= 67, N_C=20, N_E = 10, sample="adults", cit= "Christensen and Hansson (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "fast tempo", db=NA, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.42, var_C= 0.25, mean_E= 0.47, var_E= 0.17, var_type= "SD",
                journal= "Dissertation",
                reference= "Christensen, T., & Hansson, T. (2018). A study of how tempo in music affects reading comprehension when consuming written news on a smartphone."
)



#----------------
#--- Study 3 --- #
#----------------
data<- Add_data(data, ID= 68, N_C=37, N_E = 37, sample="adults", cit= "Herring and Scott (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "instrumental", db=NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 8, var_C= 1.3, mean_E= 7.4, var_E= 1.2, var_type= "SE",
                journal= "Journal of Emerging Investigators",
                reference= "Da’Naesha Herring, J. S. (2018). The Effect of Lyrical and Instrumental Music on Reading Comprehension tasks. Journal of Emerging Investigators"
)

data<- Add_data(data, ID= 68, N_C=37, N_E = 37, sample="adults", cit= "Herring and Scott (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "Spanish", db=NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 8, var_C= 1.3, mean_E= 7.4, var_E= 1.2, var_type= "SE",
                journal= "Journal of Emerging Investigators",
                reference= "Da’Naesha Herring, J. S. (2018). The Effect of Lyrical and Instrumental Music on Reading Comprehension tasks. Journal of Emerging Investigators"
)

data<- Add_data(data, ID= 68, N_C=37, N_E = 37, sample="adults", cit= "Herring and Scott (2018)", year=2018, design="within", 
                sound="music",
                sound_type= "English", db=NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 8, var_C= 1.3, mean_E= 7.1, var_E= 1.2, var_type= "SE",
                journal= "Journal of Emerging Investigators",
                reference= "Da’Naesha Herring, J. S. (2018). The Effect of Lyrical and Instrumental Music on Reading Comprehension tasks. Journal of Emerging Investigators"
)


