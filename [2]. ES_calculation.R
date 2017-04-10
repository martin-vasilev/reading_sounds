
# Martin R. Vasilev, 2016

#-----------------------------------------------#
# Script for calculating effect sizes from data #
#-----------------------------------------------#

rm(list=ls())

source("Functions/effect_sizes.R")

# Load data:
load("Data/data.Rda");
load("data/r.Rda")

reference<- as.character(data$reference)
data$reference<- NULL

measures<- unique(as.character(data$measure))
#normal_codingQ<- measures[which(!is.element(measures, c("reading_speed", "perc_incorrect", "proofreading_speed",
#                                                  "prop_misses")))]
normal_codingQ<- measures[which(!is.element(measures, c("perc_incorrect", "prop_misses")))]


#NCD<- which(is.element(data$measure, normal_codingQ) & !is.na(data$var_C))
NCD<- which(!is.na(data$var_C))


regulars<- c("num_correct", "prop_correct", "perc_correct", "reading_score")
oposite<- c("reading_speed", "proofreading_speed", "prop_misses", "perc_incorrect")

# Calculate ES for studies with normal coding

data$d<- NA
data$d_var<- NA
data$g<- NA
data$g_var<- NA

for(i in 1:length(NCD)){
  
  if(is.element(data$measure[NCD[i]], regulars)){
    type<- "E-C"
  } else{
    type<- "C-E"
  }
  
  
  if(data$design[NCD[i]]=="between"){
    
    if(data$var_type[NCD[i]]== "SD"){
      data$d[NCD[i]]<- Cohens_d(M_C = data$mean_C[NCD[i]], M_E = data$mean_E[NCD[i]], S_C = data$var_C[NCD[i]],
                              S_E = data$var_E[NCD[i]], N_C = data$N_C[NCD[i]], N_E = data$N_E[NCD[i]],
                              design = as.character(data$design[NCD[i]]), type = type)
    } else{
      data$d[NCD[i]]<- Cohens_d(M_C = data$mean_C[NCD[i]], M_E = data$mean_E[NCD[i]], 
                              S_C = data$var_C[NCD[i]]* sqrt(data$N_C[NCD[i]]),
                              S_E = data$var_E[NCD[i]]*sqrt(data$N_E[NCD[i]]),
                              N_C = data$N_C[NCD[i]], N_E = data$N_E[NCD[i]],
                              design = as.character(data$design[NCD[i]]), type = type)
    }
    
    
    data$d_var[NCD[i]]<- Cohens_d_var(d = data$d[NCD[i]], N_C = data$N_C[NCD[i]], N_E = data$N_E[NCD[i]],
                                      design = as.character(data$design[NCD[i]]))
    
    data$g[NCD[i]]<- Hedges_g(d = data$d[NCD[i]], N_C = data$N_C[NCD[i]], N_E = data$N_E[NCD[i]],
                              design =  as.character(data$design[NCD[i]]))
    
    data$g_var[NCD[i]]<- Hedges_g_var(d_var = data$d_var[NCD[i]], N_C = data$N_C[NCD[i]], N_E = data$N_E[NCD[i]],
                                      design = as.character(data$design[NCD[i]]))
    
  } else{
    
    if(data$var_type[NCD[i]]== "SD"){
        data$d[NCD[i]]<- Cohens_d(M_C = data$mean_C[NCD[i]], M_E = data$mean_E[NCD[i]], S_C = data$var_C[NCD[i]],
                              S_E = data$var_E[NCD[i]], N = data$N_C[NCD[i]], r = r,
                              design = as.character(data$design[NCD[i]]), type = type)
    }else{
        data$d[NCD[i]]<- Cohens_d(M_C = data$mean_C[NCD[i]], M_E = data$mean_E[NCD[i]],
                              S_C = data$var_C[NCD[i]]*sqrt(data$N_C[NCD[i]]),
                              S_E = data$var_E[NCD[i]]*sqrt(data$N_C[NCD[i]]), 
                              N = data$N_C[NCD[i]], r = r,
                              design = as.character(data$design[NCD[i]]), type = type)
    }

    
    data$d_var[NCD[i]]<- Cohens_d_var(d = data$d[NCD[i]], N = data$N_C[NCD[i]], r = r,
                                      design = as.character(data$design[NCD[i]]))
    
    data$g[NCD[i]]<- Hedges_g(d = data$d[NCD[i]], N = data$N_C[NCD[i]], 
                              design =  as.character(data$design[NCD[i]]))
    
    data$g_var[NCD[i]]<- Hedges_g_var(d_var = data$d_var[NCD[i]], N = data$N_C[NCD[i]], 
                                      design = as.character(data$design[NCD[i]]))
  }
}

