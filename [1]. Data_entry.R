
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

data<- Add_data(data, ID= 10, N_C=56, sample="adults", cit= "Doyle & Furnham (2012)", year=2012, 
                design="within", sound="music",
                sound_type= "vocal", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= (4.79+4.86)/2, var_C= (2.63+2.85)/2, 
                mean_E= (6.29+4.18)/2, var_E= (2.76+2.93)/2, var_type= "SD",
                reference= "Doyle, M., & Furnham, A. (2012). The distracting effects of music on the cognitive test performance of creative and non-creative individuals. Thinking Skills and Creativity, 7(1), 1-7. doi:10.1016/j.tsc.2011.09.002"
)
# data from Table 1


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
                sound_type= "vocal", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.42, var_C= 0.50, 
                mean_E= 9.15, var_E= 0.66, var_type= "SE",
                reference= "Avila, C., Furnham, A., & McClelland, A. (2011). The influence of distracting familiar vocal music on cognitive performance of introverts and extraverts. Psychology of Music, 40(1), 84-93. doi:10.1177/0305735611422672"
)
# data from Table 2

# instrumental music:
data<- Add_data(data, ID= 14, N_C=19, N_E=19, sample="children", cit= "Avila et al. (2011)", year=2011, 
                design="between", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", 
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
                measure= "reading speed", mean_C= 648.23, var_C= 112.11, 
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
                measure= "reading speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 704.05, var_E= 159.83, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# semi-classical music, comprehension:
data<- Add_data(data, ID= 15, N_C=40, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "semi-classical", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 12.95, var_E= 5.09, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# semi-classical music, reading speed:
data<- Add_data(data, ID= 15, N_C=40, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "semi-classical", db= NA, task= "reading comprehension", 
                measure= "reading speed", mean_C= 648.23, var_C= 112.11, 
                mean_E= 695.25, var_E= 148.27, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1


# jazz music, comprehension:
data<- Add_data(data, ID= 15, N_C=37, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "jazz", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 13.40, var_C= 5.81, 
                mean_E= 12.22, var_E= 7.68, var_type= "SD",
                reference= "Freeburne, C. M., & Fleischer, M. S. (1952). The effect of music distraction upon reading rate and comprehension. Journal of Educational Psychology, 43(2), 101-109. doi:10.1037/h0054219"
)
# data from Table 1

# jazz music, reading speed:
data<- Add_data(data, ID= 15, N_C=37, N_E=42, sample="adults", cit= "Freeburne & Fleischer (1952)", year=1952, 
                design="between", sound="music",
                sound_type= "jazz", db= NA, task= "reading comprehension", 
                measure= "reading speed", mean_C= 648.23, var_C= 112.11, 
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
                mean_E= 46.1, var_E= NA, var_type= "SD",
                reference= "Henderson, M. T., Crews, A., & Barlow, J. (1945). A study of the effect of music distraction on reading efficiency. Journal of Applied Psychology, 29(4), 313-317. doi:10.1037/h0056128"
)
# data from Table 1

# pop music:
data<- Add_data(data, ID= 17, N_C=19, N_E=14, sample="adults", cit= "Henderson et al. (1945)", year=1945, 
                design="between", sound="music",
                sound_type= "pop", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 49.2, var_C= NA, 
                mean_E= 22.9, var_E= NA, var_type= "SD",
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

#############
# Save data #
#############

save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")

# Close log file and show it:
#cat("\n"); cat("\n"); cat("###############"); cat("\n"); cat(" ALL FINISHED!"); cat("\n"); cat("###############")
#sink() # close text file
#file.show("Output/Data_entry_log.txt")
