
# Martin R. Vasilev, 2016

#-----------------------------------------------#
# Script for calculating effect sizes from data #
#-----------------------------------------------#

rm(list=ls())

source("Functions/effect_sizes.R")

# Load data:
load("Data/data_raw.Rda");
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
SDp<- MD/d_inter; #rm(d_inter, MD)

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


#-----------------------------------
# Study 17: Henderson et al. (1945):
#-----------------------------------

a<- which(data$cit== "Henderson et al. (1945)")

# The closest (and only possible) approximation is to obtain the variance from using
# the pooled SD from the pre-test and post-test (within-subject). This is then used for
# calculating the (between-subject) effect of background condition on the post-test scores 
# (which is what is of interest in this paper). 


#----
# silence (baseline):
#----

d<- Ttest_to_d(t = 0.923, n = data$N_C[a[1]], design = "within", r = r)
# within-subject because same t-statistic is from a pretest-posttest (repeated-measures)
MD<- 3.9 # Table 1
SD_silence<- abs(MD/d)

#----
# classical music (a[1]):
#----

# get pooled SD from t-statistic:

d<- Ttest_to_d(t = 0.266, n = data$N_E[a[1]], design = "within", r=r)
MD<- -1.2 # Table 1
SD_class<- abs(MD/d)

#----
# pop music (a[2]):
#----
d<- Ttest_to_d(t = 6.160, n = data$N_E[a[2]], design = "within", r=r)
MD<- -25.1
SD_pop<- abs(MD/d)


# calculate ES for meta-analysis:

# classical:
data$d[a[1]]<- Cohens_d(M_C = data$mean_C[a[1]], M_E = data$mean_E[a[1]], S_C = SD_silence, 
                        S_E = SD_class, N_C = data$N_C[a[1]], N_E = data$N_E[a[1]], 
                        design = data$design[a[1]], type = "E-C")
data$d_var[a[1]]<- Cohens_d_var(d = data$d[a[1]], N_C = data$N_C[a[1]], N_E = data$N_E[a[1]],
                                design = data$design[a[1]])
data$g[a[1]]<- Hedges_g(d = data$d[a[1]], N_C = data$N_C[a[1]], N_E = data$N_E[a[1]], 
                  design = data$design[a[1]])
data$g_var[a[1]]<- Hedges_g_var(d_var = data$d_var[a[1]], N_C = data$N_C[a[1]], N_E = data$N_E[a[1]],
                                design = data$design[a[1]])
data$CI95_L[a[1]]<- data$g[a[1]]- 1.96*sqrt(data$g_var[a[1]])
data$CI95_R[a[1]]<- data$g[a[1]]+ 1.96*sqrt(data$g_var[a[1]])

# pop:
data$d[a[2]]<- Cohens_d(M_C = data$mean_C[a[2]], M_E = data$mean_E[a[2]], S_C = SD_silence, 
                        S_E = SD_pop, N_C = data$N_C[a[2]], N_E = data$N_E[a[2]], 
                        design = data$design[a[2]], type = "E-C")
data$d_var[a[2]]<- Cohens_d_var(d = data$d[a[2]], N_C = data$N_C[a[2]], N_E = data$N_E[a[2]],
                                design = data$design[a[2]])
data$g[a[2]]<- Hedges_g(d = data$d[a[2]], N_C = data$N_C[a[2]], N_E = data$N_E[a[2]], 
                        design = data$design[a[2]])
data$g_var[a[2]]<- Hedges_g_var(d_var = data$d_var[a[2]], N_C = data$N_C[a[2]], N_E = data$N_E[a[2]],
                                design = data$design[a[2]])
data$CI95_L[a[2]]<- data$g[a[2]]- 1.96*sqrt(data$g_var[a[2]])
data$CI95_R[a[2]]<- data$g[a[2]]+ 1.96*sqrt(data$g_var[a[2]])


#---------------------------
# Study 32 Weinstein (1977):
#---------------------------

a<- which(data$cit=="Weinstein (1977)")

# Contextual errors: effect size computed from the reported (repeated-measures) ANOVA:
data$d[a[2]]<- -ANOVA_to_d(Fvalue = 10.0, n = data$N_C[a[2]], design = data$design[a[2]], r= r)
# negative effect size because study requires opposite coding (>undetected = worse performance)
data$d_var[a[2]]<- Cohens_d_var(d = data$d[a[2]], N = data$N_C[a[2]], 
                                design = data$design[a[2]], r = r)
