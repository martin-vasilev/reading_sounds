
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


# Study 32 Weinstein (1977):
#---------------------------

# Contextual errors: effect size computed from the reported (repeated-measures) ANOVA:
es$d[71]<- ANOVA_to_d(Fvalue = 10.0, n= data$N_C[71], design= data$design[71], r=r)
es$var_d[71]<- ANOVA_to_d_var(d= es$d[71], n= data$N_C[71], design= data$design[71], r=r)

# Non-contextual errors:
# Here, the exact F value is not reported (<1). The mean difference is .3.
# To approximate the F value, I use the ratio of mean difference to F value above (2.5)
# This is possibly the closest approximation that can be done with the available information

es$d[70]<- ANOVA_to_d(Fvalue = 0.3*2.5, n= data$N_C[70], design= data$design[70], r=r)
es$var_d[70]<- ANOVA_to_d_var(d= es$d[70], n= data$N_C[70], design= data$design[70], r=r)


# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")


#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(metagear)


