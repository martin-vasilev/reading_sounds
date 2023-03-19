
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


#----------------
#--- Study 4 --- #
#----------------

data<- Add_data(data, ID= 69, N_C=129, N_E = 129, sample="children", cit= "Dong et al. (2022)", year=2022, design="within", 
                sound="music",
                sound_type= "Pop", db=NA, task= "reading comprehension", IF= 1.90,
                measure= "reading_speed", mean_C= mean(c(36.30, 43.53)), var_C= mean(c(3.14, 4.64)), 
                mean_E= mean(c(36.56, 36.42, 36.50, 36.68, 52.00, 48.57, 45.47, 45.92)), 
                var_E= mean(c(3.38, 3.46, 3.33, 3.46, 5.55, 5.12, 4.99, 5.11)), var_type= "SD",
                journal= "Psychology of Music",
                reference= "Dong, Y., Zheng, H. Y., Wu, S. X. Y., Huang, F. Y., Peng, S. N., Sun, S. Y. K., & Zeng, H. (2022). The effect of Chinese pop background music on Chinese poetry reading comprehension. Psychology of Music, 03057356211062940."
)

# Table 1


#----------------
#--- Study 5 --- #
#----------------

data<- Add_data(data, ID= 70, N_C=13, N_E = 13, sample="adults", cit= "Du et al. (2020)", year=2020, design="between", 
                sound="music",
                sound_type= "low arousal", db=NA, task= "reading comprehension", IF= 4.99,
                measure= "perc_correct", mean_C= mean(c(96.00, 96.62)), var_C= mean(c(2.38, 3.20)), mean_E= mean(c(92.31, 94.38)), var_E= mean(c(9.80, 7.57)),
                var_type= "SD",
                journal= "Scientific Reports",
                reference= "Du, M., Jiang, J., Li, Z., Man, D., & Jiang, C. (2020). The effects of background music on neural responses during reading comprehension. Scientific Reports, 10(1), 1-10."
)


data<- Add_data(data, ID= 70, N_C=13, N_E = 13, sample="adults", cit= "Du et al. (2020)", year=2020, design="between", 
                sound="music",
                sound_type= "high arousal", db=NA, task= "reading comprehension", IF= 4.99,
                measure= "perc_correct", mean_C= mean(c(96.00, 96.62)), var_C= mean(c(2.38, 3.20)), mean_E= mean(c(95.08, 94.92)), var_E= mean(c(4.29, 4.17)),
                var_type= "SD",
                journal= "Scientific Reports",
                reference= "Du, M., Jiang, J., Li, Z., Man, D., & Jiang, C. (2020). The effects of background music on neural responses during reading comprehension. Scientific Reports, 10(1), 1-10."
)
# Table 1


#### RTs
data<- Add_data(data, ID= 70, N_C=13, N_E = 13, sample="adults", cit= "Du et al. (2020)", year=2020, design="between", 
                sound="music",
                sound_type= "low arousal", db=NA, task= "reading comprehension", IF= 4.99,
                measure= "reading_speed", mean_C= mean(c(788.16, 786.84)), var_C= mean(c(135.78, 158.32)), 
                mean_E= mean(c(863.64, 888.35)), var_E= mean(c(147.65, 169.30)),
                var_type= "SD",
                journal= "Scientific Reports",
                reference= "Du, M., Jiang, J., Li, Z., Man, D., & Jiang, C. (2020). The effects of background music on neural responses during reading comprehension. Scientific Reports, 10(1), 1-10."
)

data<- Add_data(data, ID= 70, N_C=13, N_E = 13, sample="adults", cit= "Du et al. (2020)", year=2020, design="between", 
                sound="music",
                sound_type= "high arousal", db=NA, task= "reading comprehension", IF= 4.99,
                measure= "reading_speed", mean_C= mean(c(788.16, 786.84)), var_C= mean(c(135.78, 158.32)), 
                mean_E= mean(c(793.81, 804.86)), var_E= mean(c(113.93, 85.64)),
                var_type= "SD",
                journal= "Scientific Reports",
                reference= "Du, M., Jiang, J., Li, Z., Man, D., & Jiang, C. (2020). The effects of background music on neural responses during reading comprehension. Scientific Reports, 10(1), 1-10."
)


# Table 1



#----------------
#--- Study 6 --- #
#----------------

