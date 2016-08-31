
# Martin R. Vasilev, 2016

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R")
#source("Functions/print_data.R")


# Create general data frame, to be populated by the script:
data<- data.frame(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
colnames(data)<- c("ID", "N_C", "N_E", "sample", "cit", "year", "design", "sound", "sound_type", "db", "task", "measure", "mean_C", 
                  "var_C", "mean_E", "var_E", "var_type", "reference")

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
data<- Add_data(data, ID= 1, N_C=40, sample="adults", cit= "Sörqvist et al. (2010)", year=2010, design="within", 
                sound="speech",
                sound_type= "native", db= c(70+75)/2, task= "reading comprehension/ select word", 
                measure= "num_correct", mean_C= 11.55, var_C= 2.24, mean_E= 10.58, var_E= 2.93, var_type= "SD",
                reference= "Sörqvist, P., Halin, N., & Hygge, S. (2010). Individual differences in susceptibility to the effects of speech on reading comprehension. Applied Cognitive Psychology, 24(1), 67-76. doi:10.1002/acp.1543"
                )
# data from Table 1
# native speech not explicitly stated, but was deduced from the context of the paper
#a <-print_data(data, first=T)

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

data<- Add_data(data, ID= 3, N_C=14, N_E=14, sample="children", cit= "Fogelson (1973)", year=1973, design="between", 
                sound="music",
                sound_type= "popular", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 43.9, var_C= 18.8, mean_E= 35.9, var_E= 18.3, var_type= "SD",
                reference= "Fogelson, S. (1973). Music as a distractor on reading-test performance of eighth grade students. Perceptual and Motor Skills, 36(3c), 1265-1266. doi:10.2466/pms.1973.36.3c.1265"
)
# data from text


#----------------
#--- Study 4 ---#
#----------------

data<- Add_data(data, ID= 4, N_C=75, N_E=76, sample="adults", cit= "Tucker & Bushman (1991)", year=1991, design="between", 
                sound="music",
                sound_type= "rock and roll", db= 80, task= "reading comprehension", 
                measure= "num_correct", mean_C= 4.69, var_C= 2.18, mean_E= 4.68, var_E= 2.43, var_type= "SD",
                reference= "Tucker, A., & Bushman, B. J. (1991). Effects of rock and roll music on mathematical, verbal, and reading comprehension performance. Perceptual and Motor Skills, 72(3), 942-942. doi:10.2466/pms.1991.72.3.942"
)
# data from Table 1


#----------------
#--- Study 5 ---#
#----------------

data<- Add_data(data, ID= 5, N_C=24, N_E=24, sample="adults", cit= "Daoussis & McKelvie (1986)", year=1986, 
                design="between", sound="music",
                sound_type= "rock", db= 50, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8.08+10.20)/2, var_C= (3.40+3.70)/2, 
                mean_E= (8.40+6.80)/2, var_E= (2.80+1.52)/2, var_type= "SD",
                reference= "Daoussis, L., & McKelvie, S. J. (1986). Musical preferences and effects of music on a reading comprehension test for extraverts and introverts. Perceptual and Motor Skills, 62(1), 283-289. doi:10.2466/pms.1986.62.1.283"
)
# data from Table 3


#----------------
#--- Study 6 ---#
#----------------

data<- Add_data(data, ID= 6, N_C=32, sample="adults", cit= "Etaugh & Michals (1975)", year=1975, 
                design="within", sound="music",
                sound_type= "preferred", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (6.6+8.6)/2, var_C= NA, 
                mean_E= (6.9+6.6)/2, var_E= NA, var_type= "SD",
                reference= "Etaugh, C., & Michals, D. (1975). Effects on reading comprehension of preferred music and frequency of studying to music. Perceptual and Motor Skills, 41(2), 553-554. doi:10.2466/pms.1975.41.2.553"
)
# data from text


#----------------
#--- Study 7 ---#
#----------------

data<- Add_data(data, ID= 7, N_C=20, N_E=20, sample="adults", cit= "Etaugh & Ptasnik (1982)", year=1982, 
                design="between", sound="music",
                sound_type= "preferred", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 6.20, var_C= NA, 
                mean_E= 4.80, var_E= NA, var_type= "SD",
                reference= "Etaugh, C., & Ptasnik, P. (1982). Effects of studying to music and post-study relaxation on reading comprehension. Perceptual and Motor Skills, 55(1), 141-142. doi: 10.2466/pms.1982.55.1.141"
)
# data from text


#----------------
#--- Study 8 ---#
#----------------

data<- Add_data(data, ID= 8, N_C=18, N_E=18, sample="children", cit= "Kiger (1989)", year=1989, 
                design="between", sound="music",
                sound_type= "low information load", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 12.0, var_C= 0.4, 
                mean_E= 13.4, var_E= 0.4, var_type= "SD",
                reference= "Kiger, D. M. (1989). Effects of music information load on a reading comprehension task. Perceptual and Motor Skills, 69(2), 531-534. doi:10.2466/pms.1989.69.2.531"
)
# data from text

data<- Add_data(data, ID= 8, N_C=18, N_E=18, sample="children", cit= "Kiger (1989)", year=1989, 
                design="between", sound="music",
                sound_type= "high information load", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 12.0, var_C= 0.4, 
                mean_E= 11.6, var_E= 0.7, var_type= "SD",
                reference= "Kiger, D. M. (1989). Effects of music information load on a reading comprehension task. Perceptual and Motor Skills, 69(2), 531-534. doi:10.2466/pms.1989.69.2.531"
)
# data from text



#############
# Save data #
#############

save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")

# Close log file and show it:
#cat("\n"); cat("\n"); cat("###############"); cat("\n"); cat(" ALL FINISHED!"); cat("\n"); cat("###############")
#sink() # close text file
#file.show("Output/Data_entry_log.txt")
