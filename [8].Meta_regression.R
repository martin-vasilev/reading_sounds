
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
R_LM1<- coda.samples(MR_LM1, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR1<- summary(R_LM1); save(sumR1, file="Summary/Reg/sumR1.Rda") # MAIN
effectiveSize(R_LM1)


gelman.diag(R_LM1, confidence=0.95)
acfplot(R_LM1)
#traceplot(R_LM1, smooth=FALSE) # take long to print with many studies
plot(R_LM1, density=FALSE)

# ecdf:
S1<-jags.samples(MR_LM1, variable.names= c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF1<- ecdf(S1); ECDF1(0)

LM1p<- S1$beta[1,,1]
save(LM1p, file= "Posterior/LM1p.Rda")


# oposite coding (sensitivity test):
MR_LM2<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(LM2),
                             "R2.txt"), LM2, n.chains=5, n.adapt=3000, quiet=FALSE)
R_LM2<- coda.samples(MR_LM2, c('mu', 'tau', "beta"), n.iter=Niter+50000)
sumR2<- summary(R_LM2); save(sumR2, file="Summary/Reg/sumR2.Rda") # MAIN
effectiveSize(R_LM2)

gelman.diag(R_LM2, confidence=0.95)
acfplot(R_LM2)
#traceplot(R_LM2, smooth=FALSE) # take long to print with many studies
plot(R_LM2, density=F)

# ecdf:
S2<-jags.samples(MR_LM2, variable.names=c('beta', 'mu'), n.iter=Niter+50000, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF2<- ecdf(S2); ECDF2(0)

LM2p<- S2$beta[1,,1]
save(LM2p, file= "Posterior/LM2p.Rda")

### Simple effects:
lyr<- subset(LM1, cov==1)
lyr<- lyr[,-3]
nonLyr<- subset(LM1, cov==-1)
nonLyr<- nonLyr[,-3]

lyrM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(lyr), "lyrM.txt"),
                  lyr, n.chains=5, n.adapt=3000,  quiet=FALSE,
                       inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
lyrM<- coda.samples(lyrM1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
lyrS<- summary(lyrM)
save(lyrS, file="Summary/Reg/lyrS.Rda")
effectiveSize(lyrM)

gelman.diag(lyrM, confidence=0.95)
acfplot(lyrM)
#traceplot(lyrM, smooth=FALSE) # take long to print with many studies

# posterior plots:
SL<-jags.samples(lyrM1, variable.names=c('mu'), n.iter=Niter, thin=5, n.adapt=3000)
SL<-c(SL$mu[1,,1], SL$mu[1,,2], SL$mu[1,,3], SL$mu[1,,4], SL$mu[1,,5])
save(SL, file="Posterior/SL.Rda")


# non-lyrical:
nonLyrM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(nonLyr), "nonLyrM.txt"),
                  nonLyr, n.chains=5, n.adapt=3000,  quiet=FALSE,
                  inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
nonLyrM<- coda.samples(nonLyrM1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
nonLyrS<- summary(nonLyrM)
save(nonLyrS, file="Summary/Reg/nonLyrS.Rda")
effectiveSize(nonLyrM)

gelman.diag(nonLyrM, confidence=0.95)
acfplot(nonLyrM)
#traceplot(nonLyrM, smooth=FALSE) # take long to print with many studies

# posterior plots:
SNL<-jags.samples(nonLyrM1, variable.names=c('mu'), n.iter=Niter, thin=5, n.adapt=3000)
SNL<-c(SNL$mu[1,,1], SNL$mu[1,,2], SNL$mu[1,,3], SNL$mu[1,,4], SNL$mu[1,,5])
save(SNL, file="Posterior/SNL.Rda")


# Intelligible speech vs lyrical music:
load("Data/subset/metareg/SM.Rda")

SM<- SM[,c("g", "g_var", "cov")]
colnames(SM)<- BRcols


MR_SM1<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(SM),
                             "RSM1.txt"), SM, n.chains=5, n.adapt=3000, quiet=FALSE)