data<- Add_data(data, ID= 71, N_C=55, N_E = 55, sample="adults", cit= "Gheewalla et al. (2021)", year=2021, design="within", 
                sound="noise",
                sound_type= "white", db=85, task= "reading comprehension", IF= 2.561,
                measure= "reading_speed", mean_C= 135.10, var_C= 40.44, 
                mean_E= 155.16, var_E= 38.50,
                var_type= "SD",
                journal= "Ergonomics",
                reference= "Gheewalla, F., McClelland, A., & Furnham, A. (2021). Effects of background noise and extraversion on reading comprehension performance. Ergonomics, 64(5), 593-599. Doi:10.1080/00140139.2020.1854352"
)

# Table 1
data<- Add_data(data, ID= 71, N_C=55, N_E = 55, sample="adults", cit= "Gheewalla et al. (2021)", year=2021, design="within", 
                sound="noise",
                sound_type= "sirens", db=85, task= "reading comprehension", IF= 2.561,
                measure= "reading_speed", mean_C= 135.10, var_C= 40.44, 
                mean_E= 184.06, var_E= 49.10,
                var_type= "SD",
                journal= "Ergonomics",
                reference= "Gheewalla, F., McClelland, A., & Furnham, A. (2021). Effects of background noise and extraversion on reading comprehension performance. Ergonomics, 64(5), 593-599. Doi:10.1080/00140139.2020.1854352"
)


#----------------
#--- Study 7 --- #
#----------------

# easy to read font
data<- Add_data(data, ID= 72, N_C=61, N_E = 61, sample="adults", cit= "Hao and Conway (2021)", year=2021, design="within", 
                sound="speech",
                sound_type= "intelligible", db=NA, task= "reading comprehension", IF= 2.482,
                measure= "num_correct", mean_C= 7.115384615384615,
                var_C= 0.3418803, 
                mean_E= 6.73076923076923, var_E= 0.3098291,
                var_type= "SE",
                journal= "Memory & Cognition",
                reference= "Hao, H., & Conway, A. R. (2021). The impact of auditory distraction on reading comprehension: An individual differences investigation. Memory & Cognition, 1-12."
)
# Digitized from Figure 1

# hard to read font
data<- Add_data(data, ID= 72, N_C=61, N_E = 61, sample="adults", cit= "Hao and Conway (2021)", year=2021, design="within", 
                sound="speech",
                sound_type= "intelligible", db=NA, task= "reading comprehension", IF= 2.482,
                measure= "num_correct", mean_C= 7.9914529914529915,
                var_C=0.2350427, 
                mean_E=  7.510683760683761, var_E= 0.2884615,
                var_type= "SE",
                journal= "Memory & Cognition",
                reference= "Hao, H., & Conway, A. R. (2021). The impact of auditory distraction on reading comprehension: An individual differences investigation. Memory & Cognition, 1-12."
)
# Digitized from Figure 1


# easy to read font
data<- Add_data(data, ID= 72, N_C=61, N_E = 61, sample="adults", cit= "Hao and Conway (2021)", year=2021, design="within", 
                sound="speech",
                sound_type= "unintelligible", db=NA, task= "reading comprehension", IF= 2.482,
                measure= "num_correct", mean_C= 7.115384615384615,
                var_C= 0.3418803, 
                mean_E= 7.168803418803419, var_E= 0.3311966,
                var_type= "SE",
                journal= "Memory & Cognition",
                reference= "Hao, H., & Conway, A. R. (2021). The impact of auditory distraction on reading comprehension: An individual differences investigation. Memory & Cognition, 1-12."
)
# Digitized from Figure 1


# hard to read font
data<- Add_data(data, ID= 72, N_C=61, N_E = 61, sample="adults", cit= "Hao and Conway (2021)", year=2021, design="within", 
                sound="speech",
                sound_type= "unintelligible", db=NA, task= "reading comprehension", IF= 2.482,
                measure= "num_correct", mean_C= 7.9914529914529915,
                var_C=0.2350427, 
                mean_E=  7.80982905982906, var_E= 0.2884615,
                var_type= "SE",
                journal= "Memory & Cognition",
                reference= "Hao, H., & Conway, A. R. (2021). The impact of auditory distraction on reading comprehension: An individual differences investigation. Memory & Cognition, 1-12."
)
# Digitized from Figure 1


#----------------
#--- Study 8 --- #
#----------------