data$g[a[2]]<- Hedges_g(d = data$d[a[2]], N = data$N_C[a[2]], design = data$design[a[2]])
data$g_var[a[2]]<- Hedges_g_var(d_var = data$d_var[a[2]], N = data$N_C[a[2]], 
                                design = data$design[a[2]])
data$CI95_L[a[2]]<- data$g[a[2]]- 1.96*sqrt(data$g_var[a[2]])
data$CI95_R[a[2]]<- data$g[a[2]]+ 1.96*sqrt(data$g_var[a[2]])


# Non-contextual errors:

# Here, the exact F value is not reported (<1). I use the mean difference and the pooled SD
# from the previous effect size to approximate d.
# This is the closest approximation that can be done with the available information

# effect size is negative, requires opposite coding
SDp<- abs((data$mean_E[a[2]]- data$mean_C[a[2]])/data$d[a[2]])
data$d[a[1]]<- (data$mean_C[a[1]]- data$mean_E[a[1]])/SDp
data$d_var[a[1]]<- Cohens_d_var(d = data$d[a[1]], N = data$N_C[a[1]], design = data$design[a[1]], r=r)
data$g[a[1]]<- Hedges_g(d = data$d[a[1]], N = data$N_C[a[1]], design = data$design[a[1]])
data$g_var[a[1]]<- Hedges_g_var(d_var = data$d_var[a[1]], N = data$N_C[a[1]], 
                                design = data$design[a[1]])
data$CI95_L[a[1]]<- data$g[a[1]]- 1.96*sqrt(data$g_var[a[1]])
data$CI95_R[a[1]]<- data$g[a[1]]+ 1.96*sqrt(data$g_var[a[1]])


#--------------------------------------
# Study 33 Martin et al. (1988), Exp.1:
#--------------------------------------

# Only what is continuous and random speech effect sizes can be recovered. 
# Only qualitative description of the remaining studies is given (i.e. all ps>.10)

# continuous speech:
a<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "native")
data$d[a]<- Ttest_to_d(t = -2.38, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r=r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a] - 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a] + 1.96*sqrt(data$g_var[a])

# random speech:
a<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "random (native)")
data$d[a]<- Ttest_to_d(t = -2.10, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# instrumental music:
# no test statistics are reported. To approximate the ES, I take the average of the pooled SD for the
# 2 available ESs.

ID1<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "native")
ID2<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "random (native)")

SDp1<- (data$mean_E[ID1]- data$mean_C[ID1])/data$d[ID1]
SDp2<- (data$mean_E[ID2]- data$mean_C[ID2])/data$d[ID2]

SDp<- mean(c(SDp1, SDp2)) # (average) pooled SD to br used in the remaining ESs in experiment 1


a<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "instrumental")
data$d[a]<- (data$mean_E[a]- data$mean_C[a])/ SDp
data$d_var[a]<- Cohens_d_var(d = data$d[a], N = data$N_C[a], r = r, design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# random tones:
a<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "random tones")
data$d[a]<- (data$mean_E[a]- data$mean_C[a])/ SDp
data$d_var[a]<- Cohens_d_var(d = data$d[a], N = data$N_C[a], r = r, design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# white noise:
a<- which(data$cit=="Martin et al. (1988), Exp.1" & data$sound_type== "white")
data$d[a]<- (data$mean_E[a]- data$mean_C[a])/ SDp
data$d_var[a]<- Cohens_d_var(d = data$d[a], N = data$N_C[a], r = r, design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])



#--------------------------------------
# Study 34 Martin et al. (1988), Exp.2:
#--------------------------------------

a<- which(data$cit=="Martin et al. (1988), Exp.2" & data$sound_type== "instrumental")

data$d[a]<- Ttest_to_d(t = 0.263, n = data$N_C[a], design = data$design[a], r = r)
# ES positive, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# lyrical music:

# I used the SDp of the available ES:
ID<- which(data$cit=="Martin et al. (1988), Exp.2" & data$sound_type== "instrumental")

SDp<- (data$mean_E[ID]- data$mean_C[ID])/data$d[ID]

a<- which(data$cit=="Martin et al. (1988), Exp.2" & data$sound_type== "lyrical")
data$d[a]<- (data$mean_E[a]- data$mean_C[a])/ SDp
data$d_var[a]<- Cohens_d_var(d = data$d[a], N = data$N_C[a], r = r, design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])

#--------------------------------------
# Study 35 Martin et al. (1988), Exp.4:
#--------------------------------------

