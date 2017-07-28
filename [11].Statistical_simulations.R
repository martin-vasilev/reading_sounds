
# Statistical simulation on studies with unavailable data

# Martin R. Vasilev, 2017

rm(list=ls())

source("Functions/stat_sim.R")
source("Functions/settings.R")


# Proofreading accuracy (Jones et al, 1990; stand-alone analysis):

load("Data/subset/Proof.Rda")
proof<- proof[,c("g", "g_var")]
colnames(proof)<- Bcols


ProofS<- stat_sim(data1= proof, mean_s = c(-0.13,0), var_s = range(proof$S.sqr), nsim = 10000)

save(ProofS, file= "Summary/Sensitivity/Proof_sim.Rda")# K is the ES from the simulation


########
# Music: reading comprehension:

load("Data/subset/music.Rda")
music<- music[,c("g", "g_var")]
colnames(music)<- Bcols

MusicS<- stat_sim(data1= music, mean_s = c(0, 0.5), var_s = range(music$S.sqr), nsim = 10000)

save(MusicS, file= "Summary/Sensitivity/Music_sim.Rda")# K is the ES from the simulation



########
# Noise: reading comprehension:

load("Data/subset/noise.Rda")
noise<- noise[,c("g", "g_var")]
colnames(noise)<- Bcols

source("Functions/stat_sim2.R") # simulates 2 studies at the same time

NoiseS<- stat_sim2(data1= noise, mean_s1 = c(-0.2, 0.2), var_s1 = range(noise$S.sqr), mean_s2 = 0.048, var_s2 = range(noise$S.sqr), nsim = 10000)

save(NoiseS, file= "Summary/Sensitivity/Noise_sim.Rda")# K is the ES from the simulation

