
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








