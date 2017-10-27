
# Martin R. Vasilev, 2017

rm(list= ls())

library(rjags)
library(metafor)
source("Functions/Bmeta.R")
source("Functions/settings.R")
#---------------------------
# General effect of sounds :
#---------------------------

# reading comprehension:
load('Data/subset/gen.Rda')
gen2<- gen[, c("g", "g_var")]
colnames(gen2)<- Bcols


G1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(gen2), "G1.txt"),
                    gen2, n.chains=5, n.adapt=3000,  quiet=FALSE,
                    inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
G1p<- coda.samples(G1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
G1s<- summary(G1p)
save(G1s, file="Summary/G1s.Rda")
effectiveSize(G1p)

JS1<- jags.samples(G1, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(JS1$mu[1,,1],JS1$mu[1,,2],JS1$mu[1,,3], JS1$mu[1,,4], JS1$mu[1,,5])
ECDF1<- ecdf(S1); ECDF1(0)
G1mu<-c(JS1$mu[1,,1])
save(G1mu, file="Posterior/G1mu.Rda")

# check results:
gelman.diag(G1p, confidence=0.95)
acfplot(G1p)
#traceplot(G1p, smooth=FALSE) # takes long to print with many studies


# sensitivity analysis with different priors:
G2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(gen2), "G2.txt"),
               gen2, n.chains=5, n.adapt=3000, quiet=FALSE)
G2p<- coda.samples(G2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
G2s<- summary(G2p)
save(G2s, file="Summary/G2s.Rda")
effectiveSize(G2p)

# check results:
gelman.diag(G2p, confidence=0.95)
acfplot(G2p)
#traceplot(G2p, smooth=FALSE) # take long to print with many studies


# freq. estimate:
(F1 <- rma(gen2$T, gen2$S.sqr, method="REML"))


###############################################################################
# Reading speed (general):
load("Data/subset/gen_speed.Rda")
gen_speed2<- gen_speed[, c('g', 'g_var')]
colnames(gen_speed2)<- Bcols


GR1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(gen_speed2), "GR1.txt"),
               gen_speed2, n.chains=5, n.adapt=3000,  quiet=FALSE,
               inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
GR1p<- coda.samples(GR1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
GR1s<- summary(GR1p)
save(GR1s, file="Summary/GR1s.Rda")
effectiveSize(GR1p)

JSR1<- jags.samples(GR1, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(JSR1$mu[1,,1],JSR1$mu[1,,2],JSR1$mu[1,,3], JSR1$mu[1,,4], JSR1$mu[1,,5])
ECDF2<- ecdf(S1); ECDF2(0)
GR1mu<-c(JSR1$mu[1,,1])
save(GR1mu, file="Posterior/GR1mu.Rda")

# check results:
gelman.diag(GR1p, confidence=0.95)
acfplot(GR1p)
#traceplot(GR1p, smooth=FALSE) # takes long to print with many studies

# frequenist analysis:
(F2 <- rma(gen_speed2$T, gen_speed2$S.sqr, method="REML"))


# sensitivity analysis with different priors:
GR2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(gen_speed2), "GR2.txt"),
               gen_speed2, n.chains=5, n.adapt=3000, quiet=FALSE)
GR2p<- coda.samples(GR2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
GR2s<- summary(GR2p)
save(GR2s, file="Summary/GR2s.Rda")
effectiveSize(GR2p)

# check results:
gelman.diag(GR2p, confidence=0.95)
acfplot(GR2p)
#traceplot(GR2p, smooth=FALSE) # takes long to print with many studies


##########################################

#------------------------------
# Reading speed: speech-only
#------------------------------

rs_speech<- subset(gen_speed, sound=="speech")
rs_speech<- rs_speech[, c('g', 'g_var')]
colnames(rs_speech)<- Bcols

RSSm<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(rs_speech), "RSSm.txt"),
                 rs_speech, n.chains=5, n.adapt=3000,  quiet=FALSE,
                inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
