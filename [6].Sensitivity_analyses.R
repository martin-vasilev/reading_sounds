
# Martin R. Vasilev, 2017

rm(list=ls())
source("Functions/settings.R")
library(ggplot2)

#------------------------------------------------
# Plot of how results differ based on the priors:
#------------------------------------------------

# load up summary files:

load("Summary/G1s.Rda") # general sound effect, reading comprehension (uniform priors)
load("Summary/G2s.Rda") # general sound effect, reading comprehension (normal priors)

load("Summary/GR1s.Rda") # general sound effect, reading speed (uniform priors)
load("Summary/GR2s.Rda") # general sound effect, reading speed (normal priors)

load("Summary/M1s.Rda") # music effect, reading comprehension (uniform priors)
load("Summary/M2s.Rda") # music effect, reading comprehension (normal priors)

load("Summary/N1s.Rda") # noise effect, reading comprehension (uniform priors)
load("Summary/N2s.Rda") # noise effect, reading comprehension (normal priors)

load("Summary/S1s.Rda") # speech effect, reading comprehension (uniform priors)
load("Summary/S2s.Rda") # speech effect, reading comprehension (normal priors)


muMean<- c(G1s$statistics[1,1], G2s$statistics[1,1], GR1s$statistics[1,1],
           GR2s$statistics[1,1], M1s$statistics[1,1], M2s$statistics[1,1],
           N1s$statistics[1,1], N2s$statistics[1,1], S1s$statistics[1,1],
           S2s$statistics[1,1])

tauMean<- c(G1s$statistics[2,1], G2s$statistics[2,1], GR1s$statistics[2,1],
            GR2s$statistics[2,1], M1s$statistics[2,1], M2s$statistics[2,1],
            N1s$statistics[2,1], N2s$statistics[2,1], S1s$statistics[2,1],
            S2s$statistics[2,1])

Model<- c(rep("All sounds (compr.)",2), rep("All sounds (read. speed)",2),
          rep("Music (compr.)",2), rep("Noise (compr.)",2), rep("Speech (compr.)",2))

p1<- expression(paste(theta, "~ Unif(-10, 10); ", tau, "~ Unif(0, 10)"))
p2<- expression(paste(theta, "~ Normal(0, ", 100^{2}, "); ", tau, "~ Normal(0, ", 100^{2}, ") I(0,)"))

Priors<- c(rep(c("Uniform", "Normal"),5))

MuCrIl<- c(G1s$quantiles[1,1], G2s$quantiles[1,1], GR1s$quantiles[1,1],
         GR2s$quantiles[1,1], M1s$quantiles[1,1], M2s$quantiles[1,1],
         N1s$quantiles[1,1], N2s$quantiles[1,1], S1s$quantiles[1,1],
         S2s$quantiles[1,1])

MuCrIr<- c(G1s$quantiles[1,5], G2s$quantiles[1,5], GR1s$quantiles[1,5],
           GR2s$quantiles[1,5], M1s$quantiles[1,5], M2s$quantiles[1,5],
           N1s$quantiles[1,5], N2s$quantiles[1,5], S1s$quantiles[1,5],
           S2s$quantiles[1,5])

TauCrIl<- c(G1s$quantiles[2,1], G2s$quantiles[2,1], GR1s$quantiles[2,1],
           GR2s$quantiles[2,1], M1s$quantiles[2,1], M2s$quantiles[2,1],
           N1s$quantiles[2,1], N2s$quantiles[2,1], S1s$quantiles[2,1],
           S2s$quantiles[2,1])

TauCrIr<- c(G1s$quantiles[2,5], G2s$quantiles[2,5], GR1s$quantiles[2,5],
           GR2s$quantiles[2,5], M1s$quantiles[2,5], M2s$quantiles[2,5],
           N1s$quantiles[2,5], N2s$quantiles[2,5], S1s$quantiles[2,5],
           S2s$quantiles[2,5])

#db<- data.frame(muMean, tauMean, Model, Priors)

xpos<- c(0,3,6,9,12)

png('Plots/Prior_sensitivity.png', width = 3600, height = 1600, units = "px", res=300, type="cairo")


#par(mfrow=c(1,2), mar= c(5,5,5,1))
layout(mat = matrix(c(1,1,2,3),nrow = 2,ncol = 2,byrow = TRUE),heights = c(0.35,0.75))
par(mar=c(4,4.3,0,3))


# legend:
plot(0, type = "n", axes=FALSE, xlab="", ylab="")

legend(x = "bottom",inset = 0,
       legend = c(p1, p2), 
       col=c("darkred", "darkorange"), lwd=3, cex=1.3, horiz = FALSE,  
       title = expression(bold("Priors")))


plot(NA,ylab='Effect size (g)',xlab='Model', ylim= c(round(min(MuCrIl),2)-0.1,
                                                     round(max(MuCrIr),2))+0.05,
     xlim= c(-1, 13), xaxt='n',
     family="serif", cex.axis=1.4, cex.lab=1.4,xaxs='i', yaxs='i')
#par(xpd=TRUE)

axis(side = 1, at = xpos, tick = T, labels = c("All (RC)", "All (RS)",
    "Music (RC)", "Noise (RC)", "Speech (RC)"),  padj = 0.5, cex=1.6)
#mtext("Model", line=4, side = 1, cex = 1.4, family="serif")