data$CI95_L<- data$g- 1.96*sqrt(data$g_var)
data$CI95_R<- data$g+ 1.96*sqrt(data$g_var)

data$reference<- reference

##################
# Special cases: #
##################

# Studies in which effect sizes had to approximated or extracted from test statistics. 
# This refers to studies with incomplete reporting of descriptive statistics:



#---------------------------------
# Study 7 Etaugh & Michals (1975):
#---------------------------------

# data from text

# Simple effect F statistic not reported, so I extract the SD of the difference from the
# reported interaction effect. That's the closest approximation possible.

# gender x music interaction:
d_inter<- ANOVA_to_d(Fvalue= 5.46, n = 32, design = "within", r=r)

# mean difference of the interaction:
MD<- (8.6-6.6)- (6.6-6.9)
# pooled SD of the interaction ES
SDp<- MD/d_inter

# Approximate effect size of music by using the interaction SD:
d<- ((6.9+6.6)/2- (6.6+8.6)/2)/SDp
d_var= ANOVA_to_d_var(d, n= 32, design= "within", r=r)

a<- which(data$cit== "Etaugh & Michals (1975)")

data$d[a]<- d
data$d_var[a]<- d_var
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])

# 95% CI:
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


#---------------------------
# Study 32 Weinstein (1977):
#---------------------------

# Contextual errors: effect size computed from the reported (repeated-measures) ANOVA:
es$d[76]<- ANOVA_to_d(Fvalue = 10.0, n= data$N_C[76], design= data$design[76], r=r)
es$d[76]<- - es$d[76]
es$var_d[76]<- ANOVA_to_d_var(d= es$d[76], n= data$N_C[76], design= data$design[76], r=r)

# Non-contextual errors:
# Here, the exact F value is not reported (<1). The mean difference is .3.
# To approximate the F value, I use the ratio of mean difference to F value above (2.5)
# This is possibly the closest approximation that can be done with the available information

es$d[75]<- ANOVA_to_d(Fvalue = 0.3*2.5, n= data$N_C[75], design= data$design[75], r=r)
es$d[75]<- - es$d[75]
es$var_d[75]<- ANOVA_to_d_var(d= es$d[75], n= data$N_C[75], design= data$design[75], r=r)


#--------------------------------------
# Study 33 Martin et al. (1988), Exp.1:
#--------------------------------------

# Only what is continuous and random speech effect sizes can be recovered. 
# Only qualitative description of the remaining studies is given (i.e. all ps>.10)

# continuous speech:
es$d[77]<- Ttest_to_d(t = -2.38, n= data$N_C[77], design= data$design[77], r=r)
es$var_d[77]<- Ttest_to_d_var(d= es$d[77], n= data$N_C[77], design= data$design[77], r=r)

# random speech:
es$d[78]<- Ttest_to_d(t = -2.10, n= data$N_C[78], design= data$design[78], r=r)
es$var_d[78]<- Ttest_to_d_var(d= es$d[78], n= data$N_C[78], design= data$design[78], r=r)


#--------------------------------------
# Study 34 Martin et al. (1988), Exp.2:
#--------------------------------------

es$d[79]<- Ttest_to_d(t = 0.263, n= data$N_C[79], design= data$design[79], r=r)
es$var_d[79]<- Ttest_to_d_var(d= es$d[79], n= data$N_C[79], design= data$design[79], r=r)