RSS<- coda.samples(RSSm, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
RSSs<- summary(RSS)
save(RSSs, file="Summary/RSSs.Rda")
effectiveSize(RSS)

RSS1<- jags.samples(RSSm, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
Ss1<-c(RSS1$mu[1,,1],RSS1$mu[1,,2],RSS1$mu[1,,3], RSS1$mu[1,,4], RSS1$mu[1,,5])
ECDF10<- ecdf(Ss1); ECDF10(0)


# check results:
gelman.diag(RSS, confidence=0.95)
acfplot(RSS)
#traceplot(RSS, smooth=FALSE) # takes long to print with many studies
plot(RSS, density= F)



#--------------------
# background noise  :
#--------------------
load("Data/subset/noise.Rda")
noise2<- noise[,c("g", "g_var")]
colnames(noise2)<- Bcols

N1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(noise2), "N1.txt"),
               noise2, n.chains=5, n.adapt=3000,  quiet=FALSE,
               inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
N1p<- coda.samples(N1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
N1s<- summary(N1p)
save(N1s, file="Summary/N1s.Rda")
effectiveSize(N1p)

NS1<- jags.samples(N1, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(NS1$mu[1,,1],NS1$mu[1,,2],NS1$mu[1,,3], NS1$mu[1,,4], NS1$mu[1,,5])
ECDF3<- ecdf(S1); ECDF3(0)
N1mu<-c(NS1$mu[1,,1])
save(N1mu, file="Posterior/N1mu.Rda")

# check results:
gelman.diag(N1p, confidence=0.95)
acfplot(N1p)
traceplot(N1p, smooth=FALSE) # takes long to print with many studies


# frequenist analysis:
(F3 <- rma(noise2$T, noise2$S.sqr, method="REML"))


# sensitivity analysis with different priors:
N2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(noise2), "N2.txt"),
               noise2, n.chains=5, n.adapt=3000, quiet=FALSE)
N2p<- coda.samples(N2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
N2s<- summary(N2p)
save(N2s, file="Summary/N2s.Rda")
effectiveSize(N2p)

# check results:
gelman.diag(N2p, confidence=0.95)
acfplot(N2p)
#traceplot(N2p, smooth=FALSE) # take long to print with many studies


#--------------------
# background music  :
#--------------------

load("Data/subset/music.Rda")
music2<- music[,c("g", "g_var")]
colnames(music2)<- Bcols


M1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(music2), "M1.txt"),
               music2, n.chains=5, n.adapt=3000,  quiet=FALSE,
               inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
M1p<- coda.samples(M1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
M1s<- summary(M1p)
save(M1s, file="Summary/M1s.Rda")
effectiveSize(M1p)

MS1<- jags.samples(M1, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
S1<-c(MS1$mu[1,,1],MS1$mu[1,,2],MS1$mu[1,,3], MS1$mu[1,,4], MS1$mu[1,,5])
ECDF4<- ecdf(S1); ECDF4(0)
M1mu<-c(MS1$mu[1,,1])
save(M1mu, file="Posterior/M1mu.Rda")


# check results:
gelman.diag(M1p, confidence=0.95)
acfplot(M1p)
traceplot(M1p, smooth=FALSE) # takes long to print with many studies
plot(M1p, density = F)

# frequenist analysis:
(F4 <- rma(music2$T, music2$S.sqr, method="REML"))


# sensitivity analysis with different priors:
M2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(music2), "M2.txt"),
               music2, n.chains=5, n.adapt=3000, quiet=FALSE)
M2p<- coda.samples(M2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
M2s<- summary(M2p)
save(M2s, file="Summary/M2s.Rda")
effectiveSize(M2p)

# check results:
gelman.diag(M2p, confidence=0.95)
acfplot(M2p)
#traceplot(M2p, smooth=FALSE) # takea long to print with many studies


#--------------------
# background speech :
#--------------------

load("Data/subset/speech.Rda")
speech2<- speech[,c("g", "g_var")]
colnames(speech2)<- Bcols


S1<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(speech2), "S1.txt"),
               speech2, n.chains=5, n.adapt=3000,  quiet=FALSE,
               inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
S1p<- coda.samples(S1, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
S1s<- summary(S1p)
save(S1s, file="Summary/S1s.Rda")
effectiveSize(S1p)

SS1<- jags.samples(S1, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
Sx<-c(SS1$mu[1,,1],SS1$mu[1,,2],SS1$mu[1,,3], SS1$mu[1,,4], SS1$mu[1,,5])
ECDF5<- ecdf(Sx); ECDF5(0)
S1mu<-c(SS1$mu[1,,1])
save(S1mu, file="Posterior/S1mu.Rda")

# check results:
gelman.diag(S1p, confidence=0.95)
acfplot(S1p)
#traceplot(S1p, smooth=FALSE) # takes long to print with many studies
plot(S1p, density = F)

# frequenist analysis:
(F5 <- rma(speech2$T, speech2$S.sqr, method="REML"))


# sensitivity analysis with different priors:
S2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(speech2), "S2.txt"),
               speech2, n.chains=5, n.adapt=3000, quiet=FALSE)
S2p<- coda.samples(S2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
S2s<- summary(S2p)
save(S2s, file="Summary/S2s.Rda")
effectiveSize(S2p)

# check results:
gelman.diag(S2p, confidence=0.95)
acfplot(S2p)
#traceplot(S2p, smooth=FALSE) # takes long to print with many studies




#-------------------------
# Proofreading accuracy  :
#-------------------------

load("Data/subset/proof.Rda")
proof<- proof[,c("g", "g_var")]
colnames(proof)<- Bcols


PRM<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(proof), "PRM.txt"),
                proof, n.chains=5, n.adapt=3000,  quiet=FALSE,
               inits= list("mu"= runif(1,-3,3), "tau"= runif(1,0,3)))
