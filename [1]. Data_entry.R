
# git add -A && git commit -m "Your Message"

# Martin R. Vasilev, 2016

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R"); source("Functions/Add_data_corr.R")
source("functions/effect_sizes.R")
#source("Functions/print_data.R")

###############################
# Settings #

r<- 0.5; save(r, file= "data/r.Rda")

###############################


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


#------------------------------------------------------------------------------------------------------------#
#                                             Correlation studies:                                           #
#------------------------------------------------------------------------------------------------------------#


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
                mean_E= (6.9+6.6)/2, var_E= NA, var_type= NA,
                reference= "Etaugh, C., & Michals, D. (1975). Effects on reading comprehension of preferred music and frequency of studying to music. Perceptual and Motor Skills, 41(2), 553-554. doi:10.2466/pms.1975.41.2.553"
)


#----------------
#--- Study 7 ---#
#----------------

data<- Add_data(data, ID= 7, N_C=20, N_E=20, sample="adults", cit= "Etaugh & Ptasnik (1982)", year=1982, 
                design="between", sound="music",
                sound_type= "preferred", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 6.20, var_C= NA, 
                mean_E= 4.80, var_E= NA, var_type= NA,
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


#----------------
#--- Study 9 ---#
#----------------

# classical music:
data<- Add_data(data, ID= 9, N_C=49, N_E=49, sample="adults", cit= "Miller & Schyb (1989)", year=1989, 
                design="between", sound="music",
                sound_type= "classical", db= 47.5, task= "reading comprehension", 
                measure= "num_correct", mean_C= (6.8+9.8)/2, var_C= (0.5+0.6)/2, 
                mean_E= (8.8+8.8)/2, var_E= (0.6+0.8)/2, var_type= "SE",
                reference= "Miller, L. K., & Schyb, M. (1989). Facilitation and interference by background music. Journal of Music Therapy, 26(1), 42-54. doi:10.1093/jmt/26.1.42"
)
# data from Table 4


# pop music:
data<- Add_data(data, ID= 9, N_C=49, N_E=49, sample="adults", cit= "Miller & Schyb (1989)", year=1989, 
                design="between", sound="music",
                sound_type= "pop", db= 47.5, task= "reading comprehension", 
                measure= "num_correct", mean_C= (6.8+9.8)/2, var_C= (0.5+0.6)/2, 
                mean_E= (9.9+8.5)/2, var_E= (0.7+0.4)/2, var_type= "SE",
                reference= "Miller, L. K., & Schyb, M. (1989). Facilitation and interference by background music. Journal of Music Therapy, 26(1), 42-54. doi:10.1093/jmt/26.1.42"
)
# data from Table 4


# vocal music:
data<- Add_data(data, ID= 9, N_C=49, N_E=49, sample="adults", cit= "Miller & Schyb (1989)", year=1989, 
                design="between", sound="music",
                sound_type= "vocal", db= 47.5, task= "reading comprehension", 
                measure= "num_correct", mean_C= (6.8+9.8)/2, var_C= (0.5+0.6)/2, 
                mean_E= (7.2+6.0)/2, var_E= (0.4+0.6)/2, var_type= "SE",
                reference= "Miller, L. K., & Schyb, M. (1989). Facilitation and interference by background music. Journal of Music Therapy, 26(1), 42-54. doi:10.1093/jmt/26.1.42"
)
# data from Table 4


#-----------------
#--- Study 10 ---#
#-----------------

# There is some discrepancy between the abstract and the Method regarding the number of participants
# I take the number from the Method, which is arguably more reliable. 

data<- Add_data(data, ID= 10, N_C=56, sample="adults", cit= "Doyle & Furnham (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "vocal", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (4.79+4.86)/2, var_C= (2.63+2.85)/2, 
                mean_E= (6.29+4.18)/2, var_E= (2.76+2.93)/2, var_type= "SD",
                reference= "Doyle, M., & Furnham, A. (2012). The distracting effects of music on the cognitive test performance of creative and non-creative individuals. Thinking Skills and Creativity, 7(1), 1-7. doi:10.1016/j.tsc.2011.09.002"
)
# data from Table 1 (overall measure)


#-----------------
#--- Study 11 ---#
#-----------------

data<- Add_data(data, ID= 11, N_C=334, sample="children", cit= "Anderson & Fuller (2010)", year=2010, 
                design="within", sound="music",
                sound_type= "lyrical", db= 75, task= "reading comprehension", 
                measure= "num_correct", mean_C= 30.56, var_C= 10.21, 
                mean_E= 26.49, var_E= 10.70, var_type= "SD",
                reference= "Anderson, S. A., & Fuller, G. B. (2010). Effect of music on reading comprehension of junior high school students. School Psychology Quarterly, 25(3), 178-187. doi:10.1037/a0021213"
)
# data from Table 2


#-----------------
#--- Study 12 ---#
#-----------------

# noise:
data<- Add_data(data, ID= 12, N_C=76, sample="children", cit= "Furnham & Strbac (2002)", year=2002, 
                design="within", sound="noise",
                sound_type= "office", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (24.33+23.53)/2, var_C= (3.37+2.87)/2, 
                mean_E= (21.58+16.08)/2, var_E= (5.28+4.48)/2, var_type= "SD",
                reference= "Furnham, A., & Strbac, L. (2002). Music is as distracting as noise: The differential distraction of background music and noise on the cognitive test performance of introverts and extraverts. Ergonomics, 45(3), 203-217. doi:10.1080/00140130210121932"
)
# data from Table 1


# music:
data<- Add_data(data, ID= 12, N_C=76, sample="children", cit= "Furnham & Strbac (2002)", year=2002, 
                design="within", sound="music",
                sound_type= "vocal/unfamiliar", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (24.33+23.53)/2, var_C= (3.37+2.87)/2, 
                mean_E= (23.00+17.36)/2, var_E= (3.97+2.54)/2, var_type= "SD",
                reference= "Furnham, A., & Strbac, L. (2002). Music is as distracting as noise: The differential distraction of background music and noise on the cognitive test performance of introverts and extraverts. Ergonomics, 45(3), 203-217. doi:10.1080/00140130210121932"
)
# data from Table 1


#-----------------
#--- Study 13 ---#
#-----------------

# classical music:
data<- Add_data(data, ID= 13, N_C=45, sample="children", cit= "Mullikin & Henk (1985)", year=1985, 
                design="within", sound="music",
                sound_type= "classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8.63+8.13+7.63+8.50+9.25)/5,
                var_C= (1.408+ 1.356+1.768+1.604+0.886)/5, 
                mean_E= (9.50+8.75+8.38+9.50+9.75)/5, var_E= (0.535+0.707+1.685+0.926+0.462)/5, var_type= "SD",
                reference= "Mullikin, C. N., & Henk, W. A. (1985). Using music as a background for reading: An exploratory study. Journal of Reading, 353-358."
)
# data from Table on p.356 (top)

# rock music:
data<- Add_data(data, ID= 13, N_C=45, sample="children", cit= "Mullikin & Henk (1985)", year=1985, 
                design="within", sound="music",
                sound_type= "rock", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8.63+8.13+7.63+8.50+9.25)/5,
                var_C= (1.408+ 1.356+1.768+1.604+0.886)/5, 
                mean_E= (7.13+7.50+7.13+7.63+8.75)/5, var_E= (2.167+2.204+2.295+1.598+0.886)/5, var_type= "SD",
                reference= "Mullikin, C. N., & Henk, W. A. (1985). Using music as a background for reading: An exploratory study. Journal of Reading, 353-358."
)
# data from Table on p.356 (top)

#-----------------
#--- Study 14 ---#
#-----------------

# vocal music:
data<- Add_data(data, ID= 14, N_C=19, N_E=20, sample="children", cit= "Avila et al. (2011)", year=2011, 
                design="between", sound="music",
                sound_type= "vocal/ familiar", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.42, var_C= 0.50, 
                mean_E= 9.15, var_E= 0.66, var_type= "SE",
                reference= "Avila, C., Furnham, A., & McClelland, A. (2011). The influence of distracting familiar vocal music on cognitive performance of introverts and extraverts. Psychology of Music, 40(1), 84-93. doi:10.1177/0305735611422672"
)
# data from Table 2

# instrumental music:
data<- Add_data(data, ID= 14, N_C=19, N_E=19, sample="children", cit= "Avila et al. (2011)", year=2011, 
                design="between", sound="music",
                sound_type= "instrumental/ familiar", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.42, var_C= 0.50, 
                mean_E= 6.74, var_E= 0.98, var_type= "SE",
                reference= "Avila, C., Furnham, A., & McClelland, A. (2011). The influence of distracting familiar vocal music on cognitive performance of introverts and extraverts. Psychology of Music, 40(1), 84-93. doi:10.1177/0305735611422672"
)
# data from Table 2


#-----------------
#--- Study 15 ---#
#-----------------