R_SM1<- coda.samples(MR_SM1, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR2<- summary(R_SM1); save(sumR2, file="Summary/Reg/sumR2.Rda") # MAIN
effectiveSize(R_SM1)


gelman.diag(R_SM1, confidence=0.95)
acfplot(R_SM1)
#traceplot(R_SM1, smooth=FALSE) # take long to print with many studies

# ecdf:
S2<-jags.samples(MR_SM1, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF3<- ecdf(S2); ECDF3(0)


### Simple effects:
SM1<- subset(SM, cov==-1) # lyrical music
SM1<- SM1[,-3]
SM2<- subset(SM, cov==1) # intelligible speech
SM2<- SM2[,-3]

smM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(SM1), "smM.txt"),
                 SM1, n.chains=5, n.adapt=3000,  quiet=FALSE,
                  inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
smM<- coda.samples(smM1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
smS<- summary(smM)
save(smS, file="Summary/Reg/smS.Rda")
effectiveSize(smM)

gelman.diag(smM, confidence=0.95)
acfplot(smM)
#traceplot(smM, smooth=FALSE) # take long to print with many studies


# non-lyrical:
SpM2<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(SM2), "SpM2.txt"),
                 SM2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                     inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
SpM<- coda.samples(SpM2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
SpMS<- summary(SpM)
save(SpMS, file="Summary/Reg/SpMS.Rda")
effectiveSize(SpM)

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
MR_PH<- coda.samples(MR_PH1, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR3<- summary(MR_PH); save(sumR3, file="Summary/Reg/sumR3.Rda") # MAIN
effectiveSize(MR_PH)

gelman.diag(MR_PH, confidence=0.95)
acfplot(MR_PH)
#traceplot(MR_PH, smooth=FALSE) # take long to print with many studies


# ecdf:
S2<-jags.samples(MR_PH1, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDFPH<- ecdf(S2); ECDFPH(0)



### Simple effects:
PH1<- subset(PH, cov==-1) # phonological
PH1<- PH1[,-3]
PH2<- subset(PH, cov==1) # intelligible speech
PH2<- PH2[,-3]

phonM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(PH1), "phonM1.txt"),
                   PH1, n.chains=5, n.adapt=3000,  quiet=FALSE)
phonM<- coda.samples(phonM1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
phonS<- summary(phonM)
save(phonS, file="Summary/Reg/phonS.Rda")
effectiveSize(phonM)


gelman.diag(phonM, confidence=0.95)
acfplot(phonM)
#traceplot(phonM, smooth=FALSE) # take long to print with many studies


# intelligible:
semM1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(PH2), "semM1.txt"),
                  PH2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                 inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
semM<- coda.samples(semM1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
semS<- summary(semM)
save(semS, file="Summary/Reg/semS.Rda")
effectiveSize(semM)

gelman.diag(semM, confidence=0.95)
acfplot(semM)
#traceplot(semM, smooth=FALSE) # take long to print with many studies



#######################################
#  Environmental vs acoustical noise:
#######################################
load("Data/subset/metareg/EAN.Rda")

EAN<- EAN[,c("g", "g_var", "cov")]
colnames(EAN)<- BRcols


MR_EAN<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(EAN),
                             "MR_EAN.txt"), EAN, n.chains=5, n.adapt=3000, quiet=FALSE)
R_EAN<- coda.samples(MR_EAN, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumEAN<- summary(R_EAN); save(sumEAN, file="Summary/Reg/sumEAN.Rda") # MAIN
effectiveSize(R_EAN)

gelman.diag(R_EAN, confidence=0.95)
acfplot(R_EAN)
#traceplot(R_EAN, smooth=FALSE) # take long to print with many studies
plot(R_EAN, density=F)

# ecdf:
S2<-jags.samples(MR_EAN, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF_EAN<- ecdf(S2); ECDF_EAN(0)


### Simple effects:
EAN1<- subset(EAN, cov==-1) # acoustical noise
EAN1<- EAN1[,-3]
EAN2<- subset(EAN, cov==1) # environmental noise
EAN2<- EAN2[,-3]

ACM<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(EAN1), "ACM.txt"),
                 EAN1, n.chains=5, n.adapt=3000,  quiet=FALSE
                 )
AC<- coda.samples(ACM, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
sumAC<- summary(AC)
save(sumAC, file="Summary/Reg/sumAC.Rda")
effectiveSize(AC)


gelman.diag(AC, confidence=0.95)
acfplot(AC)
#traceplot(AC, smooth=FALSE) # takes long to print with many studies
plot(AC, density=F)

# environmental noise:
ENM<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(EAN2), "ENM.txt"),
                EAN2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                 inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
EN<- coda.samples(ENM, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
sumEN<- summary(EN)
save(sumEN, file="Summary/Reg/sumEN.Rda")
effectiveSize(EN)

gelman.diag(EN, confidence=0.95)
acfplot(EN)
#traceplot(EN, smooth=FALSE) # take long to print with many studies
plot(EN, density=F)


###########################################
#  Instrumental music vs acoustical noise:
###########################################
load("Data/subset/metareg/MAN.Rda")

MAN<- MAN[,c("g", "g_var", "cov")]
colnames(MAN)<- BRcols


MR_MAN<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(MAN),
                             "MR_MAN.txt"), MAN, n.chains=5, n.adapt=3000, quiet=FALSE)