# white noise:
a<- which(data$cit=="Martin et al. (1988), Exp.4" & data$sound_type== "white")
data$d[a]<- Ttest_to_d(t = -1.44, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])

# English speech:
a<- which(data$cit=="Martin et al. (1988), Exp.4" & data$sound_type== "native")
data$d[a]<- Ttest_to_d(t = -4.26, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r=r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# Russian speech:
a<- which(data$cit=="Martin et al. (1988), Exp.4" & data$sound_type== "foreign")
data$d[a]<- Ttest_to_d(t = -2.06, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])

#--------------------------------------
# Study 36 Martin et al. (1988), Exp.5:
#--------------------------------------

# white noise:
a<- which(data$cit=="Martin et al. (1988), Exp.5" & data$sound_type== "white")
data$d[a]<- Ttest_to_d(t = -2.91, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# non-word speech:
a<- which(data$cit=="Martin et al. (1988), Exp.5" & data$sound_type== "non-word")
data$d[a]<- Ttest_to_d(t = -2.75, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a] - 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a] + 1.96*sqrt(data$g_var[a])


# random words speech:
a<- which(data$cit=="Martin et al. (1988), Exp.5" & data$sound_type== "random words")
data$d[a]<- Ttest_to_d(t = -4.59, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


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
a<- which(data$cit== "Mitchell (1949)")
data$d[a]<- Ttest_to_d(t = -0.11/1.02, n = data$N_C[a], design = data$design[a], r = r)
# negative sign, see means
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], n =  data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a]) 
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a]) 


#----------------------------------
# Study 39 Armstrong et al. (1991):
#----------------------------------
# TV Ads
a<- which(data$cit== "Armstrong et al. (1991)" & data$sound_type=="TV ads")
# negative sign, see means
data$d[a]<- Ttest_to_d(t = -2.53, N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a],
                               design = data$design[a] )
data$g[a]<- Hedges_g(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N_C = data$N_C[a], N_E = data$N_E[a], 
                             design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


# TV drama
a<- which(data$cit== "Armstrong et al. (1991)" & data$sound_type=="TV drama")
# negative sign, see means
data$d[a]<- Ttest_to_d(t = -1.97, N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$d_var[a]<- Ttest_to_d_var(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a], 
                               design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N_C = data$N_C[a], N_E = data$N_E[a], 
                             design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


#------------------------------
# Study 53 Halin et al. (2014):
#------------------------------
a<- which(data$cit== "Halin et al. (2014)")
# negative sign because speech mean was smaller than silence mean
data$d[a]<- -ANOVA_to_d(Fvalue = 1.39, n = data$N_C[a], design = data$design[a], r = r)
data$d_var[a]<- ANOVA_to_d_var(d = data$d[a], n = data$N_C[a], design = data$design[a], r = r)
data$g[a]<- Hedges_g(d = data$d[a], N = data$N_C[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N = data$N_C[a], design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])


#---------------------------------
# Study 8 Etaugh & Ptasnik (1982):
#---------------------------------

# Here we need the main effect of study condition (i.e. music vs silence)
# negative sign, see means

a<- which(data$cit=="Etaugh & Ptasnik (1982)")
data$d[a]<- -ANOVA_to_d(Fvalue = 5.72, N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$d_var[a]<- ANOVA_to_d_var(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a], 
                               design = data$design[a])
data$g[a]<- Hedges_g(d = data$d[a], N_C = data$N_C[a], N_E = data$N_E[a], design = data$design[a])
data$g_var[a]<- Hedges_g_var(d_var = data$d_var[a], N_C = data$N_C[a], N_E = data$N_E[a], 
                             design = data$design[a])
data$CI95_L[a]<- data$g[a]- 1.96*sqrt(data$g_var[a])
data$CI95_R[a]<- data$g[a]+ 1.96*sqrt(data$g_var[a])



## remove 2 effect sizes that are not reading speed:
a<- which(data$cit=="Pool et al. (2000), Exp.1" & data$measure=="reading_speed")
data<- data[-a,]

a<- which(data$cit=="Pool et al. (2000), Exp.2" & data$measure=="reading_speed")
data<- data[-a,]


# remove proofreading speed:

data<- subset(data, measure!="proofreading_speed")


# Save data: 
save(data, file= "Data/data.Rda")
write.csv(data, file= "Data/data.csv")


#source("https://bioconductor.org/biocLite.R")
#biocLite("EBImage")
#library(metagear)
