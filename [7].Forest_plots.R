
# Martin R. Vasilev, 2017

rm(list=ls())

# load summaries:
load("Summary/M1s.Rda")
load("Summary/S1s.Rda")
load("Summary/N1s.Rda")


# extract estimate values for plotting:
# Pooled effect
PooledM<- c(M1s$statistics[1,1], S1s$statistics[1,1], N1s$statistics[1,1])
PooledCrIl<- c(M1s$quantiles[1,1], S1s$quantiles[1,1], N1s$quantiles[1,1])
PooledCrIu<- c(M1s$quantiles[1,5], S1s$quantiles[1,5], N1s$quantiles[1,5])

# study-level means:
MusicM<- unname(M1s$statistics[,1]); MusicM<- MusicM[-(c(1,2))]
SpeechM<- unname(S1s$statistics[,1]); SpeechM<- SpeechM[-(c(1,2))]
NoiseM<- unname(N1s$statistics[,1]); NoiseM<- NoiseM[-(c(1,2))]

# study-level CrIs:
#lower:
MusicL<- unname(M1s$quantiles[,1]); MusicL<- MusicL[-(c(1,2))]
SpeechL<- unname(S1s$quantiles[,1]); SpeechL<- SpeechL[-(c(1,2))]
NoiseL<- unname(N1s$quantiles[,1]); NoiseL<- NoiseL[-(c(1,2))]

#upper:
MusicU<- unname(M1s$quantiles[,5]); MusicU<- MusicU[-(c(1,2))]
SpeechU<- unname(S1s$quantiles[,5]); SpeechU<- SpeechU[-(c(1,2))]
NoiseU<- unname(N1s$quantiles[,5]); NoiseU<- NoiseU[-(c(1,2))]


# merge all variables into dataframes for sorting:

# music:

load("Data/subset/music.Rda")

M<- data.frame(music$ID, music$year, music$cit, music$g, music$g_var, music$CI95_L, music$CI95_R,
               MusicM, MusicL, MusicU)
colnames(M)<- c("ID", "year", "cit", "g", "g_var", "CIl", "CIu", "Mean", "CrIl", "CrIu")
# sort by year of publication:
M<- M[order(M$g, decreasing = T),]

M$w<- 1/M$g_var
M$w<- M$w/ max(M$w)


#####
load("Data/subset/speech.Rda")

S<- data.frame(speech$ID, speech$year, speech$cit, speech$g, speech$g_var, speech$CI95_L,
               speech$CI95_R, SpeechM, SpeechL, SpeechU)
colnames(S)<- c("ID", "year", "cit", "g", "g_var", "CIl", "CIu", "Mean", "CrIl", "CrIu")
# sort by year of publication:
S<- S[order(S$g, decreasing = T),]

S$w<- 1/S$g_var
S$w<- S$w/ max(S$w)


#####
load("Data/subset/noise.Rda")
N<- data.frame(noise$ID, noise$year, noise$cit, noise$g, noise$g_var, noise$CI95_L,
               noise$CI95_R, NoiseM, NoiseL, NoiseU)
colnames(N)<- c("ID", "year", "cit", "g", "g_var", "CIl", "CIu", "Mean", "CrIl", "CrIu")

# sort by year of publication:
N<- N[order(N$g, decreasing = T),]

N$w<- 1/N$g_var
N$w<- N$w/ max(N$w)



#============
# start plot:
#============
png('Plots/Forest_plots.png', width = 7000, height = 7000, units = "px", res=600, type="cairo")

layout(mat = matrix(c(1,2,1,3),nrow = 2,ncol = 2,byrow = TRUE),heights = c(0.4,0.3, 0.2))
par(mar=c(4,4,3,4))

#============
# Music plot:
#============

plot(0, type = "n", axes=FALSE, xlab="                                 Effect size (g)",
      ylab="Studies", main= "a) Music", family="serif",
      ylim= c(0, nrow(M)), xlim=c(-3.25, 0.75), font.lab=2, cex.main=1.7, cex.lab=1.2)
axis(2, at = c(nrow(M):1), labels = M$cit, cex.axis=1.05, las=1, line = -9)
breaks= c(-2,-1.5,-1,-0.5,0, 0.5)
breaks_s= c("-2",'-1.5','-1','-0.5','0', '0.5')
axis(1, at= breaks, labels= breaks_s, cex.axis=1.2, family="serif")


# Plot study lines (to aid interpretation)
segments(x0=rep(breaks[1], nrow(M))+0.035, y0=c(nrow(M):1), x1=rep(breaks[length(breaks)]+0.25,nrow(M)),
         y1=c(nrow(M):1), lwd=1, lty=1, col="#E3E3E3")


# line as 0 (es)
segments(x0=0, y0=-2, x1=0, y1=nrow(M)+0.5, lwd=1, lty=1, col="black")