PR<- coda.samples(PRM, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
PRs<- summary(PR)
save(PRs, file="Summary/PRs.Rda")
effectiveSize(PR)

SPR<- jags.samples(PRM, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
Sx<-c(SPR$mu[1,,1],SPR$mu[1,,2],SPR$mu[1,,3], SPR$mu[1,,4], SPR$mu[1,,5])
ECDF6<- ecdf(Sx); ECDF6(0)
#S1mu<-c(S1$mu[1,,1])
#save(S1mu, file="Posterior/S1mu.Rda")

# check results:
gelman.diag(PR, confidence=0.95)
acfplot(PR)
traceplot(PR, smooth=FALSE) # takes long to print with many studies
plot(PR, density = F)

# frequenist analysis:
(F6 <- rma(proof$T, proof$S.sqr, method="REML"))


# sensitivity analysis with different priors:
PRM2<-jags.model(Bmeta("dnorm(0, 1.0E-4)", "dnorm(0, 1.0E-4)  I(0, )", nrow(proof), "PRM2.txt"),
                 proof, n.chains=5, n.adapt=3000, quiet=FALSE)
PR2<- coda.samples(PRM2, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
PRs2<- summary(PR2)
save(PRs2, file="Summary/PRs2.Rda")

# check results:
gelman.diag(PR2, confidence=0.95)
acfplot(PR2)
traceplot(PR2, smooth=FALSE) # takes long to print with many studies


###################################################
# Proofreading accuracy- speech only

rm(proof)

load("Data/subset/proof.Rda")
proof<- subset(proof, sound!="noise")
proof<- proof[,c("g", "g_var")]
colnames(proof)<- Bcols


#load("Data/subset/proof.Rda")
#proof<- proof[,c("g", "g_var")]
#colnames(proof)<- Bcols


PRM_SO<-jags.model(Bmeta("dunif(-10, 10)", "dunif(0, 10)", nrow(proof), "PRM_SO.txt"),
                proof, n.chains=5, n.adapt=3000,  quiet=FALSE)
PR_SO<- coda.samples(PRM_SO, c('mu', 'tau', 'theta'), n.iter=Niter, thin=5)
PR_SOs<- summary(PR_SO)
save(PR_SOs, file="Summary/PR_SOs.Rda")
effectiveSize(PR_SO)

SPR2<- jags.samples(PRM_SO, variable.names='mu', n.iter=Niter, thin=5, n.adapt=3000)
Sx<-c(SPR2$mu[1,,1],SPR2$mu[1,,2],SPR2$mu[1,,3], SPR2$mu[1,,4], SPR2$mu[1,,5])
ECDF7<- ecdf(Sx); ECDF7(0)
#S1mu<-c(S1$mu[1,,1])
#save(S1mu, file="Posterior/S1mu.Rda")

# check results:
gelman.diag(PR_SO, confidence=0.95)
acfplot(PR_SO)
traceplot(PR_SO, smooth=FALSE) # takes long to print with many studies


# frequenist analysis:
(F7 <- rma(proof$T, proof$S.sqr, method="REML"))


## save freq summaries:
save(F1, file="Summary/freq/F1.Rda")
save(F2, file="Summary/freq/F2.Rda")
save(F3, file="Summary/freq/F3.Rda")
save(F4, file="Summary/freq/F4.Rda")
save(F5, file="Summary/freq/F5.Rda")
save(F6, file="Summary/freq/F6.Rda")
save(F7, file="Summary/freq/F7.Rda")
