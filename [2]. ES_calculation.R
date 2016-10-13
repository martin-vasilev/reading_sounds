
# Martin R. Vasilev, 2016

#-----------------------------------------------#
# Script for calculating effect sizes from data #
#-----------------------------------------------#

rm(list=ls())

source("Functions/get_es.R")
source("Functions/effect_sizes.R")

# Load data:
load("Data/data.Rda")
load("data/r.Rda")

# Calculate Effect sizes
es<- get_es(data)

colnames(es)<- c("ID", "cit", "year", "design", "sound", "sound_type", "db",
                 "task", "measure", "d", "var_d", "g", "var_d")


##################
# Special cases: #
##################

# Studies in which effect sizes had to approximated or extracted from test statistics. 
# This refers to studies with incomplete reporting of descriptive statistics:


#---------------------------
# Study 32 Weinstein (1977):
#---------------------------

# Contextual errors: effect size computed from the reported (repeated-measures) ANOVA:
es$d[71]<- ANOVA_to_d(Fvalue = 10.0, n= data$N_C[71], design= data$design[71], r=r)
es$d[71]<- - es$d[71]
es$var_d[71]<- ANOVA_to_d_var(d= es$d[71], n= data$N_C[71], design= data$design[71], r=r)

# Non-contextual errors:
# Here, the exact F value is not reported (<1). The mean difference is .3.
# To approximate the F value, I use the ratio of mean difference to F value above (2.5)
# This is possibly the closest approximation that can be done with the available information

es$d[70]<- ANOVA_to_d(Fvalue = 0.3*2.5, n= data$N_C[70], design= data$design[70], r=r)
es$d[70]<- - es$d[70]
es$var_d[70]<- ANOVA_to_d_var(d= es$d[70], n= data$N_C[70], design= data$design[70], r=r)


#--------------------------------------
# Study 33 Martin et al. (1988), Exp.1:
#--------------------------------------

# Only what is continuous and random speech effect sizes can be recovered. 
# Only qualitative description of the remaining studies is given (i.e. all ps>.10)

# continuous speech:
es$d[72]<- Ttest_to_d(t = -2.38, n= data$N_C[72], design= data$design[72], r=r)
es$var_d[72]<- Ttest_to_d_var(d= es$d[72], n= data$N_C[72], design= data$design[72], r=r)

# random speech:
es$d[73]<- Ttest_to_d(t = -2.10, n= data$N_C[73], design= data$design[73], r=r)
es$var_d[73]<- Ttest_to_d_var(d= es$d[73], n= data$N_C[73], design= data$design[73], r=r)


#--------------------------------------
# Study 34 Martin et al. (1988), Exp.2:
#--------------------------------------

es$d[74]<- Ttest_to_d(t = 0.263, n= data$N_C[74], design= data$design[74], r=r)
es$var_d[74]<- Ttest_to_d_var(d= es$d[74], n= data$N_C[74], design= data$design[74], r=r)


#--------------------------------------
# Study 35 Martin et al. (1988), Exp.4:
#--------------------------------------

# white noise:
es$d[75]<- Ttest_to_d(t = -1.44, n= data$N_C[75], design= data$design[75], r=r)
es$var_d[75]<- Ttest_to_d_var(d= es$d[75], n= data$N_C[75], design= data$design[75], r=r)

# English speech:
es$d[76]<- Ttest_to_d(t = -4.26, n= data$N_C[76], design= data$design[76], r=r)
es$var_d[76]<- Ttest_to_d_var(d= es$d[76], n= data$N_C[76], design= data$design[76], r=r)

# Russian speech:
es$d[77]<- Ttest_to_d(t = -2.06, n= data$N_C[77], design= data$design[77], r=r)
es$var_d[77]<- Ttest_to_d_var(d= es$d[77], n= data$N_C[77], design= data$design[77], r=r)


#--------------------------------------
# Study 36 Martin et al. (1988), Exp.5:
#--------------------------------------

# white noise:
es$d[78]<- Ttest_to_d(t = -2.91, n= data$N_C[78], design= data$design[78], r=r)
es$var_d[78]<- Ttest_to_d_var(d= es$d[78], n= data$N_C[78], design= data$design[78], r=r)

# non-word speech:
es$d[79]<- Ttest_to_d(t = -2.75, n= data$N_C[79], design= data$design[79], r=r)
es$var_d[79]<- Ttest_to_d_var(d= es$d[79], n= data$N_C[79], design= data$design[79], r=r)

# random words speech:
es$d[80]<- Ttest_to_d(t = -4.59, n= data$N_C[80], design= data$design[80], r=r)
es$var_d[80]<- Ttest_to_d_var(d= es$d[80], n= data$N_C[80], design= data$design[80], r=r)


#-------------------------------
# Study 37 Gawron (1984), Exp.1:
#-------------------------------

# Here we need the interaction between Time and schedule. The reason is that noise exposure happened
# only in the second hour, thus a general noise effect can be shown if performance differed between the 2
# schedules only in the second hour (noise vs silence) but not in the first hour (silence vs silence)

# white noise:
#es$d[81]<- ANOVA_to_d(Fvalue=0.29, n= data$N_C[81], design= data$design[81], r=r)
#es$var_d[81]<- ANOVA_to_d_var(d= es$d[81], n= data$N_C[81], design= data$design[81], r=r)



# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")


#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(metagear)