par(xpd=TRUE)
# Plot observed CIs:
for(i in 1:nrow(M)){
  if(M$CIl[i]<breaks[1]|M$CIu[i]>breaks[length(breaks)]+0.15){
    if(M$CIl[i]<breaks[1]){
      arrows(x0 = M$g[i], y0 = c(nrow(M):1)[i]+0.15, x1 = breaks[1]+0.09, y1 = c(nrow(M):1)[i]+0.15, 
             length =0.08, lty = 1)
      segments(x0=M$g[i], y0=c(nrow(M):1)[i]+0.15, x1=M$CIu[i], y1=c(nrow(M):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    } 
    if(M$CIu[i]>breaks[length(breaks)]+0.15){
      arrows(x0 = M$g[i], y0 = c(nrow(M):1)[i]+0.15, x1 = breaks[length(breaks)]+0.15,
             y1 = c(nrow(M):1)[i]+0.15, length =0.08, lty = 1)
      segments(x0=M$g[i], y0=c(nrow(M):1)[i]+0.15, x1=M$CIl[i], y1=c(nrow(M):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    }
} else{
  segments(x0=M$CIl[i], y0=c(nrow(M):1)[i]+0.15, x1=M$CIu[i], y1=c(nrow(M):1)[i]+0.15,
           lwd=1, lty=2, col="black")
}
}

# observed means:
points(x= M$g, y= c(nrow(M):1)+0.15, pch = 15, cex=1+2*M$w, col="white")
points(x= M$g, y= c(nrow(M):1)+0.15, pch = 0, cex=1+2*M$w, col="black")


# posterior study means:
points(x= M$Mean, y=c(nrow(M):1)-0.15, pch = 15, cex=1+2*M$w, col="darkred")

#95% CrI:
segments(x0=M$CrIl, y0=c(nrow(M):1)-0.15, x1=M$CrIu, y1=c(nrow(M):1)-0.15,
         lwd=1, lty=1, col="darkred")

par(xpd=FALSE)
# Pooled estimate:
segments(x0=PooledCrIl[1], y0=-0.5, x1= PooledCrIu[1], y1=-0.5, lwd=1.5, lty=1, col="darkred")
points(x= PooledM[1], y=-0.5, pch = 18, cex=3, col="darkred")
mtext("Pooled mean", side=1, line= -1.8, cex=1.1, font=2, adj = 0)


#============
# Speech plot:
#============

plot(0, type = "n", axes=FALSE, xlab="                                 Effect size (g)",
     ylab="Studies", main= "b) Speech", family="serif",
     ylim= c(0, nrow(S)), xlim=c(-3.25, 0.75), font.lab=2, cex.main=1.7, cex.lab=1.2)
axis(2, at = c(nrow(S):1), labels = S$cit, cex.axis=1.05, las=1, line = -9)
breaks= c(-2,-1.5,-1,-0.5,0, 0.5)
breaks_s= c("-2",'-1.5','-1','-0.5','0', '0.5')
axis(1, at= breaks, labels= breaks_s, cex.axis=1.2, family="serif")


# Plot study lines (to aid interpretation)
segments(x0=rep(breaks[1], nrow(S))+0.035, y0=c(nrow(S):1), x1=rep(breaks[length(breaks)]+0.25,nrow(S)),
         y1=c(nrow(S):1), lwd=1, lty=1, col="#E3E3E3")


# line as 0 (es)
segments(x0=0, y0=-2, x1=0, y1=nrow(S)+0.5, lwd=1, lty=1, col="black")


# Plot observed CIs:
for(i in 1:nrow(S)){
  if(S$CIl[i]<breaks[1]|S$CIu[i]>breaks[length(breaks)]+0.15){
    if(S$CIl[i]<breaks[1]){
      arrows(x0 = S$g[i], y0 = c(nrow(S):1)[i]+0.15, x1 = breaks[1]+0.09, y1 = c(nrow(S):1)[i]+0.15, 
             length =0.08, lty = 1)
      segments(x0=S$g[i], y0=c(nrow(S):1)[i]+0.15, x1=S$CIu[i], y1=c(nrow(S):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    } 
    if(S$CIu[i]>breaks[length(breaks)]+0.15){
      arrows(x0 = S$g[i], y0 = c(nrow(S):1)[i]+0.15, x1 = breaks[length(breaks)]+0.15,
             y1 = c(nrow(S):1)[i]+0.15, length =0.08, lty = 1)
      segments(x0=S$g[i], y0=c(nrow(S):1)[i]+0.15, x1=S$CIl[i], y1=c(nrow(S):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    }
  } else{
    segments(x0=S$CIl[i], y0=c(nrow(S):1)[i]+0.15, x1=S$CIu[i], y1=c(nrow(S):1)[i]+0.15,
             lwd=1, lty=2, col="black")
  }
}

# observed means:
points(x= S$g, y= c(nrow(S):1)+0.15, pch = 15, cex=1+1*S$w, col="white")
points(x= S$g, y= c(nrow(S):1)+0.15, pch = 0, cex=1+1*S$w, col="black")


# posterior study means:
points(x= S$Mean, y=c(nrow(S):1)-0.15, pch = 15, cex=1+1*S$w, col="darkred")

#95% CrI:
segments(x0=S$CrIl, y0=c(nrow(S):1)-0.15, x1=S$CrIu, y1=c(nrow(S):1)-0.15,
         lwd=1, lty=1, col="darkred")

# Pooled estimate:
segments(x0=PooledCrIl[2], y0=-0.3, x1= PooledCrIu[2], y1=-0.3, lwd=1.5, lty=1, col="darkred")
points(x= PooledM[2], y=-0.3, pch = 18, cex=3, col="darkred")
mtext("Pooled mean", side=1, line= -1.6, cex=1.1, font=2, adj = 0)



#============
# Noise plot:
#============

plot(0, type = "n", axes=FALSE, xlab="                                 Effect size (g)",
     ylab="Studies", main= "c) Noise", family="serif",
     ylim= c(0, nrow(N)), xlim=c(-3.25, 0.75), font.lab=2, cex.main=1.7, cex.lab=1.2)
axis(2, at = c(nrow(N):1), labels = N$cit, cex.axis=1.05, las=1, line = -9)
breaks= c(-2,-1.5,-1,-0.5,0, 0.5)
breaks_s= c("-2",'-1.5','-1','-0.5','0', '0.5')
axis(1, at= breaks, labels= breaks_s, cex.axis=1.2, family="serif")

# Plot study lines (to aid interpretation)
segments(x0=rep(breaks[1], nrow(N))+0.035, y0=c(nrow(N):1), x1=rep(breaks[length(breaks)]+0.25,nrow(N)),
         y1=c(nrow(N):1), lwd=1, lty=1, col="#E3E3E3")


# line as 0 (es)
segments(x0=0, y0=-2, x1=0, y1=nrow(N)+0.5, lwd=1, lty=1, col="black")


# Plot observed CIs:
for(i in 1:nrow(N)){
  if(N$CIl[i]<breaks[1]|N$CIu[i]>breaks[length(breaks)]+0.15){
    if(N$CIl[i]<breaks[1]){
      arrows(x0 = N$g[i], y0 = c(nrow(N):1)[i]+0.15, x1 = breaks[1]+0.09, y1 = c(nrow(N):1)[i]+0.15, 
             length =0.08, lty = 1)
      segments(x0=N$g[i], y0=c(nrow(N):1)[i]+0.15, x1=N$CIu[i], y1=c(nrow(N):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    } 
    if(N$CIu[i]>breaks[length(breaks)]+0.15){
      arrows(x0 = N$g[i], y0 = c(nrow(N):1)[i]+0.15, x1 = breaks[length(breaks)]+0.15,
             y1 = c(nrow(N):1)[i]+0.15, length =0.08, lty = 1)
      segments(x0=N$g[i], y0=c(nrow(N):1)[i]+0.15, x1=N$CIl[i], y1=c(nrow(N):1)[i]+0.15,
               lwd=1, lty=2, col="black")
    }
  } else{
    segments(x0=N$CIl[i], y0=c(nrow(N):1)[i]+0.15, x1=N$CIu[i], y1=c(nrow(N):1)[i]+0.15,
             lwd=1, lty=2, col="black")
  }
}


# observed means:
points(x= N$g, y= c(nrow(N):1)+0.15, pch = 15, cex=1+1*N$w, col="white")
points(x= N$g, y= c(nrow(N):1)+0.15, pch = 0, cex=1+1*N$w, col="black")


# posterior study means:
points(x= N$Mean, y=c(nrow(N):1)-0.15, pch = 15, cex=1+1*N$w, col="darkred")

#95% CrI:
segments(x0=N$CrIl, y0=c(nrow(N):1)-0.15, x1=N$CrIu, y1=c(nrow(N):1)-0.15,
         lwd=1, lty=1, col="darkred")

# Pooled estimate:
segments(x0=PooledCrIl[3], y0=0.1, x1= PooledCrIu[3], y1=0.1, lwd=1.5, lty=1, col="darkred")
points(x= PooledM[3], y=0.1, pch = 18, cex=3, col="darkred")
mtext("Pooled mean", side=1, line= -1.3, cex=1.1, font=2, adj = 0)


dev.off()



###### legend plot:
png('Plots/Forest_legend.png', width = 7000, height = 1200, units = "px", res=600, type="cairo")
par(mar=c(0,0,0,0))
plot(0, type = "n", axes=FALSE, xlab="", ylab= "", xlim= c(0, 7000), ylim= c(0, 1200))

rect(xleft = 2500,ybottom = 300,xright = 4500, ytop = 700, border = "black")


segments(x0=2600, y0=600, x1=3000, y1=600,lwd=1.5, lty=2, col="black")
points(x= 2800-15, y= 600, pch = 22, cex=2, col="black", bg="white")

text(x = 3700, y =600, labels = "Observed mean (95% CI)" , family= "serif", cex= 1.2)
##

segments(x0=2600, y0=400, x1=3000-15, y1=400,lwd=1.5, lty=1, col="darkred")
points(x= 2800-15, y= 400, pch = 15, cex=2, col="darkred")
text(x = 3700, y =400, labels = "Posterior mean (95% CrI)" , family= "serif", cex=1.2)


dev.off()