R_MAN<- coda.samples(MR_MAN, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumMAN<- summary(R_MAN); save(sumMAN, file="Summary/Reg/sumMAN.Rda") # MAIN
effectiveSize(R_MAN)

gelman.diag(R_MAN, confidence=0.95)
acfplot(R_MAN)
#traceplot(R_MAN, smooth=FALSE) # takes long to print with many studies
plot(R_MAN, density = F)

# ecdf:
S2<-jags.samples(MR_MAN, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S2<-c(S2$beta[1,,1],S2$beta[1,,2],S2$beta[1,,3], S2$beta[1,,4], S2$beta[1,,5])
ECDF_MAN<- ecdf(S2); ECDF_MAN(0)



#---------------------------------------------------------------------
#                            Children...
#---------------------------------------------------------------------

load("Data/subset/gen.Rda")
gen$cov<- NULL

for(i in 1:nrow(gen)){
  if(gen$sample[i]=="children"){
    gen$cov[i]<- -1
  } else{
    gen$cov[i]<- 1
  }
}

gen<- gen[,c('g', 'g_var', 'cov')]
colnames(gen)<- BRcols
table(gen$cov)


### reading comprehension (all sounds):
MR_chGCP<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(gen),
                             "MR_chGCP.txt"), gen, n.chains=5, n.adapt=3000, quiet=FALSE)
R_chGCP<- coda.samples(MR_chGCP, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR_chGCP<- summary(R_chGCP); save(sumR_chGCP, file="Summary/Reg/sumR_chGCP.Rda") # MAIN
effectiveSize(R_chGCP)

gelman.diag(R_chGCP, confidence=0.95)
acfplot(R_chGCP)
#traceplot(R_chGCP, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_chGCP, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF_CGCP<- ecdf(S1); 1-ECDF_CGCP(0)


################# Freq:
library(meta)
m1<- metagen(TE=`T`,seTE = sqrt(S.sqr), sm = "SMD",data=gen,
             comb.random = T, level = 0.95, method.tau = "REML")
mr<- metareg(m1, ~cov)




#### reading speed:
load("Data/subset/gen_speed.Rda")
gen_speed$cov<- NULL

for(i in 1:nrow(gen_speed)){
  if(gen_speed$sample[i]=="children"){
    gen_speed$cov[i]<- -1
  } else{
    gen_speed$cov[i]<- 1
  }
}

gen_speed<- gen_speed[,c('g', 'g_var', 'cov')]
colnames(gen_speed)<- BRcols


##
MR_chGRS<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(gen_speed),
                               "MR_chGRS.txt"), gen_speed, n.chains=5, n.adapt=3000, quiet=FALSE)