data<- Add_data(data, ID= 73, N_C=8, N_E = 9, sample="adults", cit= "Kaul et al. (2020)", year=2020, 
                design="between", sound="music",
                sound_type= "lyrical", db=NA, task= "reading comprehension", IF= NA,
                measure= "num_correct", mean_C= 5.5,
                var_C= 2.204, 
                mean_E=  6.22, var_E= 2.386,
                var_type= "SD",
                journal= "Minnesota Undergraduate Research & Academic Journal",
                reference= "Kaul, A., Phung, H., Yap, J., & McCaul, A. (2020). Help or Hinder: The Effects of Music on College Students Reading Comprehension. Minnesota Undergraduate Research & Academic Journal, 3(3)."
)

data<- Add_data(data, ID= 73, N_C=8, N_E = 10, sample="adults", cit= "Kaul et al. (2020)", year=2020, 
                design="between", sound="music",
                sound_type= "instrumental", db=NA, task= "reading comprehension", IF= NA,
                measure= "num_correct", mean_C= 5.5,
                var_C= 2.204, 
                mean_E=  5.60, var_E= 2.989,
                var_type= "SD",
                journal= "Minnesota Undergraduate Research & Academic Journal",
                reference= "Kaul, A., Phung, H., Yap, J., & McCaul, A. (2020). Help or Hinder: The Effects of Music on College Students Reading Comprehension. Minnesota Undergraduate Research & Academic Journal, 3(3)."
)

# sample sizes are written different at different places, but I take the ones from Table 2


#----------------
#--- Study 9 --- #
#----------------


data<- Add_data(data, ID= 74, N_C=30, N_E = 30, sample="adults", cit= "Meng et al. (2020)", year=2020, 
                design="within", sound="speech",
                sound_type= "intelligible", db=64, task= "semantic acceptability", IF= 3.140,
                measure= "reading_speed", mean_C= 421,
                var_C= 7, 
                mean_E=  361, var_E= 6,
                var_type= "SE",
                journal= "Journal of Experimental Psychology: Learning, Memory, and Cognition",
                reference= "Meng, Z., Lan, Z.B., Yan, G.L., Marsh, J.E., & Liversedge., S.P. (2020). Task Demands Modulate the Effects of Speech on Text Processing. Journal of Experimental Psychology: Learning, Memory, and Cognition, 46(10), 1892–1905."
)

data<- Add_data(data, ID= 74, N_C=30, N_E = 30, sample="adults", cit= "Meng et al. (2020)", year=2020, 
                design="within", sound="speech",
                sound_type= "unintelligible", db=64, task= "semantic acceptability", IF= 3.140,
                measure= "reading_speed", mean_C= 421,
                var_C= 7, 
                mean_E=  409, var_E= 6,
                var_type= "SE",
                journal= "Journal of Experimental Psychology: Learning, Memory, and Cognition",
                reference= "Meng, Z., Lan, Z.B., Yan, G.L., Marsh, J.E., & Liversedge., S.P. (2020). Task Demands Modulate the Effects of Speech on Text Processing. Journal of Experimental Psychology: Learning, Memory, and Cognition, 46(10), 1892–1905."
)

# we take data from the semantic acceptability task as it is closer to reading


#----------------
#--- Study 10 --- #
#----------------


data<- Add_data(data, ID= 75, N_C=34, N_E = 34, sample="adults", cit= "Mohan and Thomas (2020)", year=2020, 
                design="within", sound="music",
                sound_type= "Indian", db=NA, task= "reading comprehension", IF= NA,
                measure= "reading_score", mean_C= 3.14,
                var_C= 1.34, 
                mean_E=  5.03, var_E= 1.445,
                var_type= "SD",
                journal= "International Journal of Adolescence and Youth",
                reference= "Mohan, A., & Thomas, E. (2020). Effect of background music and the cultural preference to music on adolescents’ task performance. International Journal of Adolescence and Youth, 25(1), 562-573. Doi:10.1080/02673843.2019.1689368"
)

data<- Add_data(data, ID= 75, N_C=34, N_E = 34, sample="adults", cit= "Mohan and Thomas (2020)", year=2020, 
                design="within", sound="music",
                sound_type= "western", db=NA, task= "reading comprehension", IF= NA,
                measure= "reading_score", mean_C= 3.14,
                var_C= 1.34, 
                mean_E=  4.89, var_E= 1.659,
                var_type= "SD",
                journal= "International Journal of Adolescence and Youth",
                reference= "Mohan, A., & Thomas, E. (2020). Effect of background music and the cultural preference to music on adolescents’ task performance. International Journal of Adolescence and Youth, 25(1), 562-573. Doi:10.1080/02673843.2019.1689368"
)