#--------------------------------------
# Study 35 Martin et al. (1988), Exp.4:
#--------------------------------------

# white noise:
es$d[80]<- Ttest_to_d(t = -1.44, n= data$N_C[80], design= data$design[80], r=r)
es$var_d[80]<- Ttest_to_d_var(d= es$d[80], n= data$N_C[80], design= data$design[80], r=r)

# English speech:
es$d[81]<- Ttest_to_d(t = -4.26, n= data$N_C[81], design= data$design[81], r=r)
es$var_d[81]<- Ttest_to_d_var(d= es$d[81], n= data$N_C[81], design= data$design[81], r=r)

# Russian speech:
es$d[82]<- Ttest_to_d(t = -2.06, n= data$N_C[82], design= data$design[82], r=r)
es$var_d[82]<- Ttest_to_d_var(d= es$d[82], n= data$N_C[82], design= data$design[82], r=r)


#--------------------------------------
# Study 36 Martin et al. (1988), Exp.5:
#--------------------------------------

# white noise:
es$d[83]<- Ttest_to_d(t = -2.91, n= data$N_C[83], design= data$design[83], r=r)
es$var_d[83]<- Ttest_to_d_var(d= es$d[83], n= data$N_C[83], design= data$design[83], r=r)

# non-word speech:
es$d[84]<- Ttest_to_d(t = -2.75, n= data$N_C[84], design= data$design[84], r=r)
es$var_d[84]<- Ttest_to_d_var(d= es$d[84], n= data$N_C[84], design= data$design[84], r=r)

# random words speech:
es$d[85]<- Ttest_to_d(t = -4.59, n= data$N_C[85], design= data$design[85], r=r)
es$var_d[85]<- Ttest_to_d_var(d= es$d[85], n= data$N_C[85], design= data$design[85], r=r)


#-------------------------------
# Study 37 Gawron (1984), Exp.1:
#-------------------------------

# Here we need the interaction between Time and schedule. The reason is that noise exposure happened
# only in the second hour, thus a general noise effect can be shown if performance differed between the 2
# schedules only in the second hour (noise vs silence) but not in the first hour (silence vs silence)

# white noise:
#es$d[81]<- ANOVA_to_d(Fvalue=0.29, n= data$N_C[81], design= data$design[81], r=r)
#es$var_d[81]<- ANOVA_to_d_var(d= es$d[81], n= data$N_C[81], design= data$design[81], r=r)


#--------------------------
# Study 38 Mitchell (1949):
#--------------------------

# Critical ratio= t value
es$d[90]<- Ttest_to_d(t = -0.11/1.02, n= data$N_C[90], design= data$design[90], r=r)
es$var_d[90]<- Ttest_to_d_var(d= es$d[90], n= data$N_C[90], design= data$design[90], r=r)


#----------------------------------
# Study 39 Armstrong et al. (1991):
#----------------------------------
# TV Ads
es$d[91]<- Ttest_to_d(t = -2.53, N_C= data$N_C[91], N_E= data$N_E[91], design= data$design[91])
es$var_d[91]<- Ttest_to_d_var(d= es$d[91], N_C= data$N_C[91], N_E= data$N_E[91], design= data$design[91])

# TV drama
es$d[92]<- Ttest_to_d(t = -1.97, N_C= data$N_C[92], N_E= data$N_E[92], design= data$design[92])
es$var_d[92]<- Ttest_to_d_var(d= es$d[92], N_C= data$N_C[92], N_E= data$N_E[92], design= data$design[92])


#------------------------------
# Study 53 Halin et al. (2014):
#------------------------------

# negative sign because speech mean was smaller than silence mean
es$d[117]<- -ANOVA_to_d(Fvalue=1.39, n= data$N_C[117], design= data$design[117], r=r)
es$var_d[117]<- ANOVA_to_d_var(d= es$d[117], n= data$N_C[117], design= data$design[117], r=r)


# Save data: 
save(es, file= "Data/es.Rda")
write.csv(es, file= "Data/es.csv")


#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(metagear)