# Uniform means:
points(x= xpos-0.5, y= muMean[c(1,3,5,7,9)], pch = 19, cex=1.2, col="darkred")

# Normal means:
points(x= xpos+0.5, y= muMean[c(2,4,6,8,10)], pch = 15, cex=1.2, col="darkorange")

# Uniform CrIs:
segments(x0=xpos-0.5, y0=MuCrIl[c(1,3,5,7,9)], x1=xpos-0.5, y1=MuCrIr[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")

segments(x0=xpos-0.35, y0=MuCrIl[c(1,3,5,7,9)], x1=xpos-0.65, y1=MuCrIl[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")
segments(x0=xpos-0.35, y0=MuCrIr[c(1,3,5,7,9)], x1=xpos-0.65, y1=MuCrIr[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")
# Normal CrIs:
segments(x0=xpos+0.5, y0=MuCrIl[c(2,4,6,8,10)], x1=xpos+0.5, y1=MuCrIr[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")

segments(x0=xpos+0.35, y0=MuCrIl[c(2,4,6,8,10)], x1=xpos+0.65, y1=MuCrIl[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")
segments(x0=xpos+0.35, y0=MuCrIr[c(2,4,6,8,10)], x1=xpos+0.65, y1=MuCrIr[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")


mtext(expression(paste("Estimate of ", theta)), side = 3, cex = 1.2, font = 2, line = 0.5)



# Second plot:

plot(NA,ylab= expression(paste('Between-study variability (', tau, ")")),xlab='Model',
     ylim= c(round(min(TauCrIl),2)-0.1, round(max(TauCrIr),2))+0.05,
     xlim= c(-1, 13), xaxt='n',
     family="serif", cex.axis=1.4, cex.lab=1.4,xaxs='i', yaxs='i')
#par(xpd=TRUE)

axis(side = 1, at = xpos, tick = T, labels = c("All (RC)", "All (RS)",
              "Music (RC)", "Noise (RC)", "Speech (RC)"),  padj = 0.5, cex=1.6)
#mtext("Model", line=4, side = 1, cex = 1.6, family="serif")

# Uniform means:
points(x= xpos-0.5, y= tauMean[c(1,3,5,7,9)], pch = 19, cex=1.2, col="darkred")

# Normal means:
points(x= xpos+0.5, y= tauMean[c(2,4,6,8,10)], pch = 15, cex=1.2, col="darkorange")

# Uniform CrIs:
segments(x0=xpos-0.5, y0=TauCrIl[c(1,3,5,7,9)], x1=xpos-0.5, y1=TauCrIr[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")

segments(x0=xpos-0.35, y0=TauCrIl[c(1,3,5,7,9)], x1=xpos-0.65, y1=TauCrIl[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")
segments(x0=xpos-0.35, y0=TauCrIr[c(1,3,5,7,9)], x1=xpos-0.65, y1=TauCrIr[c(1,3,5,7,9)], 
         lwd=1.2, col="darkred")
# Normal CrIs:
segments(x0=xpos+0.5, y0=TauCrIl[c(2,4,6,8,10)], x1=xpos+0.5, y1=TauCrIr[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")

segments(x0=xpos+0.35, y0=TauCrIl[c(2,4,6,8,10)], x1=xpos+0.65, y1=TauCrIl[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")
segments(x0=xpos+0.35, y0=TauCrIr[c(2,4,6,8,10)], x1=xpos+0.65, y1=TauCrIr[c(2,4,6,8,10)], 
         lwd=1.2, col="darkorange")


mtext(expression(paste("Estimate of ", tau)), side = 3, cex = 1.2, font = 2, line = 0.5)

dev.off()


#=========================================
# Leave-one-out method (robustness check):
#=========================================

source("Functions/sensitivity_analysis.R")

load("Data/subset/gen.Rda")
gen2<- gen[, c("g", "g_var")]
colnames(gen2)<- Bcols

# takes a lot of time
Sens1<- sensitivity_analysis(gen2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens1, file= "Summary/Sensitivity/G.Rda")

# reading speed
load("Data/subset/gen_speed.Rda")
gen_speed2<- gen_speed[, c('g', 'g_var')]
colnames(gen_speed2)<- Bcols

Sens2<- sensitivity_analysis(gen_speed2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens2, file= "Summary/Sensitivity/GR.Rda")


# proofreading accuracy:
load("Data/subset/proof.Rda")
proof2<- proof[, c('g', 'g_var')]
colnames(proof2)<- Bcols

Sens6<- sensitivity_analysis(proof2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens6, file= "Summary/Sensitivity/Proof.Rda")


# noise:
load("Data/subset/noise.Rda")
noise2<- noise[,c("g", "g_var")]
colnames(noise2)<- Bcols

Sens3<- sensitivity_analysis(noise2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens3, file= "Summary/Sensitivity/N.Rda")


# music:
load("Data/subset/music.Rda")
music2<- music[,c("g", "g_var")]
colnames(music2)<- Bcols

Sens4<- sensitivity_analysis(music2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens4, file= "Summary/Sensitivity/M.Rda")


# speech:
load("Data/subset/speech.Rda")
speech2<- speech[,c("g", "g_var")]
colnames(speech2)<- Bcols

Sens5<- sensitivity_analysis(speech2, "dunif(-10, 10)", "dunif(0, 10)") 
save(Sens5, file= "Summary/Sensitivity/S.Rda")




