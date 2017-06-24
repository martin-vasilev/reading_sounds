
# Martin R. Vasilev, 2017

rm(list=ls())

library(rjags)
source("Functions/BmetaReg.R")
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
R_LM1<- coda.samples(MR_LM1, c('mu', 'tau', "beta"), n.iter=75000, thin=5)
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


