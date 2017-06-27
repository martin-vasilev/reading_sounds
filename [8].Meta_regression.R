
# Martin R. Vasilev, 2017

rm(list=ls())

library(rjags)
source("Functions/BmetaReg.R")
source("Functions/Bmeta.R")
source("Functions/settings.R")

# load data:
load("Data/subset/metareg/LM1.Rda")
load("Data/subset/metareg/LM2.Rda")

LM1<- LM1[,c("g", "g_var", "cov")]
colnames(LM1)<- BRcols

LM2<- LM2[,c("g", "g_var", "cov")]
colnames(LM2)<- BRcols


# lyrical vs non-lyrical music:
MR_LM1<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(LM1),
                     "R1.txt"), LM1, n.chains=5, n.adapt=3000, quiet=FALSE)
R_LM1<- coda.samples(MR_LM1, c('mu', 'tau', "beta", "theta"), n.iter=75000, thin=5)
sumR1<- summary(R_LM1); save(sumR1, file="Summary/Reg/sumR1.Rda") # MAIN

gelman.diag(R_LM1, confidence=0.95)
acfplot(R_LM1)
#traceplot(R_LM1, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_LM1, variable.names='beta', n.iter=75000, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF1<- ecdf(S1); ECDF1(0)



# oposite coding (sensitivity test):
MR_LM2<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(LM2),
                             "R2.txt"), LM2, n.chains=5, n.adapt=3000, quiet=FALSE)
R_LM2<- coda.samples(MR_LM2, c('mu', 'tau', "beta"), n.iter=75000, thin=5)
sumR2<- summary(R_LM2); save(sumR2, file="Summary/Reg/sumR2.Rda") # MAIN

gelman.diag(R_LM2, confidence=0.95)
acfplot(R_LM2)
#traceplot(R_LM2, smooth=FALSE) # take long to print with many studies

# ecdf:
S2<-jags.samples(MR_LM2, variable.names='beta', n.iter=75000, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF2<- ecdf(S2); ECDF2(0)


### Simple effects:
lyr<- subset(LM1, cov==1)
lyr<- lyr[,-3]
nonLyr<- subset(LM1, cov==-1)
nonLyr<- nonLyr[,-3]

lyrM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(lyr), "lyrM.txt"),
                  lyr, n.chains=5, n.adapt=3000,  quiet=FALSE,
                       inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
lyrM<- coda.samples(lyrM1, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
lyrS<- summary(lyrM)
save(lyrS, file="Summary/Reg/lyrS.Rda")


gelman.diag(lyrM, confidence=0.95)
acfplot(lyrM)
#traceplot(lyrM, smooth=FALSE) # take long to print with many studies

# posterior plots:
SL<-jags.samples(lyrM1, variable.names='mu', n.iter=75000, thin=5, n.adapt=3000)
SL<-c(SL$mu[1,,1], SL$mu[1,,2], SL$mu[1,,3], SL$mu[1,,4], SL$mu[1,,5])
save(SL, file="Posterior/SL.Rda")


# non-lyrical:
nonLyrM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(nonLyr), "nonLyrM.txt"),
                  nonLyr, n.chains=5, n.adapt=3000,  quiet=FALSE,
                  inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
nonLyrM<- coda.samples(nonLyrM1, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
nonLyrS<- summary(nonLyrM)
save(nonLyrS, file="Summary/Reg/nonLyrS.Rda")

gelman.diag(nonLyrM, confidence=0.95)
acfplot(nonLyrM)
#traceplot(nonLyrM, smooth=FALSE) # take long to print with many studies

# posterior plots:
SNL<-jags.samples(nonLyrM1, variable.names='mu', n.iter=75000, thin=5, n.adapt=3000)
SNL<-c(SNL$mu[1,,1], SNL$mu[1,,2], SNL$mu[1,,3], SNL$mu[1,,4], SNL$mu[1,,5])
save(SNL, file="Posterior/SNL.Rda")


# Intelligible speech vs lyrical music:
load("Data/subset/metareg/SM.Rda")

SM<- SM[,c("g", "g_var", "cov")]
colnames(SM)<- BRcols


MR_SM1<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(SM),
                             "RSM1.txt"), SM, n.chains=5, n.adapt=3000, quiet=FALSE)
R_SM1<- coda.samples(MR_SM1, c('mu', 'tau', "beta", "theta"), n.iter=75000, thin=5)
sumR2<- summary(R_SM1); save(sumR2, file="Summary/Reg/sumR2.Rda") # MAIN

gelman.diag(R_SM1, confidence=0.95)
acfplot(R_SM1)
#traceplot(R_SM1, smooth=FALSE) # take long to print with many studies

# ecdf:
S2<-jags.samples(MR_SM1, variable.names='beta', n.iter=75000, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF2<- ecdf(S2); ECDF2(0)


### Simple effects:
SM1<- subset(SM, cov==-1) # lyrical music
SM1<- SM1[,-3]
SM2<- subset(SM, cov==1) # intelligible speech
SM2<- SM2[,-3]

smM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(SM1), "smM.txt"),
                 SM1, n.chains=5, n.adapt=3000,  quiet=FALSE,
                  inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
smM<- coda.samples(smM1, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
smS<- summary(smM)
save(smS, file="Summary/Reg/smS.Rda")


gelman.diag(smM, confidence=0.95)
acfplot(smM)
#traceplot(smM, smooth=FALSE) # take long to print with many studies


# non-lyrical:
SpM2<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(SM2), "SpM2.txt"),
                 SM2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                     inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
SpM<- coda.samples(SpM2, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
SpMS<- summary(SpM)
save(SpMS, file="Summary/Reg/SpMS.Rda")

gelman.diag(SpM, confidence=0.95)
acfplot(SpM)
#traceplot(SpM, smooth=FALSE) # take long to print with many studies


####

# Intelligible vs unintelligible speech:

load("Data/subset/metareg/PH.Rda")

PH<- PH[,c("g", "g_var", "cov")]
colnames(PH)<- BRcols


MR_PH1<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(PH),
                             "PHM1.txt"), PH, n.chains=5, n.adapt=3000, quiet=FALSE)
MR_PH<- coda.samples(MR_PH1, c('mu', 'tau', "beta", "theta"), n.iter=75000, thin=5)
sumR3<- summary(MR_PH); save(sumR3, file="Summary/Reg/sumR3.Rda") # MAIN

gelman.diag(MR_PH, confidence=0.95)
acfplot(MR_PH)
#traceplot(MR_PH, smooth=FALSE) # take long to print with many studies



### Simple effects:
PH1<- subset(PH, cov==-1) # phonological
PH1<- PH1[,-3]
PH2<- subset(PH, cov==1) # intelligible speech
PH2<- PH2[,-3]

phonM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(PH1), "phonM1.txt"),
                   PH1, n.chains=5, n.adapt=3000,  quiet=FALSE)
phonM<- coda.samples(phonM1, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
phonS<- summary(phonM)
save(phonS, file="Summary/Reg/phonS.Rda")


gelman.diag(phonM, confidence=0.95)
acfplot(phonM)
#traceplot(phonM, smooth=FALSE) # take long to print with many studies


# intelligible:
semM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(PH2), "semM1.txt"),
                  PH2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                 inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
semM<- coda.samples(semM1, c('mu', 'tau', 'theta'), n.iter=75000, thin=5)
semS<- summary(semM)
save(semS, file="Summary/Reg/semS.Rda")

gelman.diag(semM, confidence=0.95)
acfplot(semM)
#traceplot(semM, smooth=FALSE) # take long to print with many studies