# classical music, comprehension:
data<- Add_data(data, ID= 15, N_C=43, N_E=46, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 13.57, var_E= 8.95, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# classical music, reading speed:
data<- Add_data(data, ID= 15, N_C=43, N_E=46, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "classical", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 696.54, var_E= 159.65, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1


# pop music, comprehension:
data<- Add_data(data, ID= 15, N_C=43, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "pop", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 13.62, var_E= 6.40, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# pop music, reading speed:
data<- Add_data(data, ID= 15, N_C=43, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "pop", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 704.05, var_E= 159.83, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# semi-classical music, comprehension:
data<- Add_data(data, ID= 15, N_C=43, N_E=40, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "semi-classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 12.95, var_E= 5.09, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# semi-classical music, reading speed:
data<- Add_data(data, ID= 15, N_C=43, N_E=40, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "semi-classical", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 695.25, var_E= 148.27, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1


# jazz music, comprehension:
data<- Add_data(data, ID= 15, N_C=43, N_E=37, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "jazz", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 12.22, var_E= 7.68, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# jazz music, reading speed:
data<- Add_data(data, ID= 15, N_C=43, N_E=37, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "jazz", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 716.59, var_E= 111.45, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1


#-----------------
#--- Study 16 ---#
#-----------------

data<- Add_data(data, ID= 16, N_C=61, N_E=62, sample="adults", cit= "Fendrick (1937)", year=1937, 
                design="between", sound="music",
                sound_type= "semi-classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 33.69, var_C= 1.11, 
                mean_E= 29.58, var_E= 1.11, var_type= "SE",
                reference= "Fendrick, P. (1937). The influence of music distraction upon reading efficiency. The Journal of Educational Research, 31(4), 264-271. doi:10.1080/00220671.1937.10880749"
)
# data from Table 2


#-----------------
#--- Study 17 ---#
#-----------------

# classical music:
data<- Add_data(data, ID= 17, N_C=19, N_E=17, sample="adults", cit= "Henderson et al. (1945)", year=1945, 
                design="between", sound="music",
                sound_type= "classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 49.2, var_C= NA, 
                mean_E= 46.1, var_E= NA, var_type= NA,
                reference= "Henderson, M. T., Crews, A., & Barlow, J. (1945). A study of the effect of music distraction on reading efficiency. Journal of Applied Psychology, 29(4), 313-317. doi:10.1037/h0056128"
)
# data from Table 1

# pop music:
data<- Add_data(data, ID= 17, N_C=19, N_E=14, sample="adults", cit= "Henderson et al. (1945)", year=1945, 
                design="between", sound="music",
                sound_type= "pop", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 49.2, var_C= NA, 
                mean_E= 22.9, var_E= NA, var_type= NA,
                reference= "Henderson, M. T., Crews, A., & Barlow, J. (1945). A study of the effect of music distraction on reading efficiency. Journal of Applied Psychology, 29(4), 313-317. doi:10.1037/h0056128"
)
# data from Table 1


#-----------------
#--- Study 18 ---#
#-----------------

# classical lyrical music:
data<- Add_data(data, ID= 18, N_C=13, N_E=13, sample="adults", cit= "Miller (2014)", year=2014, 
                design="between", sound="music",
                sound_type= "classical lyrical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 15.077, var_C= 2.139, 
                mean_E= 13.154, var_E= 2.304, var_type= "SD",
                reference= "Miller, C. (2014). The differentiated effects of lyrical and non-lyrical music on reading comprehension. Master's thesis dissertation. Retrieved from http://rdw.rowan.edu/cgi/viewcontent.cgi?article=1351&context=etd"
)
# data from Table 1

# classical non-lyrical music:
data<- Add_data(data, ID= 18, N_C=13, N_E=17, sample="adults", cit= "Miller (2014)", year=2014, 
                design="between", sound="music",
                sound_type= "classical non-lyrical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 15.077, var_C= 2.139, 
                mean_E= 15.294, var_E= 1.212, var_type= "SD",
                reference= "Miller, C. (2014). The differentiated effects of lyrical and non-lyrical music on reading comprehension. Master's thesis dissertation. Retrieved from http://rdw.rowan.edu/cgi/viewcontent.cgi?article=1351&context=etd"
)
# data from Table 1

# rock lyrical music:
data<- Add_data(data, ID= 18, N_C=13, N_E=11, sample="adults", cit= "Miller (2014)", year=2014, 
                design="between", sound="music",
                sound_type= "rock lyrical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 15.077, var_C= 2.139, 
                mean_E= 14.182, var_E= 2.400, var_type= "SD",
                reference= "Miller, C. (2014). The differentiated effects of lyrical and non-lyrical music on reading comprehension. Master's thesis dissertation. Retrieved from http://rdw.rowan.edu/cgi/viewcontent.cgi?article=1351&context=etd"
)
# data from Table 1

# rock non-lyrical music:
data<- Add_data(data, ID= 18, N_C=13, N_E=18, sample="adults", cit= "Miller (2014)", year=2014, 
                design="between", sound="music",
                sound_type= "rock non-lyrical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 15.077, var_C= 2.139, 
                mean_E= 14.111, var_E= 2.042, var_type= "SD",
                reference= "Miller, C. (2014). The differentiated effects of lyrical and non-lyrical music on reading comprehension. Master's thesis dissertation. Retrieved from http://rdw.rowan.edu/cgi/viewcontent.cgi?article=1351&context=etd"
)
# data from Table 1


#-----------------
#--- Study 19 ---#
#-----------------

# complex music:
data<- Add_data(data, ID= 19, N_C=16, N_E=16, sample="adults", cit= "Furnham & Allass (1999)", year=1999, 
                design="between", sound="music",
                sound_type= "complex", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8.00+8.00)/2, var_C= (2.83+2.88)/2, 
                mean_E= (6.88+9.00)/2, var_E= (0.99+2.67)/2, var_type= "SD",
                reference= "Furnham, A., & Allass, K. (1999). The influence of musical distraction of varying complexity on the cognitive performance of extroverts and introverts. European Journal of Personality, 13(1), 27-38. doi:10.1002/(SICI)1099-0984(199901/02)13:1<27::AID-PER318>3.0.CO;2-R"
)
# data from Table 1

# simple music:
data<- Add_data(data, ID= 19, N_C=16, N_E=16, sample="adults", cit= "Furnham & Allass (1999)", year=1999, 
                design="between", sound="music",
                sound_type= "simple", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8.00+8.00)/2, var_C= (2.83+2.88)/2, 
                mean_E= (7.50+8.25)/2, var_E= (1.41+2.25)/2, var_type= "SD",
                reference= "Furnham, A., & Allass, K. (1999). The influence of musical distraction of varying complexity on the cognitive performance of extroverts and introverts. European Journal of Personality, 13(1), 27-38. doi:10.1002/(SICI)1099-0984(199901/02)13:1<27::AID-PER318>3.0.CO;2-R"
)
# data from Table 1

#-----------------
#--- Study 20 ---#
#-----------------

# pop music:
data<- Add_data(data, ID= 20, N_C=10, N_E=10, sample="adults", cit= "Furnham & Bradley (1997)", year=1997, 
                design="between", sound="music",
                sound_type= "pop", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (9.0+9.6)/2, var_C= (2.00+1.67)/2, 
                mean_E= (6.2+9.2)/2, var_E= (1.48+1.10)/2, var_type= "SD",
                reference= "Furnham, A., & Bradley, A. (1997). Music while you work: The differential distraction of background music on the cognitive test performance of introverts and extraverts. Applied Cognitive Psychology, 11(5), 445-455. doi:10.1002/(SICI)1099-0720(199710)11:5<445::AID-ACP472>3.0.CO;2-R"
)
# data from Table 1


#-----------------
#--- Study 21 ---#
#-----------------

# instrumental music:
data<- Add_data(data, ID= 21, N_C=25+18, N_E=23+26, sample="children", cit= "Furnham at al. (1999)", year=1999, 
                design="between", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8+7.56)/2, var_C= (1.91+1.89)/2, 
                mean_E= (7.48+7.62)/2, var_E= (1.62+1.96)/2, var_type= "SD",
                reference= "Furnham, A., Trew, S., & Sneade, I. (1999). The distracting effects of vocal and instrumental music on the cognitive test performance of introverts and extraverts. Personality and Individual Differences, 27(2), 381-392. doi:10.1016/S0191-8869(98)00249-9"
)
# data from Table 1

# vocal music:
data<- Add_data(data, ID= 21, N_C=25+18, N_E=19+28, sample="children", cit= "Furnham at al. (1999)", year=1999, 
                design="between", sound="music",
                sound_type= "vocal", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (8+7.56)/2, var_C= (1.91+1.89)/2, 
                mean_E= (8.53+6.75)/2, var_E= (2.09+2.35)/2, var_type= "SD",
                reference= "Furnham, A., Trew, S., & Sneade, I. (1999). The distracting effects of vocal and instrumental music on the cognitive test performance of introverts and extraverts. Personality and Individual Differences, 27(2), 381-392. doi:10.1016/S0191-8869(98)00249-9"
)
# data from Table 1


#-----------------
#--- Study 22 ---#
#-----------------

perham<- structure(list(cond = structure(c(1L, 3L, 2L, 4L), .Label = c("disliked_lyrics", 
         "liked_lyrics", "no_lyrics", "silence"), class = "factor"), mean = c(0.370243669922366,
         0.547488933122073, 0.365915340038927, 0.607869289468922), CI_L = c(0.333476036843987, 
         0.498959735542443, 0.311497636565053, 0.562275076464072), CI_R = c(0.408475705830689, 
         0.597488712446541, 0.417382611650785, 0.651983652356594)), .Names = c("cond", 
         "mean", "CI_L", "CI_R"), row.names = c(NA, -4L), class = "data.frame")
# error bars show the standard error

# disliked lyrical music:
data<- Add_data(data, ID= 22, N_C=30, sample="adults", cit= "Perham & Currie (2014)", year=2014, 
                design="within", sound="music",
                sound_type= "disliked lyrical", db= 70, task= "reading comprehension", 
                measure= "num_correct", mean_C= perham$mean[4], var_C= perham$mean[4]- perham$CI_L[4], 
                mean_E= perham$mean[1], var_E=perham$mean[1]- perham$CI_L[1], var_type= "SE",
                reference= "Perham, N., & Currie, H. (2014). Does listening to preferred music improve reading comprehension performance?. Applied Cognitive Psychology, 28(2), 279-284. doi:10.1002/acp.2994"
)
# data extracted with: https://github.com/ankitrohatgi/digitizeR?


# non-lyrical music:
data<- Add_data(data, ID= 22, N_C=30, sample="adults", cit= "Perham & Currie (2014)", year=2014, 
                design="within", sound="music",
                sound_type= "non-lyrical", db= 70, task= "reading comprehension", 
                measure= "num_correct", mean_C= perham$mean[4], var_C= perham$mean[4]- perham$CI_L[4], 
                mean_E= perham$mean[2], var_E=perham$mean[2]- perham$CI_L[2], var_type= "SE",
                reference= "Perham, N., & Currie, H. (2014). Does listening to preferred music improve reading comprehension performance?. Applied Cognitive Psychology, 28(2), 279-284. doi:10.1002/acp.2994"
)
# data extracted with: https://github.com/ankitrohatgi/digitizeR?


# liked lyrical music:
data<- Add_data(data, ID= 22, N_C=30, sample="adults", cit= "Perham & Currie (2014)", year=2014, 
                design="within", sound="music",
                sound_type= "liked lyrical", db= 70, task= "reading comprehension", 
                measure= "num_correct", mean_C= perham$mean[4], var_C= perham$mean[4]- perham$CI_L[4], 
                mean_E= perham$mean[3], var_E=perham$mean[3]- perham$CI_L[3], var_type= "SE",
                reference= "Perham, N., & Currie, H. (2014). Does listening to preferred music improve reading comprehension performance?. Applied Cognitive Psychology, 28(2), 279-284. doi:10.1002/acp.2994"
)
# data extracted with: https://github.com/ankitrohatgi/digitizeR?


#-----------------
#--- Study 23 ---#
#-----------------

# pop music:
data<- Add_data(data, ID= 23, N_C=13, N_E=12, sample="adults", cit= "Kelly (1994)", year=1994, 
                design="between", sound="music",
                sound_type= "pop", db= 65, task= "reading comprehension", 
                measure= "num_correct", mean_C= 54.92, var_C= 8.47, 
                mean_E= 48.17, var_E= 9.08, var_type= "SD",
                reference= "Kelly, S. N. (1994). A comparison of the effects of background music on the reading comprehension of university undergraduate music majors and nonmusic majors. Southeastern Journal of Music Education, 86."
)
# data from Table 3


#-----------------
#--- Study 24 ---#
#-----------------

dove<- read.csv("Literature_search/study_data/Dove (2009).txt", sep="") # raw data extracted from appendix G

# sedative classical music, reading comprehension:
data<- Add_data(data, ID= 24, N_C=nrow(subset(dove, Read_cond==0)), N_E=nrow(subset(dove, Read_cond==1)),
                sample="adults", cit= "Dove (2009)", year=2009, 
                design= "between", sound="music",
                sound_type= "sedative classical", db= 62.5, task= "reading comprehension", 
                measure= "num_correct", mean_C= mean(dove$Read_comp[dove$Read_cond==0]),
                var_C= sd(dove$Read_comp[dove$Read_cond==0]), 
                mean_E= mean(dove$Read_comp[dove$Read_cond==1]), var_E= sd(dove$Read_comp[dove$Read_cond==1]),
                var_type= "SD",
                reference= "Dove, M. K. (2009).The relationship of rhythmic and melodic perception with background music distraction in college level students (Order No. 3358711). Available from ProQuest Dissertations and Theses A&I: The Humanities and Social Sciences Collection. (304917640). Retrieved from https://kuscholarworks.ku.edu/bitstream/handle/1808/5339/Dove_ku_0099D_10312_DATA_1.pdf;sequence=1"
)

# stimulative classical music, reading comprehension:
data<- Add_data(data, ID= 24, N_C=nrow(subset(dove, Read_cond==0)), N_E=nrow(subset(dove, Read_cond==2)),
                sample="adults", cit= "Dove (2009)", year=2009, 
                design= "between", sound="music",
                sound_type= "stimulative classical", db= 62.5, task= "reading comprehension", 
                measure= "num_correct", mean_C= mean(dove$Read_comp[dove$Read_cond==0]),
                var_C= sd(dove$Read_comp[dove$Read_cond==0]), 
                mean_E= mean(dove$Read_comp[dove$Read_cond==2]), var_E= sd(dove$Read_comp[dove$Read_cond==2]),
                var_type= "SD",
                reference= "Dove, M. K. (2009).The relationship of rhythmic and melodic perception with background music distraction in college level students (Order No. 3358711). Available from ProQuest Dissertations and Theses A&I: The Humanities and Social Sciences Collection. (304917640). Retrieved from https://kuscholarworks.ku.edu/bitstream/handle/1808/5339/Dove_ku_0099D_10312_DATA_1.pdf;sequence=1"
)

# sedative classical music, reading speed:
data<- Add_data(data, ID= 24, N_C=nrow(subset(dove, Read_cond==0)), N_E=nrow(subset(dove, Read_cond==1)),
                sample="adults", cit= "Dove (2009)", year=2009, 
                design= "between", sound="music",
                sound_type= "sedative classical", db= 62.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= mean(dove$Read_rate[dove$Read_cond==0]),
                var_C= sd(dove$Read_rate[dove$Read_cond==0]), 
                mean_E= mean(dove$Read_rate[dove$Read_cond==1]), var_E= sd(dove$Read_rate[dove$Read_cond==1]),
                var_type= "SD",
                reference= "Dove, M. K. (2009).The relationship of rhythmic and melodic perception with background music distraction in college level students (Order No. 3358711). Available from ProQuest Dissertations and Theses A&I: The Humanities and Social Sciences Collection. (304917640). Retrieved from https://kuscholarworks.ku.edu/bitstream/handle/1808/5339/Dove_ku_0099D_10312_DATA_1.pdf;sequence=1"
)

# stimulative classical music, reading speed:
data<- Add_data(data, ID= 24, N_C=nrow(subset(dove, Read_cond==0)), N_E=nrow(subset(dove, Read_cond==2)),
                sample="adults", cit= "Dove (2009)", year=2009, 
                design= "between", sound="music",
                sound_type= "stimulative classical", db= 62.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= mean(dove$Read_rate[dove$Read_cond==0]),
                var_C= sd(dove$Read_rate[dove$Read_cond==0]), 
                mean_E= mean(dove$Read_rate[dove$Read_cond==2]), var_E= sd(dove$Read_rate[dove$Read_cond==2]),
                var_type= "SD",
                reference= "Dove, M. K. (2009).The relationship of rhythmic and melodic perception with background music distraction in college level students (Order No. 3358711). Available from ProQuest Dissertations and Theses A&I: The Humanities and Social Sciences Collection. (304917640). Retrieved from https://kuscholarworks.ku.edu/bitstream/handle/1808/5339/Dove_ku_0099D_10312_DATA_1.pdf;sequence=1"
)


#-----------------
#--- Study 25 ---#
#-----------------

data<- Add_data(data, ID= 25, N_C=20, sample="adults", cit= "Furnham et al. (1994)", year=1994, 
                design="within", sound="speech",
                sound_type= "TV drama", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (9.10+8.20)/2, var_C= (1.45+2.78)/2, 
                mean_E= (6.60+7.80)/2, var_E= (1.90+2.74)/2, var_type= "SD",
                reference= "Furnham, A., Gunter, B., & Peterson, E. (1994). Television distraction and the performance of introverts and extroverts. Applied Cognitive Psychology, 8(7), 705-711. doi:10.1002/acp.2350080708"
)
# data from Table 1


#-----------------
#--- Study 26 ---#
#-----------------

# continuous noise, reading comprehension:
data<- Add_data(data, ID= 26, N_C=22, N_E=22, sample="children", cit= "Johansson (1983)", year=1983, 
                design="between", sound="noise",
                sound_type= "continuous", db= 51, task= "select word", 
                measure= "prop_correct", mean_C= 96.55, var_C= 4.38, 
                mean_E= 97.71, var_E= 3.64, var_type= "SD",
                reference= "Johansson, C. R. (1983). Effects of low intensity, continuous and intermittent noise on mental performance and writing pressure of children with different intelligence and personality characteristics. Ergonomics, 26(3), 275-288. doi:10.1080/00140138308963341"
)
# data from Table 3


# intermittent noise, reading comprehension:
data<- Add_data(data, ID= 26, N_C=22, N_E=22, sample="children", cit= "Johansson (1983)", year=1983, 
                design="between", sound="noise",
                sound_type= "intermittent", db= 67.4, task= "select word", 
                measure= "prop_correct", mean_C= 96.55, var_C= 4.38, 
                mean_E= 97.37, var_E= 3.35, var_type= "SD",
                reference= "Johansson, C. R. (1983). Effects of low intensity, continuous and intermittent noise on mental performance and writing pressure of children with different intelligence and personality characteristics. Ergonomics, 26(3), 275-288. doi:10.1080/00140138308963341"
)
# data from Table 3


#-----------------
#--- Study 27 ---#
#-----------------

# There is something fishy about the graph from which the data was extracted because the
# standard error appears to be almost exactly the same in some conditions. Such degree of
# similarity seems unlikely
mean<- c(0.5367002192082886, 0.3497142496524407, 0.4591825257026822, 0.4863643535025995,
         0.4878321766584935, 0.4550663842882783, 0.4860629189040699, 0.4849046972939562)
L_SE<- c(0.5072732233641511, 0.3268252663074447, 0.4297547874087947, 0.4569358727589618,
         0.4584036959148558, 0.4321781433930324, 0.4566344381604322, 0.4549320008835152)
font<- c(rep("easy", 4), rep("difficult", 4))
cond<- c("silence", "speech", "road traffic", "aircraft", "silence", "speech", "road traffic", "aircraft")

halin<- data.frame(mean, L_SE, font, cond)
halin$SE<- halin$mean- halin$L_SE

#-------------------------------------------------

# speech, easy to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="speech",
                sound_type= "native", db= 60, task= "reading comprehension (easy font)", 
                measure= "prop_correct", mean_C= halin$mean[1], var_C= halin$SE[1], 
                mean_E= halin$mean[2], var_E= halin$SE[2], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 

# speech, difficult to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="speech",
                sound_type= "native", db= 60, task= "reading comprehension (difficult font)", 
                measure= "prop_correct", mean_C= halin$mean[5], var_C= halin$SE[5], 
                mean_E= halin$mean[6], var_E= halin$SE[6], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 

#-------------------------------------------------

# road traffic noise, easy to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="noise",
                sound_type= "road traffic", db= 60, task= "reading comprehension (easy font)", 
                measure= "prop_correct", mean_C= halin$mean[1], var_C= halin$SE[1], 
                mean_E= halin$mean[3], var_E= halin$SE[3], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 

# road traffic noise, difficult to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="noise",
                sound_type= "road traffic", db= 60, task= "reading comprehension (difficult font)", 
                measure= "prop_correct", mean_C= halin$mean[5], var_C= halin$SE[5], 
                mean_E= halin$mean[7], var_E= halin$SE[7], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 

#-------------------------------------------------

# aircraft noise, easy to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="noise",
                sound_type= "aircraft", db= 60, task= "reading comprehension (easy font)", 
                measure= "prop_correct", mean_C= halin$mean[1], var_C= halin$SE[1], 
                mean_E= halin$mean[4], var_E= halin$SE[4], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 

# aircraft noise, difficult to read font:
data<- Add_data(data, ID= 27, N_C=56/2, sample="adults", cit= "Halin (2016)", year=2016, 
                design="within", sound="noise",
                sound_type= "aircraft", db= 60, task= "reading comprehension (difficult font)", 
                measure= "prop_correct", mean_C= halin$mean[5], var_C= halin$SE[5], 
                mean_E= halin$mean[8], var_E= halin$SE[8], var_type= "SE",
                reference= "Halin, N. (2016). Distracted While Reading? Changing to a Hard-to-Read Font Shields against the Effects of Environmental Noise and Speech on Text Memory. Frontiers in Psychology, 7."
)
# data from Figure 2 (digitalized) 


#-----------------
#--- Study 28 ---#
#-----------------

# continuous speech:
data<- Add_data(data, ID= 28, N_C=54, sample="adults", cit= "Smith-Jackson & Klein (2009)", year=2009, 
                design="within", sound="speech",
                sound_type= "native", db= 65, task= "proofreading", 
                measure= "prop_correct", mean_C= 0.53, var_C= 0.18, 
                mean_E= 0.52, var_E= 0.21, var_type= "SD",
                reference= "Smith-Jackson, T. L., & Klein, K. W. (2009). Open-plan offices: Task performance and mental workload. Journal of Environmental Psychol- ogy, 29, 279–289. doi:10.1016/j.jenvp.2008.09.002"
)
# data from Table 3


#-----------------
#--- Study 29 ---#
#-----------------

# instrumental music, reading comprehension:
data<- Add_data(data, ID= 29, N_C=30, sample="adults", cit= "Cauchard et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "instrumental", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.87, var_C= 0.03, 
                mean_E= 0.91, var_E= 0.02, var_type= "SE",
                reference= "Cauchard, F., Cane, J. E., & Weger, U. W. (2012). Influence of Background Speech and Music in Interrupted Reading: An Eye‐Tracking Study. Applied Cognitive Psychology, 26(3), 381-390."
)
# data from Table 2


# speech, reading comprehension:
data<- Add_data(data, ID= 29, N_C=30, sample="adults", cit= "Cauchard et al. (2012)", year=2012, 
                design="within", sound="speech",
                sound_type= "native", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.87, var_C= 0.03, 
                mean_E= 0.82, var_E= 0.04, var_type= "SE",
                reference= "Cauchard, F., Cane, J. E., & Weger, U. W. (2012). Influence of Background Speech and Music in Interrupted Reading: An Eye‐Tracking Study. Applied Cognitive Psychology, 26(3), 381-390."
)
# data from Table 2


# instrumental music, reading speed:
data<- Add_data(data, ID= 29, N_C=30, sample="adults", cit= "Cauchard et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "instrumental", db= 65, task= "reading comprehension", 
                measure= "reading_speed",
                mean_C= (15.81+16.33+0.60+5.75+18.22+17.05)/6,
                var_C= (0.75+0.80+0.11+0.74+0.99+1.13)/6, 
                mean_E= (15.93+16.14+0.75+4.65+18.25+17.82)/6,
                var_E= (0.67+0.81+0.19+0.53+1.09+0.95)/6,
                var_type= "SE",
                reference= "Cauchard, F., Cane, J. E., & Weger, U. W. (2012). Influence of Background Speech and Music in Interrupted Reading: An Eye‐Tracking Study. Applied Cognitive Psychology, 26(3), 381-390."
)
# data from Table 1

# speech, reading speed:
data<- Add_data(data, ID= 29, N_C=30, sample="adults", cit= "Cauchard et al. (2012)", year=2012, 
                design="within", sound="speech",
                sound_type= "native", db= 65, task= "reading comprehension", 
                measure= "reading_speed",
                mean_C= (15.81+16.33+0.60+5.75+18.22+17.05)/6,
                var_C= (0.75+0.80+0.11+0.74+0.99+1.13)/6, 
                mean_E= (18.47+17.88+0.51+5.42+20.15+18.66)/6,
                var_E= (0.98+0.93+0.09+0.59+1.21+1.15)/6,
                var_type= "SE",
                reference= "Cauchard, F., Cane, J. E., & Weger, U. W. (2012). Influence of Background Speech and Music in Interrupted Reading: An Eye‐Tracking Study. Applied Cognitive Psychology, 26(3), 381-390."
)
# data from Table 1


#-----------------
#--- Study 30 ---#
#-----------------

# Preferred music, reading comprehension:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "preferred", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 62.5, var_C= 24.5, 
                mean_E= 45.8, var_E= 35.9, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1


# Non-preferred music, reading comprehension:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "non-preferred", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 62.5, var_C= 24.5, 
                mean_E= 40.2, var_E= 21.0, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1


# Cafe noise, reading comprehension:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="noise",
                sound_type= "cafe", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 62.5, var_C= 24.5, 
                mean_E= 50.0, var_E= 29.5, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1



# Preferred music, reading speed:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "preferred", db= 65, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (199+198)/2, var_C= (18+17)/2, 
                mean_E= c(204+200)/2, var_E= (19+17)/2, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1


# Non-preferred music, reading speed:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "non-preferred", db= 65, task= "reading comprehension", 
                measure= "reading_speed", mean_C=(199+198)/2, var_C= (18+17)/2, 
                mean_E= (202+200)/2, var_E= (18+17)/2, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1


# Cafe noise, reading speed:
data<- Add_data(data, ID= 30, N_C=24, sample="adults", cit= "Johansson et al. (2012)", year=2012, 
                design="within", sound="noise",
                sound_type= "cafe", db= 65, task= "reading comprehension", 
                measure= "reading_speed", mean_C=(199+198)/2, var_C= (18+17)/2, 
                mean_E= (202+199)/2, var_E= (21+22)/2, var_type= "SD",
                reference= "Johansson, R., Holmqvist, K., Mossberg, F., & Lindgren, M. (2012). Eye movements and reading comprehension while listening to preferred and non-preferred study music. Psychology of music, 40(3), 339-356."
)
# data from Table 1



#-----------------
#--- Study 31 ---#
#-----------------

# noise, non-contextual errors:
data<- Add_data(data, ID= 31, N_C=15, N_E=18, sample="adults", cit= "Weinstein (1974)", year=1974, 
                design="between", sound="noise",
                sound_type= "teletype", db= 70, task= "proofreading (non-contextual errors)", 
                measure= "perc_incorrect", mean_C= (28+28)/2, var_C= sqrt((90+120)/2), 
                mean_E= (36+35)/2, var_E= sqrt((160+300)/2), var_type= "SD",
                reference= "Weinstein, N. D. (1974). Effect of noise on intellectual performance. Journal of Applied Psychology, 59(5), 548."
)
# data from Table 1


# noise, contextual errors:
data<- Add_data(data, ID= 31, N_C=15, N_E=18, sample="adults", cit= "Weinstein (1974)", year=1974, 
                design="between", sound="noise",
                sound_type= "teletype", db= 70, task= "proofreading (contextual errors)", 
                measure= "perc_incorrect", mean_C= (40+44)/2, var_C= sqrt((100+90)/2), 
                mean_E= (58+65)/2, var_E= sqrt((240+430)/2), var_type= "SD",
                reference= "Weinstein, N. D. (1974). Effect of noise on intellectual performance. Journal of Applied Psychology, 59(5), 548."
)
# data from Table 1


#-----------------
#--- Study 32 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because SDs are not reported) 

# noise, non-contextual errors:
data<- Add_data(data, ID= 32, N_C=29, sample="adults", cit= "Weinstein (1977)", year=1977, 
                design="within", sound="speech",
                sound_type= "native", db= 68, task= "proofreading (non-contextual errors)", 
                measure= "perc_incorrect", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Weinstein, N. D. (1977). Noise and intellectual performance: A confirmation and extension. Journal of Applied Psychology, 62(1), 104-107"
)
# data from Table 1 and text


# noise, contextual errors:
data<- Add_data(data, ID= 32, N_C=29, sample="adults", cit= "Weinstein (1977)", year=1977, 
                design="within", sound="speech",
                sound_type= "native", db= 68, task= "proofreading (contextual errors)", 
                measure= "perc_incorrect", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Weinstein, N. D. (1977). Noise and intellectual performance: A confirmation and extension. Journal of Applied Psychology, 62(1), 104-107"
)
# data from Table 1 and text


#-----------------
#--- Study 33 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because SDs are not reported) 

# speech (continuous):
data<- Add_data(data, ID= 33, N_C=36, sample="adults", cit= "Martin et al. (1988), Exp.1", year=1988, 
                design="within", sound="speech",
                sound_type= "native", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p.387


# speech (random):
data<- Add_data(data, ID= 33, N_C=36, sample="adults", cit= "Martin et al. (1988), Exp.1", year=1988, 
                design="within", sound="speech",
                sound_type= "random (native)", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p.387


#-----------------
#--- Study 34 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because SDs are not reported) 

# instrumental music:
data<- Add_data(data, ID= 34, N_C=36, sample="adults", cit= "Martin et al. (1988), Exp.2", year=1988, 
                design="within", sound="music",
                sound_type= "instrumental", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p.389


#-----------------
#--- Study 35 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because SDs are not reported) 

# white noise:
data<- Add_data(data, ID= 35, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.4", year=1988, 
                design="within", sound="noise",
                sound_type= "white", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 393


# English speech:
data<- Add_data(data, ID= 35, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.4", year=1988, 
                design="within", sound="speech",
                sound_type= "native", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 393


# Russian speech:
data<- Add_data(data, ID= 35, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.4", year=1988, 
                design="within", sound="speech",
                sound_type= "foreign", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 393


#-----------------
#--- Study 36 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because SDs are not reported) 

# white noise:
data<- Add_data(data, ID= 36, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.5", year=1988, 
                design="within", sound="noise",
                sound_type= "white", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 394


# Non-word speech:
data<- Add_data(data, ID= 36, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.5", year=1988, 
                design="within", sound="speech",
                sound_type= "non-word", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 394


# random-word speech:
data<- Add_data(data, ID= 36, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.5", year=1988, 
                design="within", sound="speech",
                sound_type= "random words", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= NA,
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 394


#-----------------
#--- Study 37 ---#
#-----------------

# effect sizes are filled in later with the test statistics (because descriptives are not reported) 
# sample size is 32 since only two schedules are analysed here (2x16)

# white noise:
#data<- Add_data(data, ID= 37, N_C=32, sample="adults", cit= "Gawron (1984), Exp.1", year=1984, 
#                design="within", sound="noise",
#                sound_type= "white", db= 85, task= "reading comprehension", 
#                measure= "num_correct", mean_C= NA, var_C= NA, 
#                mean_E= NA, var_E= NA, var_type= "NA",
#                reference= "Gawron, V. J. (1984). Noise: Effect and aftereffect. Ergonomics, 27(1), 5-18."
#)
# data from Table 2


#-----------------
#--- Study 37 ---#
#-----------------

# see Excel sheet for more comments on background sound classification

# background music (i.e. radio condition in the paper):
data<- Add_data(data, ID= 37, N_C=9, sample="children", cit= "Cool et al. (1994), Exp.2", year=1994, 
                design="within", sound="music",
                sound_type= "radio/ generic", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 92.71, var_C= 36.25, 
                mean_E= 85.23, var_E= 36.70, var_type= "SD",
                reference= "Cool, V. A., Yarbrough, D. B., Patton, J. E., Runde, R., & Keith, T. Z. (1994). Experimental effects of radio and television distractors on children's performance on mathematics and reading assignments. The Journal of experimental education, 62(3), 181-194"
)
# data from Table 2


# background speech (i.e. TV condition in the paper):
data<- Add_data(data, ID= 37, N_C=9, sample="children", cit= "Cool et al. (1994), Exp.2", year=1994, 
                design="within", sound="speech",
                sound_type= "movies", db= NA, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 92.71, var_C= 36.25, 
                mean_E= 74.62, var_E= 61.00, var_type= "SD",
                reference= "Cool, V. A., Yarbrough, D. B., Patton, J. E., Runde, R., & Keith, T. Z. (1994). Experimental effects of radio and television distractors on children's performance on mathematics and reading assignments. The Journal of experimental education, 62(3), 181-194"
)
# data from Table 2


# background music (i.e. radio condition in the paper):
data<- Add_data(data, ID= 37, N_C=9, sample="children", cit= "Cool et al. (1994), Exp.2", year=1994, 
                design="within", sound="music",
                sound_type= "radio/ generic", db= NA, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 84.00, var_C= 13.80, 
                mean_E= 81.00, var_E= 17.75, var_type= "SD",
                reference= "Cool, V. A., Yarbrough, D. B., Patton, J. E., Runde, R., & Keith, T. Z. (1994). Experimental effects of radio and television distractors on children's performance on mathematics and reading assignments. The Journal of experimental education, 62(3), 181-194"
)
# data from Table 2


# background speech (i.e. TV condition in the paper):
data<- Add_data(data, ID= 37, N_C=9, sample="children", cit= "Cool et al. (1994), Exp.2", year=1994, 
                design="within", sound="speech",
                sound_type= "movies", db= NA, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 84.00, var_C= 13.80, 
                mean_E= 79.39, var_E= 13.55, var_type= "SD",
                reference= "Cool, V. A., Yarbrough, D. B., Patton, J. E., Runde, R., & Keith, T. Z. (1994). Experimental effects of radio and television distractors on children's performance on mathematics and reading assignments. The Journal of experimental education, 62(3), 181-194"
)
# data from Table 2


#-----------------
#--- Study 38 ---#
#-----------------

#  music radio program:
data<- Add_data(data, ID= 38, N_C=91, sample="children", cit= "Mitchell (1949)", year=1949, 
                design="within", sound="music",
                sound_type= "radio/ generic", db= NA, task= "reading test (composite)", 
                measure= "reading_score", mean_C= 147.31, var_C= NA, 
                mean_E= 147.20, var_E= NA, var_type= NA,
                reference= "Mitchell, A. H. (1949). The effect of radio programs on silent reading achievement of ninety-one sixth grade students. The Journal of Educational Research, 42(6), 460-470."
)
# data from Table 2


#-----------------
#--- Study 39 ---#
#-----------------

# TV adds: 
data<- Add_data(data, ID= 39, N_C=33, N_E=30, sample="adults", cit= "Armstrong et al. (1991)", year=1991, 
                design="between", sound="speech",
                sound_type= "TV ads", db= NA, task= "reading comprehension", 
                measure= "reading_score", mean_C= 9.23, var_C= NA, 
                mean_E= 7.59, var_E= NA, var_type= NA,
                reference= "Armstrong, G. B., Boiarsky, G. A., & Mares, M. L. (1991). Background television and reading performance. Communications Monographs, 58(3), 235-253."
)
# data from p 243


# TV drama: 
data<- Add_data(data, ID= 39, N_C=33, N_E=32, sample="adults", cit= "Armstrong et al. (1991)", year=1991, 
                design="between", sound="speech",
                sound_type= "TV drama", db= NA, task= "reading comprehension", 
                measure= "reading_score", mean_C= 9.23, var_C= NA, 
                mean_E= 7.96, var_E= NA, var_type= NA,
                reference= "Armstrong, G. B., Boiarsky, G. A., & Mares, M. L. (1991). Background television and reading performance. Communications Monographs, 58(3), 235-253."
)
# data from p 243


#-----------------
#--- Study 40 ---#
#-----------------

# soap opera: 
data<- Add_data(data, ID= 40, N_C=30, N_E=30, sample="children", cit= "Pool et al. (2000), Exp.1", year=2000, 
                design="between", sound="speech",
                sound_type= "TV soap opera (native)", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.63)/2, var_C= (0.06+0.13)/2, 
                mean_E= (0.88+0.56)/2, var_E= (0.05+0.12)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 1


# music videos: 
data<- Add_data(data, ID= 40, N_C=30, N_E=30, sample="children", cit= "Pool et al. (2000), Exp.1", year=2000, 
                design="between", sound="music",
                sound_type= "TV music videos", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.63)/2, var_C= (0.06+0.13)/2, 
                mean_E= (0.87+0.60)/2, var_E= (0.06+0.12)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 1


# soap opera, reading speed: 
data<- Add_data(data, ID= 40, N_C=30, N_E=30, sample="children", cit= "Pool et al. (2000), Exp.1", year=2000, 
                design="between", sound="speech",
                sound_type= "TV soap opera (native)", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (6.06+42.50)/2, var_C= (1.61+10.93)/2, 
                mean_E= (6.35+43.69)/2, var_E= (1.53+11.40)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 2


# music videos: 
data<- Add_data(data, ID= 40, N_C=30, N_E=30, sample="children", cit= "Pool et al. (2000), Exp.1", year=2000, 
                design="between", sound="music",
                sound_type= "TV music videos", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (6.06+42.50)/2, var_C= (1.61+10.93)/2, 
                mean_E= (6.51+44.75)/2, var_E= (1.80+10.18)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 2


#-----------------
#--- Study 41 ---#
#-----------------

# soap opera: 
data<- Add_data(data, ID= 41, N_C=48, N_E=24, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="speech",
                sound_type= "TV soap opera (native)", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.64)/2, var_C= (0.07+0.14)/2, 
                mean_E= (0.84+0.54)/2, var_E= (0.14+0.16)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 3 


# music videos:
data<- Add_data(data, ID= 41, N_C=48, N_E=24, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="music",
                sound_type= "TV music videos", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.64)/2, var_C= (0.07+0.14)/2, 
                mean_E= (0.88+0.62)/2, var_E= (0.05+0.12)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 3 


# soap opera: 
data<- Add_data(data, ID= 41, N_C=48, N_E=48, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="speech",
                sound_type= "TV soap opera (native)", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (7.29+41.65)/2, var_C= (1.71+10.57)/2, 
                mean_E= (9.38+49.69)/2, var_E= (2.82+14.99)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 5 


# music videos:
data<- Add_data(data, ID= 41, N_C=48, N_E=48, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="music",
                sound_type= "TV music videos", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (7.29+41.65)/2, var_C= (1.71+10.57)/2, 
                mean_E= (6.96+40.97)/2, var_E= (1.87+12.03)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 5 


#-----------------
#--- Study 42 ---#
#-----------------

# children babble noise:
data<- Add_data(data, ID= 42, N_C=52, N_E=52, sample="children", cit= "Dockrell & Shield (2006)",
                year=2006, design="between", sound="noise",
                sound_type= "children babble", db= 65, task= "reading comprehension", 
                measure= "reading_score", mean_C= 33.45, var_C= 11.62, 
                mean_E= 27.59, var_E= 12.23, var_type= "SD",
                reference= "Dockrell, J. E., & Shield, B. M. (2006). Acoustical barriers in classrooms: The impact of noise on performance in the classroom. British Educational Research Journal, 32(3), 509-525."
)
# data from Table 1


# children babble noise + environmental noise:
data<- Add_data(data, ID= 42, N_C=52, N_E=52, sample="children", cit= "Dockrell & Shield (2006)",
                year=2006, design="between", sound="noise",
                sound_type= "children babble + environmental", db= 65, task= "reading comprehension", 
                measure= "reading_score", mean_C= 33.45, var_C= 11.62, 
                mean_E= 39.48, var_E= 8.95, var_type= "SD",
                reference= "Dockrell, J. E., & Shield, B. M. (2006). Acoustical barriers in classrooms: The impact of noise on performance in the classroom. British Educational Research Journal, 32(3), 509-525."
)
# data from Table 1


#-----------------
#--- Study 43 ---#
#-----------------

# Finnish speech, reading comprehension:
data<- Add_data(data, ID= 43, N_C=42, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.1",
                year=2016, design="within", sound="speech",
                sound_type= "native", db= 82.5, task= "reading comprehension", 
                measure= "perc_correct", mean_C= (76+80)/2, var_C= (15+15)/2, 
                mean_E= (75+74)/2, var_E= (14+12)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)
# data from Table 1


# Italian speech, reading comprehension:
data<- Add_data(data, ID= 43, N_C=42, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.1",
                year=2016, design="within", sound="speech",
                sound_type= "foreign", db= 82.5, task= "reading comprehension", 
                measure= "perc_correct", mean_C= (76+80)/2, var_C= (15+15)/2, 
                mean_E= (79+77)/2, var_E= (15+14)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)
# data from Table 1

#-------

# Finnish speech, reading speed:
data<- Add_data(data, ID= 43, N_C=42, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.1",
                year=2016, design="within", sound="speech",
                sound_type= "native", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (4343+4134)/2+(815+821)/2,
                var_C= (1167+910)/2+(963+1212)/2, 
                mean_E= (4448+4189)/2+(839+766)/2,
                var_E= (1053+891)/2 + (936+734)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)
# data from Tables 2 and 5


# Italian speech, reading speed:
data<- Add_data(data, ID= 43, N_C=42, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.1",
                year=2016, design="within", sound="speech",
                sound_type= "foreign", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (4343+4134)/2+(815+821)/2, 
                var_C= (1167+910)/2+(963+1212)/2, 
                mean_E= (4183+4084)/2 + (759+737)/2,
                var_E= (899+904)/2 + (802+785)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)
# data from Tables 2 and 5


#-----------------
#--- Study 44 ---#
#-----------------

# scrambled Finnish speech, reading speed:
data<- Add_data(data, ID= 44, N_C=36, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.2",
                year=2016, design="within", sound="speech",
                sound_type= "scrambled-Different", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (3708+3598)/2+(515+419)/2,
                var_C= (937+883)/2+(760+701)/2, 
                mean_E= (4153+3929)/2 + (535+452)/2,
                var_E= (1021+1058)/2 + (1151+814)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)

# scrambled Finnish speech, reading speed:
data<- Add_data(data, ID= 44, N_C=36, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.2",
                year=2016, design="within", sound="speech",
                sound_type= "scrambled-Same", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (3708+3598)/2+(515+419)/2,
                var_C= (937+883)/2+(760+701)/2, 
                mean_E= (4156+3909)/2+ (515+560)/2,
                var_E= (857+1026)/2 + (920+957)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)


#-----------------
#--- Study 45 ---#
#-----------------

# 1 participant was excluded

# Finnish speech, reading speed:
data<- Add_data(data, ID= 45, N_C=36-1, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.3",
                year=2016, design="within", sound="speech",
                sound_type= "native", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (4161+3915)/2+(405+405)/2,
                var_C= (1273+1099)/2+(614+517)/2, 
                mean_E= (4271+4242)/2+(523+559)/2,
                var_E= (1225+1307)/2+(644+782)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)


# scrambled Finnish speech, reading speed:
data<- Add_data(data, ID= 45, N_C=36-1, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.3",
                year=2016, design="within", sound="speech",
                sound_type= "scrambled", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed", mean_C= (4161+3915)/2+(405+405)/2,
                var_C= (1273+1099)/2+(614+517)/2, 
                mean_E= (4683+4288)/2+(692+438)/2,
                var_E= (1681+1432)/2+(954+599)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)


#-----------------
#--- Study 46 ---#
#-----------------

# Scrambled Finnish speech, reading speed:
data<- Add_data(data, ID= 46, N_C=36, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.4",
                year=2016, design="within", sound="speech",
                sound_type= "scrambled-Semantic", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed",
                mean_C= (4416+4205)/2+(612+536)/2,
                var_C= (1102+1090)/2+(815+685)/2, 
                mean_E= (4682+4575)/2+ (580+515)/2,
                var_E= (1358+1257)/2 +(698+519)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)

# Scrambled Finnish speech, reading speed:
data<- Add_data(data, ID= 46, N_C=36, sample="adults", cit= "Hyönä & Ekholm (2016), Exp.4",
                year=2016, design="within", sound="speech",
                sound_type= "scrambled-Syntactic+Semantic", db= 82.5, task= "reading comprehension", 
                measure= "reading_speed",
                mean_C= (4416+4205)/2+(612+536)/2,
                var_C= (1102+1090)/2+(815+685)/2, 
                mean_E= (4679+4512)/2+ (694+587)/2,
                var_E= (1035+1133)/2 +(699+674)/2, var_type= "SD",
                reference= "Hyönä, J., & Ekholm, M. (2016). Background Speech Effects on Sentence Processing during Reading: An Eye Movement Study. PloS one, 11(3), e0152133."
)

#-----------------
#--- Study 47 ---#
#-----------------

# native (TV) speech, reading comprehension:
data<- Add_data(data, ID= 47, N_C=19, N_E=20, sample="adults", cit= "Armstrong & Chung (2000)",
                year=2000, design="between", sound="speech",
                sound_type= "native", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 7.84, var_C= 1.46, 
                mean_E= 7.70, var_E= 1.49, var_type= "SD",
                reference= "Armstrong, G. B., & Chung, L. (2000). Background Television and Reading Memory in Context Assessing TV Interference and Facilitative Context Effects on Encoding Versus Retrieval Processes. Communication Research, 27(3), 327-352."
)
# data from Table 2


#-----------------
#--- Study 48 ---#
#-----------------

# music background condition (Group 4):
data<- Add_data(data, ID= 48, N_C=50, N_E=50, sample="adults", cit= "Madsen (1987), Exp.1",
                year=1987, design="between", sound="music",
                sound_type= "various", db= 75, task= "reading comprehension", 
                measure= "num_correct", mean_C= 31.74, var_C= 6.87, 
                mean_E= 31.04, var_E= 7.17, var_type= "SD",
                reference= "Madsen, C. K. (1987). Background music: Competition for focus of attention. Applications of research in music behavior, 315-325"
)
# data from Table 25.2


#-----------------
#--- Study 49 ---#
#-----------------

# aircraft noise:
data<- Add_data(data, ID= 49, N_C=23, sample="children", cit= "Sörqvist (2010), Exp.1a",
                year=2010, design="within", sound="noise",
                sound_type= "aircraft", db= 57.5, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.28, var_C= 0.22, 
                mean_E= 0.24, var_E= 0.20, var_type= "SD",
                reference= "Sörqvist, P. (2010). Effects of aircraft noise and speech on prose memory: What role for working memory capacity?. Journal of Environmental Psychology, 30(1), 112-118."
)
# data from Table 1


#-----------------
#--- Study 50 ---#
#-----------------

data<- Add_data(data, ID= 50, N_C=23, sample="children", cit= "Sörqvist (2010), Exp.1b",
                year=2010, design="within", sound="speech",
                sound_type= "native", db= 57.5, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.28, var_C= 0.16, 
                mean_E= 0.17, var_E= 0.11, var_type= "SD",
                reference= "Sörqvist, P. (2010). Effects of aircraft noise and speech on prose memory: What role for working memory capacity?. Journal of Environmental Psychology, 30(1), 112-118."
)
# data from Table 1


#-----------------
#--- Study 51 ---#
#-----------------

data<- Add_data(data, ID= 51, N_C=24, sample="adults", cit= "Sörqvist et al. (2010), Exp.1",
                year=2010, design="within", sound="speech",
                sound_type= "native", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.61, var_C= 0.17, 
                mean_E= 0.49, var_E= 0.19, var_type= "SD",
                reference= "Sörqvist, P., Ljungberg, J. K., & Ljung, R. (2010). A sub-process view of working memory capacity: Evidence from effects of speech on prose memory. Memory, 18(3), 310-326."
)
# data from Table 1


#-----------------
#--- Study 52 ---#
#-----------------

data<- Add_data(data, ID= 52, N_C=42, sample="adults", cit= "Sörqvist et al. (2010), Exp.2",
                year=2010, design="within", sound="speech",
                sound_type= "native", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= 0.54, var_C= 0.15, 
                mean_E= 0.47, var_E= 0.17, var_type= "SD",
                reference= "Sörqvist, P., Ljungberg, J. K., & Ljung, R. (2010). A sub-process view of working memory capacity: Evidence from effects of speech on prose memory. Memory, 18(3), 310-326."
)
# data from Table 1


#-----------------
#--- Study 53 ---#
#-----------------

data<- Add_data(data, ID= 53, N_C=32, sample="adults", cit= "Halin et al. (2014)",
                year=2014, design="within", sound="speech",
                sound_type= "native", db= 65, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (61.75+57.51)/2, var_C= NA, 
                mean_E= (53.75+58.78)/2, var_E= NA, var_type= NA,
                reference= "Halin, N., Marsh, J. E., Hellman, A., Hellström, I., & Sörqvist, P. (2014). A shield against distraction. Journal of Applied Research in Memory and Cognition, 3(1), 31-36."
)
# no error bars, effect size is converted from the ANOVA


#-----------------
#--- Study 54 ---#
#-----------------

# Contextual mistakes:
data<- Add_data(data, ID= 54, N_C=31, sample="adults", cit= "Halin et al. (2014), Exp.1",
                year=2014, design="within", sound="speech",
                sound_type= "native", db= 65, task= "proofreading (contextual errors)", 
                measure= "prop_misses", mean_C= ((0.11+0.32)/2 + (0.16+0.34)/2)/2,
                var_C= ((0.10+0.18)/2 + (0.18+0.20)/2)/2, 
                mean_E= ((0.19+0.32)/2 + (0.16+0.36)/2)/2,
                var_E= ((0.18+0.23)/2 + (0.15+0.26)/2)/2, var_type= "SD",
                reference= "Halin, N., Marsh, J. E., Haga, A., Holmgren, M., & Sörqvist, P. (2014). Effects of speech on proofreading: Can task-engagement manipulations shield against distraction?. Journal of Experimental Psychology: Applied,20(1), 69."
)
# Data from Table 1 


# Spelling mistakes:
data<- Add_data(data, ID= 54, N_C=31, sample="adults", cit= "Halin et al. (2014), Exp.1",
                year=2014, design="within", sound="speech",
                sound_type= "native", db= 65, task= "proofreading (spelling errors)", 
                measure= "prop_misses", mean_C= ((0.24+0.31)/2 + (0.33+0.44)/2)/2,
                var_C= ((0.14+0.14)/2 + (0.17+0.18)/2)/2, 
                mean_E= ((0.17+0.30)/2 + (0.28+0.40)/2)/2,
                var_E= ((0.11+0.14)/2 + (0.13+0.13)/2)/2, var_type= "SD",
                reference= "Halin, N., Marsh, J. E., Haga, A., Holmgren, M., & Sörqvist, P. (2014). Effects of speech on proofreading: Can task-engagement manipulations shield against distraction?. Journal of Experimental Psychology: Applied,20(1), 69."
)
# Data from Table 1 


#-----------------
#--- Study 55 ---#
#-----------------

# Contextual mistakes:
data<- Add_data(data, ID= 55, N_C=29, sample="adults", cit= "Halin et al. (2014), Exp.2",
                year=2014, design="within", sound="speech",
                sound_type= "native", db= 65, task= "proofreading (contextual errors)", 
                measure= "prop_misses", mean_C= ((0.13+0.26)/2 + (0.17+0.24)/2)/2,
                var_C= ((0.11+0.22)/2 + (0.17+0.27)/2)/2, 
                mean_E= ((0.20+0.30)/2 + (0.16+0.29)/2)/2,
                var_E= ((0.20+0.28)/2 + (0.15+0.20)/2)/2, var_type= "SD",
                reference= "Halin, N., Marsh, J. E., Haga, A., Holmgren, M., & Sörqvist, P. (2014). Effects of speech on proofreading: Can task-engagement manipulations shield against distraction?. Journal of Experimental Psychology: Applied,20(1), 69."
)
# Data from Table 1 


# Spelling mistakes:
data<- Add_data(data, ID= 55, N_C=29, sample="adults", cit= "Halin et al. (2014), Exp.2",
                year=2014, design="within", sound="speech",
                sound_type= "native", db= 65, task= "proofreading (spelling errors)", 
                measure= "prop_misses", mean_C= ((0.28+0.30)/2 + (0.60+0.51)/2)/2,
                var_C= ((0.15+0.14)/2 + (0.19+0.19)/2)/2, 
                mean_E= ((0.22+0.30)/2 + (0.54+0.53)/2)/2,
                var_E= ((0.14+0.11)/2 + (0.20+0.17)/2)/2, var_type= "SD",
                reference= "Halin, N., Marsh, J. E., Haga, A., Holmgren, M., & Sörqvist, P. (2014). Effects of speech on proofreading: Can task-engagement manipulations shield against distraction?. Journal of Experimental Psychology: Applied,20(1), 69."
)
# Data from Table 1 


#-----------------
#--- Study 56 ---#
#-----------------

# Contextual mistakes (max 30, normal coding):
data<- Add_data(data, ID= 56, N_C=54, sample="adults", cit= "Haapakangas et al. (2011)",
                year=2011, design="within", sound="speech",
                sound_type= "native", db= 48, task= "proofreading (contextual errors)", 
                measure= "prop_correct", mean_C= 19.2, var_C= 5.9, 
                mean_E= 18.4, var_E= 6.3, var_type= "SD",
                reference= "Haapakangas, A., Kankkunen, E., Hongisto, V., Virjonen, P., Oliva, D., & Keskinen, E. (2011). Effects of five speech masking sounds on performance and acoustic satisfaction. Implications for open-plan offices. Acta Acustica united with Acustica, 97(4), 641-655"
)
# Data from Table 3 


# Non-contextual mistakes (max 30, normal coding):
data<- Add_data(data, ID= 56, N_C=54, sample="adults", cit= "Haapakangas et al. (2011)",
                year=2011, design="within", sound="speech",
                sound_type= "native", db= 48, task= "proofreading (non-contextual errors)", 
                measure= "prop_correct", mean_C= 19.4, var_C= 5.2, 
                mean_E= 18.6, var_E= 5.0, var_type= "SD",
                reference= "Haapakangas, A., Kankkunen, E., Hongisto, V., Virjonen, P., Oliva, D., & Keskinen, E. (2011). Effects of five speech masking sounds on performance and acoustic satisfaction. Implications for open-plan offices. Acta Acustica united with Acustica, 97(4), 641-655"
)
# Data from Table 3 


# Proof-reading speed (max 140, normal coding):
data<- Add_data(data, ID= 56, N_C=54, sample="adults", cit= "Haapakangas et al. (2011)",
                year=2011, design="within", sound="speech",
                sound_type= "native", db= 48, task= "proofreading", 
                measure= "proofreading_speed", mean_C= 118, var_C= 18, 
                mean_E= 117, var_E= 22, var_type= "SD",
                reference= "Haapakangas, A., Kankkunen, E., Hongisto, V., Virjonen, P., Oliva, D., & Keskinen, E. (2011). Effects of five speech masking sounds on performance and acoustic satisfaction. Implications for open-plan offices. Acta Acustica united with Acustica, 97(4), 641-655"
)
# Data from Table 3 


#-----------------
#--- Study 57 ---#
#-----------------

data<- Add_data(data, ID= 57, N_C=24, sample="adults", cit= "Baker & Madell (1965)",
                year=1965, design="within", sound="speech",
                sound_type= "native", db= NA, task= "reading comprehension", 
                measure= "perc_correct", mean_C= 79.5, var_C= 18.9, 
                mean_E= 49.0, var_E= 31.5, var_type= "SD",
                reference= "Baker, R. W., & Madell, T. O. (1965). A continued investigation of susceptibility to distraction in academically underachieving and achieving male college students.Journal of Educational Psychology,56(5), 254"
)
# data from Table 1


#-----------------
#--- Study 58 ---#
#-----------------

# comprehension, noise:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="noise",
                sound_type= "speech-spectrum", db= 60, task= "reading comprehension", 
                measure= "perc_correct", mean_C= 0.9363636, var_C= 0.2443819, 
                mean_E= 0.9272727, var_E= 0.2599839, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)

# comprehension, Mandarin:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="speech",
                sound_type= "foreign", db= 60, task= "reading comprehension", 
                measure= "perc_correct", mean_C= 0.9363636, var_C= 0.2443819, 
                mean_E= 0.9318182, var_E= 0.2523446, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)

# comprehension, English:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="speech",
                sound_type= "native", db= 60, task= "reading comprehension", 
                measure= "perc_correct", mean_C= 0.9363636, var_C= 0.2443819, 
                mean_E= 0.9090909, var_E= 0.287807, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)

#####

# reading speed, noise:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="noise",
                sound_type= "speech-spectrum", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 3040, var_C= 1244, 
                mean_E= 2960, var_E= 1354, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)

# reading speed, Mandarin:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="speech",
                sound_type= "foreign", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 3040, var_C= 1244, 
                mean_E= 3150, var_E= 1426, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)


# reading speed, English:
data<- Add_data(data, ID= 58, N_C=40, sample="adults", cit= "Vasilev et al. (n.d.)",
                year=2016, design="within", sound="speech",
                sound_type= "native", db= 60, task= "reading comprehension", 
                measure= "reading_speed", mean_C= 3040, var_C= 1244, 
                mean_E= 3370, var_E= 1616, var_type= "SD",
                reference= "Vasilev et al. (n.d.). Unpublished study."
)

#############
# Save data #
#############

save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")

# Close log file and show it:
#cat("\n"); cat("\n"); cat("###############"); cat("\n"); cat(" ALL FINISHED!"); cat("\n"); cat("###############")
#sink() # close text file
#file.show("Output/Data_entry_log.txt")



#------------------------------------------------------------------------------------------------------------#
#                                             Correlation studies:                                           #
#------------------------------------------------------------------------------------------------------------#

data_corr<- data.frame(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA)
colnames(data_corr)<- c("ID", "N_C", "N_E", "sample", "age", "grade", "cit", "year", "sound",
                        "sound_type", "db_C", "db_E", "task", "measure",
                        "mean_C", "var_C", "mean_E", "var_E", "var_type", "analysis", "reference")

#-----------------
#--- Study 1 ---#
#-----------------

data_corr<- Add_data_cor(data_corr, ID=1, N_C= 233, N_E= 240, sample= "children", age= "9-10", grade= "4-5",
                         cit= "Papanikolaou et al. (2015)", year= 2015, sound= "noise", 
                         sound_type= "road traffic (medium level)", db_C= 60.5, db_E= 72, 
                         task= "Reading (composite)", measure= "custom test", mean_C = 4.50, var_C = 0.88,
                         mean_E= 4.08, var_E = 0.92, var_type = "SD", analysis = "prior",
                         reference = "Papanikolaou, M., Skenteris, N., & Piperakis, S. M. (2015). Effect of external classroom noise on schoolchildren’s reading and mathematics performance: correlation of noise levels and gender.International journal of adolescent medicine and health, 27(1), 25-29."
                         )

data_corr<- Add_data_cor(data_corr, ID=1, N_C= 233, N_E= 203, sample= "children", age= "9-10", grade= "4-5",
                         cit= "Papanikolaou et al. (2015)", year= 2015, sound= "noise", 
                         sound_type= "road traffic (high level)", db_C= 60.5, db_E= 76, 
                         task= "Reading (composite)", measure= "custom test", mean_C = 4.50, var_C = 0.88,
                         mean_E= 4.12, var_E = 0.94, var_type = "SD", analysis = "prior",
                         reference = "Papanikolaou, M., Skenteris, N., & Piperakis, S. M. (2015). Effect of external classroom noise on schoolchildren’s reading and mathematics performance: correlation of noise levels and gender.International journal of adolescent medicine and health, 27(1), 25-29."
)


#-----------------
#--- Study 2 ---#
#-----------------

data_corr<- Add_data_cor(data_corr, ID=2, N_C= 380, N_E= 313, sample= "children", age= "9-14 (11.9 mean)", grade= "5-6",
                         cit= "Seabi et al. (2012)", year= 2012, sound= "noise", 
                         sound_type= "air traffic", db_C= 40, db_E= 69, 
                         task= "Reading comprehension", measure= "Suffolk Reading Scale Level 2",
                         mean_C = 32.44, var_C = 16.71,
                         mean_E= 29.81, var_E = 14.23, var_type = "SD", analysis = "main",
                         reference = "Seabi, J.,Cockcroft, K., Goldschagg, P., and Greyling, M. (2012). The impact of aircraft noise exposure on South African children’s read- ing comprehension: the moder- ating effect of home language. Noise Health 14, 244–252. doi: 10.4103/1463-1741.102963"
)


#----------------#
#--- Study 3 --- #
#----------------#
# controled acute noise
data_corr<- Add_data_cor(data_corr, ID=3, N_C= 58, N_E= 58, sample= "children", age= NA, grade= "1-2",
                         cit= "Evans & Maxwell (1997)", year= 1997, sound= "noise", 
                         sound_type= "air traffic", db_C= NA, db_E= 65, 
                         task= "Reading skill", measure= "Woodcock Reading Mastery Test",
                         mean_C = 235.1, var_C = 30.5,
                         mean_E= 191.2, var_E = 31.4, var_type = "SD", analysis = "main",
                         reference = "Evans, G. W., & Maxwell, L. (1997). Chronic Noise Exposure and Reading Deficits The Mediating Effects of Language Acquisition. Environment and Behavior, 29(5), 638-656."
) # Table 2


#----------------#
#--- Study 4 --- #
#----------------#
# controled acute noise

# Groups were formed based on noise exposure at the neighbourhood (does it also mean school?)

data_corr<- Add_data_cor(data_corr, ID=4, N_C= 67, N_E= 68, sample= "children", age= "10.7", grade= "4",
                         cit= "Evans et al. (1995)", year= 1995, sound= "noise", 
                         sound_type= "air traffic", db_C= 59.2, db_E= 68.1, 
                         task= "Reading skill", measure= "Biglmaier Reading Test",
                         mean_C = 41.30, var_C = NA,
                         mean_E= 50.80, var_E = NA, var_type = NA, analysis = "main",
                         reference = "Evans, G. W., Hygge, S., & Bullinger, M. (1995). Chronic noise and psychological stress. Psychological Science, 333-338."
) # Table 2

# SDs not reported; effect sizes are calculated later from the reported t-statistic

#----------------#
#--- Study 5 --- #
#----------------#

# Some methodological issues, see comment in Excel file; used as prior

data_corr<- Add_data_cor(data_corr, ID=5, N_C= 80, N_E= 80, sample= "children", age= NA, grade= "2-6",
                         cit= "Bronzaft & McCarthy (1975)", year= 1975, sound= "noise", 
                         sound_type= "train", db_C= NA, db_E= "59-89", 
                         task= "Reading skill", measure= "The Metropolitan Achievement Reading Test",
                         mean_C = (2.6+4.2+5.6)/3, var_C = NA,
                         mean_E= (2.2+3.9+4.5)/3, var_E = NA, var_type = NA, analysis = "prior",
                         reference = "Bronzaft, A. L., & McCarthy, D. P. (1975). The effect of elevated train noise on reading ability. Environment and Behavior"
) # Table 2

# SDs not reported; effect sizes are calculated later from the reported F-statistic

# Method reports sample size as 161 but this is inconsistent with reported degrees of freedom.
# The 1981 paper by the same authors also cite 160 as the number of participants that took part in this study


#----------------#
#--- Study 6 --- #
#----------------#

# Same setting as # 5

data_corr<- Add_data_cor(data_corr, ID=6, N_C= 30+83+59+33, N_E= 56+27+31+31,
                         sample= "children", age= NA, grade= "2-6",
                         cit= "Bronzaft (1981)", year= 1981, sound= "noise", 
                         sound_type= "train", db_C= NA, db_E= "59-89", 
                         task= "Reading achievement", measure= "The California Achievement Test",
                         mean_C = (2.65+3.06+6.23+6.94)/4, var_C = (0.90+1.05+1.88+2.21)/4,
                         mean_E= (2.26+2.63+5.05+5.99)/4, var_E = (0.75+0.89+0.97+1.46)/4, 
                         var_type = "SD", analysis = "prior",
                         reference = "Bronzaft, A. L. (1981). The effect of a noise abatement program on reading ability. Journal of environmental psychology, 1(3), 215-222."
) # Table 1

# However, note that db measurements at the noisy side are the same as the ones reported in the 1975 paper

# converting the ES from the ANOVA results is better here. Even though both means and SDs are reported this time,
# there will be a lot of averaging out involved (due to breakdown by grade)


#----------------#
#--- Study 7 --- #
#----------------#

# correlation study but still relevant to meta-analysis topic

data_corr<- Add_data_cor(data_corr, ID=7, N_C= NA, N_E= NA,
                         sample= "children", age= NA, grade= "2-4",
                         cit= "Ronsse & Wang (2010)", year= 2010, sound= "noise", 
                         sound_type= "generic/ unknown", db_C= NA, db_E= NA, 
                         task= "Reading achievement", measure= "Iowa Test of Basic Skills",
                         mean_C = NA, var_C = NA,
                         mean_E= NA, var_E = NA, 
                         var_type = NA, analysis = "prior",
                         reference = "Ronsse, L. M., & Wang, L. M. (2010). AB-10-C037: Effects of noise from building mechanical systems on elementary school student achievement."
) # p. 352

# ES calculated from the correlation adjusted for poverty


#----------------#
#--- Study 8 --- #
#----------------#
# groups differed on on a couple of demographic variables, but authors present
# adjusted descriptives

data_corr<- Add_data_cor(data_corr, ID=8, N_C= 215, N_E= 236,
                         sample= "children", age= "8.8 years", grade= "4",
                         cit= "Haines et al. (2001a)", year= 2001, sound= "noise", 
                         sound_type= "air traffic", db_C= "<57", db_E= ">63", 
                         task= "Reading comprehension", measure= "Suffolk Reading Scale Level 2",
                         mean_C = 95.78, var_C = 0.81,
                         mean_E= 96.24, var_E = 0.78, 
                         var_type = "SE", analysis = "main",
                         reference = "Haines, M. M., Stansfeld, S. A., Brentnall, S., Head, J., Berry, B., Jiggins, M., & Hygge, S. (2001a). The West London Schools Study: the effects of chronic aircraft noise exposure on child health. Psychological medicine, 31(08), 1385-1396."
) # Table 2


#----------------#
#--- Study 9 --- #
#----------------#
# groups differed on on a few socioeconomic variables, but the authors present
# adjusted results from ANCOVA

data_corr<- Add_data_cor(data_corr, ID=9, N_C= 171-26, N_E= 169,
                         sample= "children", age= "9.8 years", grade= "4-5",
                         cit= "Haines et al. (2001b)", year= 2001, sound= "noise", 
                         sound_type= "air traffic", db_C= "<57", db_E= ">66", 
                         task= "Reading comprehension", measure= "Suffolk Reading Scale Level 2",
                         mean_C = 101.9, var_C = NA,
                         mean_E= 98.4, var_E = NA, 
                         var_type = NA, analysis = "main",
                         reference = "Haines, M. M., Stansfeld, S. A., Job, R. S., Berglund, B., & Head, J. (2001b). Chronic aircraft noise exposure, stress responses, mental health and cognitive performance in school children. Psychological medicine, 31(02), 265-277."
) # p.272, adjusted

# something that is bugging me is the mismatch between dfs in the ANCOVA and the reported sample sizes
# However, it's impossible to know if some information about the study is missing or if there was a 
# mistake

# only means reported, so I calculate ES from F statistic


#############
# Save data #
#############

#save(data_corr, file= "Data/data_corr.Rda")
#write.csv(data_corr, file= "Data/data_corr.csv")