#----------------
#--- Study 11 --- #
#----------------


data<- Add_data(data, ID= 76, N_C=32, N_E = 32, sample="children", cit= "Moreno and Woodruff (2021)", year=2021, 
                design="within", sound="music",
                sound_type= "instrumental", db=72.3, task= "reading comprehension", IF= NA,
                measure= "num_correct", mean_C= 3.70,
                var_C= 0.18, 
                mean_E=  4.20, var_E= 0.15,
                var_type= "SE",
                journal= "Technology, Knowledge and Learning",
                reference= "Moreno, M., & Woodruff, E. (2021). Exploring the effects of background music on real-time emotional expressions, performance, and confusion mediation in middle school students. Technology, Knowledge and Learning, doi:10.1007/s10758-021-09556-9"
)




#----------------
#--- Study 12 --- #
#----------------


data<- Add_data(data, ID= 77, N_C=74, N_E = 74, sample="adults", cit= "Moreno (2020)", year=2020, 
                design="within", sound="music",
                sound_type= "slow", db=72.3, task= "reading comprehension", IF= NA,
                measure= "num_correct", mean_C= 3.85,
                var_C= 0.11, 
                mean_E=  4.04, var_E= 0.08,
                var_type= "SE",
                journal= "Dissertation",
                reference= "Moreno, M. (2020). Andante, allegro o silenzio: An examination of background music tempo on facial emotions, electrodermal responses, and reading task performance (Order No. 27737493). Available from ProQuest Dissertations & Theses Global: The Humanities and Social Sciences Collection. (2425163110). Retrieved from http://libproxy.lib.csusb.edu/login?url=https://www.proquest.com/dissertations-theses/andante-allegro-o-silenzio-examination-background/docview/2425163110/se-2?accountid=10359"
)

data<- Add_data(data, ID= 77, N_C=74, N_E = 74, sample="adults", cit= "Moreno (2020)", year=2020, 
                design="within", sound="music",
                sound_type= "fast", db=72.3, task= "reading comprehension", IF= NA,
                measure= "num_correct", mean_C= 3.85,
                var_C= 0.11, 
                mean_E=  3.61, var_E= 0.09,
                var_type= "SE",
                journal= "Dissertation",
                reference= "Moreno, M. (2020). Andante, allegro o silenzio: An examination of background music tempo on facial emotions, electrodermal responses, and reading task performance (Order No. 27737493). Available from ProQuest Dissertations & Theses Global: The Humanities and Social Sciences Collection. (2425163110). Retrieved from http://libproxy.lib.csusb.edu/login?url=https://www.proquest.com/dissertations-theses/andante-allegro-o-silenzio-examination-background/docview/2425163110/se-2?accountid=10359"
)


# Table 12


#----------------
#--- Study 13 --- #
#----------------