R_chGRS<- coda.samples(MR_chGRS, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR_chGRS<- summary(R_chGRS); save(sumR_chGRS, file="Summary/Reg/sumR_chGRS.Rda") # MAIN

gelman.diag(R_chGRS, confidence=0.95)
acfplot(R_chGRS)
#traceplot(R_chGRS, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_chGRS, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF_CGRS<- ecdf(S1); 1-ECDF_CGRS(0)



###### music:

load("Data/subset/music.Rda")

music$cov<- NULL

for(i in 1:nrow(music)){
  if(music$sample[i]=="children"){
    music$cov[i]<- -1
  } else{
    music$cov[i]<- 1
  }
}

music<- music[,c('g', 'g_var', 'cov')]
colnames(music)<- BRcols
table(music$cov)


##
MR_chGM<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(music),
                               "MR_chGM.txt"), music, n.chains=5, n.adapt=3000, quiet=FALSE)
R_chGM<- coda.samples(MR_chGM, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR_chGM<- summary(R_chGM); save(sumR_chGM, file="Summary/Reg/sumR_chGM.Rda") # MAIN
effectiveSize(R_chGM)

gelman.diag(R_chGM, confidence=0.95)
acfplot(R_chGM)
#traceplot(R_chGM, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_chGM, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF_CGM<- ecdf(S1); 1-ECDF_CGM(0)
#

#####
m2<- metagen(TE=`T`,seTE = sqrt(S.sqr), sm = "SMD",data=music,
             comb.random = T, level = 0.95, method.tau = "REML")
mr2<- metareg(m2, ~cov)




####### speech:
load("Data/subset/speech.Rda")

speech$cov<- NULL

for(i in 1:nrow(speech)){
  if(speech$sample[i]=="children"){
    speech$cov[i]<- -1
  } else{
    speech$cov[i]<- 1
  }
}

speech<- speech[,c('g', 'g_var', 'cov')]
colnames(speech)<- BRcols
table(speech$cov)


##
MR_chGS<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(speech),
                              "MR_chGS.txt"), speech, n.chains=5, n.adapt=3000, quiet=FALSE)
R_chGS<- coda.samples(MR_chGS, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR_chGS<- summary(R_chGS); save(sumR_chGS, file="Summary/Reg/sumR_chGS.Rda") # MAIN
effectiveSize(R_chGS)

gelman.diag(R_chGS, confidence=0.95)
acfplot(R_chGS)
#traceplot(R_chGS, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_chGS, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF_CGS<- ecdf(S1); 1-ECDF_CGS(0)


#####
m3<- metagen(TE=`T`,seTE = sqrt(S.sqr), sm = "SMD",data=speech,
             comb.random = T, level = 0.95, method.tau = "REML")
mr3<- metareg(m3, ~cov)


###### Noise:
load("Data/subset/noise.Rda")

noise$cov<- NULL

for(i in 1:nrow(noise)){
  if(noise$sample[i]=="children"){
    noise$cov[i]<- -1
  } else{
    noise$cov[i]<- 1
  }
}

noise<- noise[,c('g', 'g_var', 'cov')]
colnames(noise)<- BRcols
table(noise$cov)


##
MR_chGN<- jags.model(BmetaReg("dunif(-10, 10)", "dunif(0, 10)", "dunif(-10, 10)", nrow(noise),
                              "MR_chGN.txt"), noise, n.chains=5, n.adapt=3000, quiet=FALSE)
R_chGN<- coda.samples(MR_chGN, c('mu', 'tau', "beta", "theta"), n.iter=Niter, thin=5)
sumR_chGN<- summary(R_chGN); save(sumR_chGN, file="Summary/Reg/sumR_chGN.Rda") # MAIN
effectiveSize(R_chGN)

gelman.diag(R_chGN, confidence=0.95)
acfplot(R_chGN)
#traceplot(R_chGN, smooth=FALSE) # take long to print with many studies

# ecdf:
S1<-jags.samples(MR_chGN, variable.names=c('beta', 'mu'), n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(S1$beta[1,,1],S1$beta[1,,2],S1$beta[1,,3], S1$beta[1,,4], S1$beta[1,,5])
ECDF_CGN<- ecdf(S1); 1-ECDF_CGN(0)

#####
m4<- metagen(TE=`T`,seTE = sqrt(S.sqr), sm = "SMD",data=noise,
             comb.random = T, level = 0.95, method.tau = "REML")
mr4<- metareg(m4, ~cov)
