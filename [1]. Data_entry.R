
# Martin R. Vasilev, 2016

#------------------------------#
# Script for coding study data #
#------------------------------#

rm(list=ls())

# Load functions:
source("Functions/Add_data.R")
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
data<- Add_data(data, ID= 31, N_C=15, N_E=18, sample="adults", cit= "Weinstein, N. D. (1974)", year=1974, 
                design="between", sound="noise",
                sound_type= "teletype", db= 70, task= "proofreading (non-contextual errors)", 
                measure= "perc_correct", mean_C= 100-(28+28)/2, var_C= sqrt((90+120)/2), 
                mean_E= 100 -(36+35)/2, var_E= sqrt((160+300)/2), var_type= "SD",
                reference= "Weinstein, N. D. (1974). Effect of noise on intellectual performance. Journal of Applied Psychology, 59(5), 548."
)
# data from Table 1


# noise, contextual errors:
data<- Add_data(data, ID= 31, N_C=15, N_E=18, sample="adults", cit= "Weinstein, N. D. (1974)", year=1974, 
                design="between", sound="noise",
                sound_type= "teletype", db= 70, task= "proofreading (contextual errors)", 
                measure= "perc_correct", mean_C= 100-(40+44)/2, var_C= sqrt((100+90)/2), 
                mean_E= 100 -(58+65)/2, var_E= sqrt((240+430)/2), var_type= "SD",
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
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Weinstein, N. D. (1977). Noise and intellectual performance: A confirmation and extension. Journal of Applied Psychology, 62(1), 104-107"
)
# data from Table 1 and text


# noise, contextual errors:
data<- Add_data(data, ID= 32, N_C=29, sample="adults", cit= "Weinstein (1977)", year=1977, 
                design="within", sound="speech",
                sound_type= "native", db= 68, task= "proofreading (contextual errors)", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
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
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p.387


# speech (random):
data<- Add_data(data, ID= 33, N_C=36, sample="adults", cit= "Martin et al. (1988), Exp.1", year=1988, 
                design="within", sound="speech",
                sound_type= "random (native)", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
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
                mean_E= NA, var_E= NA, var_type= "NA",
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
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 393


# English speech:
data<- Add_data(data, ID= 35, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.4", year=1988, 
                design="within", sound="speech",
                sound_type= "native", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 393


# Russian speech:
data<- Add_data(data, ID= 35, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.4", year=1988, 
                design="within", sound="speech",
                sound_type= "foreign", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
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
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 394


# Non-word speech:
data<- Add_data(data, ID= 36, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.5", year=1988, 
                design="within", sound="speech",
                sound_type= "non-word", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
                reference= "Martin, R. C., Wogalter, M. S., & Forlano, J. G. (1988). Reading comprehension in the presence of unattended speech and music. Journal of memory and language, 27(4), 382-398."
)
# data from text p. 394


# random-word speech:
data<- Add_data(data, ID= 36, N_C=48, sample="adults", cit= "Martin et al. (1988), Exp.5", year=1988, 
                design="within", sound="speech",
                sound_type= "random words", db= 82, task= "reading comprehension", 
                measure= "perc_correct", mean_C= NA, var_C= NA, 
                mean_E= NA, var_E= NA, var_type= "NA",
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
                sound_type= "radio/ generic", db= NA, task= "reading comprehension", 
                measure= "num_correct", mean_C= 147.31, var_C= NA, 
                mean_E= 147.20, var_E= NA, var_type= "NA",
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
                mean_E= 7.59, var_E= NA, var_type= "NA",
                reference= "Armstrong, G. B., Boiarsky, G. A., & Mares, M. L. (1991). Background television and reading performance. Communications Monographs, 58(3), 235-253."
)
# data from p 243


# TV drama: 
data<- Add_data(data, ID= 39, N_C=33, N_E=30, sample="adults", cit= "Armstrong et al. (1991)", year=1991, 
                design="between", sound="speech",
                sound_type= "TV drama", db= NA, task= "reading comprehension", 
                measure= "reading_score", mean_C= 9.23, var_C= NA, 
                mean_E= 7.96, var_E= NA, var_type= "NA",
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
data<- Add_data(data, ID= 41, N_C=48, N_E=48, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="speech",
                sound_type= "TV soap opera (native)", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.64)/2, var_C= (0.07+0.14)/2, 
                mean_E= (0.86+0.57)/2, var_E= (0.11+0.14)/2, var_type= "SD",
                reference= "Pool, M. M., Van der Voort, T. H., Beentjes, J. W., & Koolstra, C. M. (2000). Background television as an inhibitor of performance on easy and difficult homework assignments. Communication Research, 27(3), 293-326."
)
# data from Table 3 


# music videos:
data<- Add_data(data, ID= 41, N_C=48, N_E=48, sample="children", cit= "Pool et al. (2000), Exp.2", year=2000, 
                design="between", sound="music",
                sound_type= "TV music videos", db= 60, task= "reading comprehension", 
                measure= "prop_correct", mean_C= (0.88+0.64)/2, var_C= (0.07+0.14)/2, 
                mean_E= (0.87+0.63)/2, var_E= (0.06+0.13)/2, var_type= "SD",
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
data<- Add_data(data, ID= 42, N_C=51, N_E=51, sample="children", cit= "Dockrell & Shield (2006)",
                year=2006, design="between", sound="noise",
                sound_type= "children babble", db= 65, task= "reading comprehension", 
                measure= "score", mean_C= 33.45, var_C= 11.62, 
                mean_E= 27.59, var_E= 12.23, var_type= "SD",
                reference= "Dockrell, J. E., & Shield, B. M. (2006). Acoustical barriers in classrooms: The impact of noise on performance in the classroom. British Educational Research Journal, 32(3), 509-525."
)
# data from Table 1


# children babble noise + environmental noise:
data<- Add_data(data, ID= 42, N_C=51, N_E=51, sample="children", cit= "Dockrell & Shield (2006)",
                year=2006, design="between", sound="noise",
                sound_type= "children babble + environmental", db= 65, task= "reading comprehension", 
                measure= "score", mean_C= 33.45, var_C= 11.62, 
                mean_E= 39.48, var_E= 8.95, var_type= "SD",
                reference= "Dockrell, J. E., & Shield, B. M. (2006). Acoustical barriers in classrooms: The impact of noise on performance in the classroom. British Educational Research Journal, 32(3), 509-525."
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