data<- Add_data(data, ID= 78, N_C=17, N_E = 17, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="speech",
                sound_type= "intelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 82.49448123620309,
                var_C= 2.207506, 
                mean_E=  56.445916114790286, var_E= 3.090508,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# younger adults, Figure 2


data<- Add_data(data, ID= 78, N_C=17, N_E = 17, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="speech",
                sound_type= "unintelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 82.49448123620309,
                var_C= 2.207506, 
                mean_E=  63.730684326710815, var_E= 2.980132,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# younger adults, Figure 2


data<- Add_data(data, ID= 78, N_C=17, N_E = 17, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "intelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 82.49448123620309,
                var_C= 2.207506, 
                mean_E=  60.86092715231788, var_E= 3.97351,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# younger adults, Figure 2

data<- Add_data(data, ID= 78, N_C=17, N_E = 17, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "unintelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 82.49448123620309,
                var_C= 2.207506, 
                mean_E=  67.59381898454747, var_E= 3.311258,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# younger adults, Figure 2


data<- Add_data(data, ID= 78, N_C=17, N_E = 17, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 82.49448123620309,
                var_C= 2.207506, 
                mean_E=  67.2626931567329, var_E= 2.980132,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# younger adults, Figure 2


data<- Add_data(data, ID= 78, N_C=15, N_E = 15, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="speech",
                sound_type= "intelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 73.00220750551875,
                var_C= 2.869757, 
                mean_E=  48.05739514348786, var_E= 3.311258,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# older adults, Figure 2


data<- Add_data(data, ID= 78, N_C=15, N_E = 15, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="speech",
                sound_type= "unintelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 73.00220750551875,
                var_C= 2.869757, 
                mean_E=  59.31567328918322, var_E= 3.752759,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# older adults, Figure 2


data<- Add_data(data, ID= 78, N_C=15, N_E = 15, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "intelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 73.00220750551875,
                var_C= 2.869757, 
                mean_E=  56.445916114790286, var_E= 3.752759,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# older adults, Figure 2


data<- Add_data(data, ID= 78, N_C=15, N_E = 15, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "unintelligible", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 73.00220750551875,
                var_C= 2.869757, 
                mean_E=  66.26931567328919, var_E= 4.304636,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# older adults, Figure 2


data<- Add_data(data, ID= 78, N_C=15, N_E = 15, sample="adults", cit= "Murphy et al. (2018)", year=2018, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 1.652,
                measure= "perc_correct", mean_C= 73.00220750551875,
                var_C= 2.869757, 
                mean_E=  59.31567328918322, var_E= 2.980132,
                var_type= "SE",
                journal= "Experimental Aging Research",
                reference= "Murphy, D. R., Bailey, H., Pearson, M., & Albert, G. (2018). The irrelevant speech effect among younger and older adults: The influence of background noises on reading comprehension. Experimental Aging Research, 44(2), 162-178."
)
# older adults, Figure 2



#----------------
#--- Study 14 --- #
#----------------


data<- Add_data(data, ID= 79, N_C=50, N_E = 50, sample="adults", cit= "Que et al. (2020)", year=2020, 
                design="between", sound="music",
                sound_type= "various", db= 70, task= "reading comprehension", IF= NA,
                measure= "prop_correct", mean_C= 0.431,
                var_C= 0.151, 
                mean_E=  0.474, var_E= 0.150,
                var_type= "SD",
                journal= "JCDL '20: Proceedings of the ACM/IEEE Joint Conference on Digital Libraries in 2020",
                reference= "Que, Y., Zheng, Y., Hsiao, J. H., & Hu, X. (2020). Exploring the effect of personalized background music on reading comprehension. Paper presented at the Proceedings of the ACM/IEEE Joint Conference on Digital Libraries, 57-66. Doi:10.1145/3383583.3398543 Retrieved from www.scopus.com"
)

# Table 1


data<- Add_data(data, ID= 79, N_C=50, N_E = 50, sample="adults", cit= "Que et al. (2020)", year=2020, 
                design="between", sound="music",
                sound_type= "various", db= 70, task= "reading comprehension", IF= NA,
                measure= "reading_speed", mean_C= 28.6,
                var_C= 10.8, 
                mean_E=  30.7, var_E= 12.6,
                var_type= "SD",
                journal= "JCDL '20: Proceedings of the ACM/IEEE Joint Conference on Digital Libraries in 2020",
                reference= "Que, Y., Zheng, Y., Hsiao, J. H., & Hu, X. (2020). Exploring the effect of personalized background music on reading comprehension. Paper presented at the Proceedings of the ACM/IEEE Joint Conference on Digital Libraries, 57-66. Doi:10.1145/3383583.3398543 Retrieved from www.scopus.com"
)


#----------------
#--- Study 15 --- #
#----------------

data<- Add_data(data, ID= 80, N_C=30, N_E = 30, sample="adults", cit= "Ren et al. (2019)", year=2019, 
                design="within", sound="music",
                sound_type= "Chinese", db= 60, task= "reading comprehension", IF= NA,
                measure= "prop_correct", mean_C= 0.71,
                var_C= 0.22, 
                mean_E=  0.64, var_E= 0.30,
                var_type= "SD",
                journal= "Advances in Psychology",
                reference= "Ren, Y., Xu, W., & Guizhou, G. (2019). Effect of Chinese and English Background Music on Efficiency of Chinese and English Reading Comprehension."
)

# We code data only for reading in L1- Chinese


data<- Add_data(data, ID= 80, N_C=30, N_E = 30, sample="adults", cit= "Ren et al. (2019)", year=2019, 
                design="within", sound="music",
                sound_type= "English", db= 60, task= "reading comprehension", IF= NA,
                measure= "prop_correct", mean_C= 0.71,
                var_C= 0.22, 
                mean_E=  0.69, var_E= 0.18,
                var_type= "SD",
                journal= "Advances in Psychology",
                reference= "Ren, Y., Xu, W., & Guizhou, G. (2019). Effect of Chinese and English Background Music on Efficiency of Chinese and English Reading Comprehension."
)


data<- Add_data(data, ID= 80, N_C=30, N_E = 30, sample="adults", cit= "Ren et al. (2019)", year=2019, 
                design="within", sound="music",
                sound_type= "Chinese", db= 60, task= "reading comprehension", IF= NA,
                measure= "reading_speed", mean_C= 56748.60,
                var_C= 16625.90, 
                mean_E=  66352.00, var_E= 18423.52,
                var_type= "SD",
                journal= "Advances in Psychology",
                reference= "Ren, Y., Xu, W., & Guizhou, G. (2019). Effect of Chinese and English Background Music on Efficiency of Chinese and English Reading Comprehension."
)

# We code data only for reading in L1- Chinese


data<- Add_data(data, ID= 80, N_C=30, N_E = 30, sample="adults", cit= "Ren et al. (2019)", year=2019, 
                design="within", sound="music",
                sound_type= "English", db= 60, task= "reading comprehension", IF= NA,
                measure= "reading_speed", mean_C= 56748.60,
                var_C= 16625.90, 
                mean_E=  51869.30, var_E= 21831.66,
                var_type= "SD",
                journal= "Advances in Psychology",
                reference= "Ren, Y., Xu, W., & Guizhou, G. (2019). Effect of Chinese and English Background Music on Efficiency of Chinese and English Reading Comprehension."
)



#----------------
#--- Study 16 --- #
#----------------

data<- Add_data(data, ID= 81, N_C=29, N_E = 29, sample="adults", cit= "Ross et al. (2021)", year=2021, 
                design="within", sound="speech",
                sound_type= "babble", db= mean(c(45, 65)), task= "text word learning", IF= NA,
                measure= "perc_correct", mean_C= 25.86,
                var_C= 22.14, 
                mean_E=  mean(c(23.56, 31.03)), var_E= mean(c(23.78, 23.46)),
                var_type= "SD",
                journal= "Dissertation",
                reference= "Ross, C. A. (2021). Examining the effects of background noise on contextualized word learning (Order No. 28811802). Available from ProQuest Dissertations & Theses Global: The Humanities and Social Sciences Collection. (2598030912). Retrieved from http://libproxy.lib.csusb.edu/login?url=https://www.proquest.com/dissertations-theses/examining-effects-background-noise-on/docview/2598030912/se-2?accountid=10359"
)

# Table 3, average out two sound intensities


#----------------
#--- Study 17 --- #
#----------------

data<- Add_data(data, ID= 82, N_C=34, N_E = 34, sample="children", cit= "Su et al. (2017), Sample 1", year=2017, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 2.633,
                measure= "num_correct", mean_C= 6.94,
                var_C= 3.38, 
                mean_E=  8.97, var_E= 3.42,
                var_type= "SD",
                journal= "Journal of Educational Technology & Society",
                reference= "Su, Y. N., Kao, C. C., Hsu, C. C., Pan, L. C., Cheng, S. C., & Huang, Y. M. (2017). How does Mozart’s music affect children’s reading? The evidence from learning anxiety and reading rates with e-books. Journal of Educational Technology & Society, 20(2), 101-112."
)

# Table 6

data<- Add_data(data, ID= 82, N_C=28, N_E = 28, sample="children", cit= "Su et al. (2017), Sample 2", year=2017, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 2.633,
                measure= "num_correct", mean_C= 7.75,
                var_C= 2.19, 
                mean_E=  10.32, var_E= 2.44,
                var_type= "SD",
                journal= "Journal of Educational Technology & Society",
                reference= "Su, Y. N., Kao, C. C., Hsu, C. C., Pan, L. C., Cheng, S. C., & Huang, Y. M. (2017). How does Mozart’s music affect children’s reading? The evidence from learning anxiety and reading rates with e-books. Journal of Educational Technology & Society, 20(2), 101-112."
)

# reading speed

data<- Add_data(data, ID= 82, N_C=34, N_E = 34, sample="children", cit= "Su et al. (2017), Sample 1", year=2017, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 2.633,
                measure= "reading_speed", mean_C= 282.58,
                var_C= 10.09, 
                mean_E=  291.12, var_E= 11.74,
                var_type= "SD",
                journal= "Journal of Educational Technology & Society",
                reference= "Su, Y. N., Kao, C. C., Hsu, C. C., Pan, L. C., Cheng, S. C., & Huang, Y. M. (2017). How does Mozart’s music affect children’s reading? The evidence from learning anxiety and reading rates with e-books. Journal of Educational Technology & Society, 20(2), 101-112."
)

# Table 3

data<- Add_data(data, ID= 82, N_C=28, N_E = 28, sample="children", cit= "Su et al. (2017), Sample 2", year=2017, 
                design="within", sound="music",
                sound_type= "instrumental", db= NA, task= "reading comprehension", IF= 2.633,
                measure= "reading_speed", mean_C= 282.21,
                var_C= 10.14, 
                mean_E=  289.93, var_E= 9.66,
                var_type= "SD",
                journal= "Journal of Educational Technology & Society",
                reference= "Su, Y. N., Kao, C. C., Hsu, C. C., Pan, L. C., Cheng, S. C., & Huang, Y. M. (2017). How does Mozart’s music affect children’s reading? The evidence from learning anxiety and reading rates with e-books. Journal of Educational Technology & Society, 20(2), 101-112."
)



#----------------
#--- Study 18 --- #
#----------------


data<- Add_data(data, ID= 83, N_C=48, N_E = 48, sample="adults", cit= "Vasilev et al. (2019)", year=2019, 
                design="within", sound="noise",
                sound_type= "sine tones", db= 65, task= "reading comprehension", IF= 2.138,
                measure= "reading_speed", mean_C= 246,
                var_C= 83, 
                mean_E=  243, var_E= 85,
                var_type= "SD",
                journal= "Quarterly Journal of Experimental Psychology",
                reference= "Vasilev, M. R., Parmentier, F. B., Angele, B., & Kirkby, J. A. (2019). Distraction by deviant sounds during reading: An eye-movement study. Quarterly Journal of Experimental Psychology, 72(7), 1863-1875."
)

data<- Add_data(data, ID= 83, N_C=48, N_E = 48, sample="adults", cit= "Vasilev et al. (2019)", year=2019, 
                design="within", sound="noise",
                sound_type= "deviant", db= 65, task= "reading comprehension", IF= 2.138,
                measure= "reading_speed", mean_C= 246,
                var_C= 83, 
                mean_E=  254, var_E= 102,
                var_type= "SD",
                journal= "Quarterly Journal of Experimental Psychology",
                reference= "Vasilev, M. R., Parmentier, F. B., Angele, B., & Kirkby, J. A. (2019). Distraction by deviant sounds during reading: An eye-movement study. Quarterly Journal of Experimental Psychology, 72(7), 1863-1875."
)
# Table 3
# coding just FFD since the effect seems to originate from there


# Comprehension accuracy:
data<- Add_data(data, ID= 83, N_C=48, N_E = 48, sample="adults", cit= "Vasilev et al. (2019)", year=2019, 
                design="within", sound="noise",
                sound_type= "sine tones", db= 65, task= "reading comprehension", IF= 2.138,
                measure= "perc_correct", mean_C= 95.1,
                var_C= 21.7, 
                mean_E=  94.7, var_E= 22.4,
                var_type= "SD",
                journal= "Quarterly Journal of Experimental Psychology",
                reference= "Vasilev, M. R., Parmentier, F. B., Angele, B., & Kirkby, J. A. (2019). Distraction by deviant sounds during reading: An eye-movement study. Quarterly Journal of Experimental Psychology, 72(7), 1863-1875."
)

data<- Add_data(data, ID= 83, N_C=48, N_E = 48, sample="adults", cit= "Vasilev et al. (2019)", year=2019, 
                design="within", sound="noise",
                sound_type= "deviant", db= 65, task= "reading comprehension", IF= 2.138,
                measure= "perc_correct", mean_C= 95.1,
                var_C= 21.7, 
                mean_E=  95.2, var_E= 21.3,
                var_type= "SD",
                journal= "Quarterly Journal of Experimental Psychology",
                reference= "Vasilev, M. R., Parmentier, F. B., Angele, B., & Kirkby, J. A. (2019). Distraction by deviant sounds during reading: An eye-movement study. Quarterly Journal of Experimental Psychology, 72(7), 1863-1875."
)