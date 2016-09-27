
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


# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")


#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(metagear)


