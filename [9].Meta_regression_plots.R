
# Martin R. Vasilev, 2017

rm(list=ls())
source("Functions/settings.R")

load("Summary/Reg/lyrS.Rda")
load("Summary/Reg/nonLyrS.Rda")
load("Summary/Reg/sumR1.Rda")
load("Data/subset/metareg/LM1.Rda")

Nnon<- length(which(LM1$type=="non-lyrical"))
Nlyr<- nrow(LM1)-Nnon

# weights:
wNon<- LM1$g_var[1:Nnon]
wLyr<- LM1$g_var[(Nnon+1):nrow(LM1)]

wNon<- 1/wNon
wNon<- wNon/max(wNon)

wLyr<- 1/wLyr
wLyr<- wLyr/max(wLyr)

# ========
#  Plot:
#=========

png('Plots/MetaReg_plot1.png', width = 6000, height = 4000, units = "px", res=600, type="cairo")

layout(mat = matrix(c(1,2,3,4,5,6),nrow = 2,ncol = 3,byrow = TRUE),heights = c(0.5,0.5))
par(mar=c(4.5,7,4,3))


# lyrical vs non-lyrical, meta-reg:
plot(0, type = "n", axes=FALSE, xlab="Type of music",
     ylab="Effect size (g)", main= "Non-lyrical vs Lyrical\nmusic", family="serif",
     ylim= c(-1, 1), xlim=c(1, 2), font.main=1, cex.main=2.2, cex.lab=2)

axis(1, at= c(1.1,1.9), labels= c("Non-lyrical", "Lyrical"), cex.axis=1.6, family="serif")

axis(2, at = c(1,0.75,0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('1', '.75','.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.6)

par(xpd=TRUE)
text(x = 0.52, y = 1, labels = "a",  font=2, cex=3, family="serif")
par(xpd=FALSE)
#breaks= c(-2,-1.5,-1,-0.5,0, 0.5)
#breaks_s= c("-2",'-1.5','-1','-0.5','0', '0.5')
#
#a<- seq(0, 0.2, 1/1000)
abline(a = 0, b = sumR1$statistics[1,1], col="darkred", lwd=2, lty=5)
#for( i in 1:10){
#  abline(a = 0+a[i], b = sumR1$statistics[1,1], col= adjustcolor("darkred", alpha.f = 0.1),
#         lwd=2, lty=1)
#}

#abline(a = sumR1$statistics[1,1]-0.2, b=sumR1$statistics[1,1]-0.2, col="darkred", lwd=2, lty=1)
text(x= 1.47, y = sumR1$statistics[1,1]+0.07, labels = paste("b= ", round(sumR1$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=-5)

#xx<- c(1,1,1.1, 1.1, 1.2, 1.2, 1.3, 1.3, 1.4, 1.4, 1.5, 1.5, 1.6, 1.6, 1.7, 1.7, 1.8, 1.8, 1.9, 1.9,
#       2,2)
#yy<- rep(c(0.1, -0.1),11)
#polygon(x = c(c(1,2), rev(c(1,2))), c(c(0.1,0.1), rev(c(0.1,0.1))) ,
#        col = "darkred", angle = -0.17, density = 1)
        

Pnon<- sumR1$statistics[4:(4+Nnon-1),1]
Pslyr<- sumR1$statistics[(4+Nnon):nrow(sumR1$statistics),1]

xpos1<- seq(1.05, 1.25, (1.25-1.05)/(Nnon-1))
xpos2<- seq(1.7, 1.9, (1.9-1.7)/(Nlyr-1))

points(x = xpos1, Pnon, pch=21, bg= pallete[2], cex=2 + 1.5*wNon)
points(x=xpos2, Pslyr, pch=21, bg= pallete[3], cex=2+ 1.5*wLyr)

# second
# lyrical vs non-lyrical, meta-reg:
load("Summary/Reg/sumR2.Rda")
load("Summary/Reg/smS.Rda")
load("Summary/Reg/SpMS.Rda")
load("Data/subset/metareg/SM.Rda")

Nm<- length(which(SM$type=="music"))
Ns<- nrow(SM)-Nm

wM<- SM$g_var[1:Nm]
wS<- SM$g_var[(Nm+1):nrow(SM)]

wM<- 1/wM
wM<- wM/max(wM)

wS<- 1/wS
wS<- wS/max(wS)

PM<- sumR2$statistics[4:(4+Nm-1),1]
PS<- sumR2$statistics[(4+Nm):nrow(sumR2$statistics),1]

xpos1<- seq(1.05, 1.25, (1.25-1.05)/(Nm-1))
xpos2<- seq(1.7, 1.9, (1.9-1.7)/(Ns-1))



plot(0, type = "n", axes=FALSE, xlab="Type of sound",
     ylab="Effect size (g)", main= "Lyrical music vs intelligible\nspeech", family="serif",
     ylim= c(-1, 1), xlim=c(1, 2), font.main=1, cex.main=2.2, cex.lab=2)

axis(1, at= c(1.1,1.9), labels= c("Lyrical music", "Intelligible speech"),
     cex.axis=1.6, family="serif")

axis(2, at = c(1,0.75,0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('1','.75','.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.6)

abline(a = sumR2$statistics[2,1], b = sumR2$statistics[1,1], col="darkred", lwd=2, lty=5)

text(x= 1.45, y = sumR2$statistics[1,1]-0.2, labels = paste("b= ", round(sumR2$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=1)

points(x = xpos1, PM, pch=21, bg= pallete[4], cex=2 + 1.5*wM)
points(x=xpos2, PS, pch=21, bg= pallete[5], cex=2+ 1.5*wS)

# third

# Unintelligible vs Intelligible speech:

load("Summary/Reg/sumR3.Rda")
load("Data/subset/metareg/PH.Rda")
load("Summary/Reg/phonS.Rda")
load("Summary/Reg/semS.Rda")

Nphon<- length(which(PH$type=="unintelligible"))
Nsem<- nrow(PH)-Nphon

wPhon<- PH$g_var[1:Nphon]
wSem<- PH$g_var[(Nphon+1):nrow(PH)]

wPhon<- 1/wPhon
wPhon<- wPhon/max(wPhon)

wSem<- 1/wSem
wSem<- wSem/max(wSem)

Pphon<- sumR3$statistics[4:(4+Nphon-1),1]
Psem<- sumR3$statistics[(4+Nphon):nrow(sumR3$statistics),1]

xpos1<- seq(1.05, 1.25, (1.25-1.05)/(Nphon-1))
xpos2<- seq(1.7, 1.9, (1.9-1.7)/(Nsem-1))


plot(0, type = "n", axes=FALSE, xlab="Type of speech",
     ylab="Effect size (g)", main= "Unintelligible vs intelligible\nspeech", family="serif",
     ylim= c(-1, 1), xlim=c(1, 2), font.main=1, cex.main=2.2, cex.lab=2)

axis(1, at= c(1.1,1.9), labels= c("Unintelligible", "Intelligible"),
     cex.axis=1.6, family="serif")

axis(2, at = c(1,0.75,0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('1', '.75','.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.6)

abline(a = 0, b = sumR3$statistics[1,1], col="darkred", lwd=2, lty=5)

text(x= 1.45, y = sumR3$statistics[1,1]+0.1, labels = paste("b= ", round(sumR3$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=-3)

points(x = xpos1, Pphon, pch=21, bg= pallete[6], cex=2 + 1.5*wPhon)
points(x=xpos2, Psem, pch=21, bg= pallete[8], cex=2+ 1.5*wSem)


# Bar plots of simple effect:

plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of music",
      ylim= c(-1, 1), xlim=c(1, 2), cex.main=1.7, cex.lab=2, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5,0.75,1),
     labels = c('-1', '','-.5','','0', '','.5', '', '1'),
     cex.axis=1.6)
axis(1, at= c(1.1,1.9), labels= c("Non-lyrical", "Lyrical"), cex.axis=1.6, family="serif")

#plot(c(nonLyrS$statistics[1,1], lyrS$statistics[1,1]),font.lab=2, cex.lab=1.8,
#        names.arg = c("Non-lyrical", "Lyrical"), col= c(pallete[2], pallete[3]),
#        cex.axis=1.6, cex.names=1.8, space=1, ylim= c(-0.8, 0.2))
arrows(x0 = 1.25, y0 =nonLyrS$quantiles[1,1] , x1 = 1.25, y1 = nonLyrS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, nonLyrS$statistics[1,1], bg= pallete[2], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =lyrS$quantiles[1,1] , x1 = 1.75, y1 = lyrS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, lyrS$statistics[1,1], bg= pallete[3], pch=22, cex=1.5)

par(xpd=TRUE)
text(x = 0.52, y = 1, labels = "b",  font=2, cex=3, family="serif")
par(xpd=FALSE)

# second
plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of sound",
     ylim= c(-1, 1), xlim=c(1, 2), cex.main=1.7, cex.lab=2, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5,0.75,1),
     labels = c('-1', '','-.5','','0', '','.5', '', '1'),
     cex.axis=1.6)
axis(1, at= c(1.1,1.9), labels= c("Lyrical music", "Intelligible speech"), cex.axis=1.6, family="serif")

load("Summary/Reg/smS.Rda")
load("Summary/Reg/SpMS.Rda")

arrows(x0 = 1.25, y0 =smS$quantiles[1,1] , x1 = 1.25, y1 = smS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, smS$statistics[1,1], bg= pallete[4], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =SpMS$quantiles[1,1] , x1 = 1.75, y1 = SpMS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, SpMS$statistics[1,1], bg= pallete[5], pch=22, cex=1.5)



# third
plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of speech",
     ylim= c(-1, 1), xlim=c(1, 2), cex.main=1.7, cex.lab=2, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5, 0.75,1),
     labels = c('-1', '','-.5','','0', '','.5', '', '1'),
     cex.axis=1.6)
axis(1, at= c(1.1,1.9), labels= c("Unintelligible", "Intelligible"), cex.axis=1.6, family="serif")

load("Summary/Reg/phonS.Rda")
load("Summary/Reg/semS.Rda")

arrows(x0 = 1.25, y0 =phonS$quantiles[1,1] , x1 = 1.25, y1 = phonS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, phonS$statistics[1,1], bg= pallete[6], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =semS$quantiles[1,1] , x1 = 1.75, y1 = semS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, semS$statistics[1,1], bg= pallete[8], pch=22, cex=1.5)

#load("Posterior/SNL.Rda")

#vioplot(SNL, col=pallete[2], add=T, at=1.25, wex=0.4) 

#load("Posterior/SL.Rda")

#vioplot(SL, col=pallete[3], add=T, at=1.75, wex=0.4) 

dev.off()



#-------------------
# Plot numero zwei
#-------------------


png('Plots/MetaReg_plot2.png', width = 4000, height = 4000, units = "px", res=600, type="cairo")

layout(mat = matrix(c(1,2,3,4),nrow = 2,ncol = 2,byrow = TRUE),heights = c(0.5,0.5))
par(mar=c(4.5,7,4,2))


# environ. vs acoustical noise, meta-reg:
load("Summary/Reg/sumEAN.Rda")
load("Data/subset/metareg/EAN.Rda")

Na<- length(which(EAN$type=="acoustical"))
Ne<- nrow(EAN)-Na

wA<- EAN$g_var[1:Na]
wE<- EAN$g_var[(Na+1):nrow(EAN)]

wA<- 1/wA
wA<- wA/max(wA)

wE<- 1/wE
wE<- wE/max(wE)

PA<- sumEAN$statistics[4:(4+Na-1),1]
PE<- sumEAN$statistics[(4+Na):nrow(sumEAN$statistics),1]

xpos1<- seq(1.05, 1.25, (1.25-1.05)/(Na-1))
xpos2<- seq(1.7, 1.9, (1.9-1.7)/(Ne-1))



plot(0, type = "n", axes=FALSE, xlab="Type of noise",
     ylab="Effect size (g)", main= "Acoustical vs.\nEnvironmental noise", family="serif",
     ylim= c(-1, 0.25), xlim=c(1, 2), font.main=1, cex.main=1.5, cex.lab=1.4)

axis(1, at= c(1.1,1.9), labels= c("Acoustical", "Environmental"), cex.axis=1.2, family="serif")

axis(2, at = c(0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.1)

par(xpd=TRUE)
text(x = 0.6, y = 0.25, labels = "a",  font=2, cex=2.5, family="serif")
par(xpd=FALSE)


abline(a = sumEAN$statistics[2,1], b = sumEAN$statistics[1,1], col="darkred", lwd=2, lty=5)
text(x= 1.45, y = sumEAN$statistics[1,1]-0.28, labels = paste("b= ", round(sumEAN$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=1)

points(x = xpos1, PA, pch=21, bg= pallete[2], cex=2 + 1.5*wA)
points(x=xpos2, PE, pch=21, bg= pallete[3], cex=2+ 1.5*wE)


###########
# Instrumental music vs acoustical noise, meta-reg:

load("Summary/Reg/sumMAN.Rda")
load("Data/subset/metareg/MAN.Rda")

Na<- length(which(MAN$type=="acoustical"))
Nm<- nrow(MAN)-Na

wA<- MAN$g_var[1:Na]
wM<- MAN$g_var[(Na+1):nrow(MAN)]

wA<- 1/wA
wA<- wA/max(wA)

wM<- 1/wM
wM<- wM/max(wM)

PA<- sumMAN$statistics[4:(4+Na-1),1]
PM<- sumMAN$statistics[(4+Na):nrow(sumMAN$statistics),1]

xpos1<- seq(1.05, 1.25, (1.25-1.05)/(Na-1))
xpos2<- seq(1.7, 1.9, (1.9-1.7)/(Nm-1))



plot(0, type = "n", axes=FALSE, xlab="Type of sound",
     ylab="Effect size (g)", main= "Acoustical noise vs. \nInstrumental music ", family="serif",
     ylim= c(-1, 0.25), xlim=c(1, 2), font.main=1, cex.main=1.5, cex.lab=1.4)

axis(1, at= c(1.1,1.9), labels= c("Noise", "Music"), cex.axis=1.2, family="serif")

axis(2, at = c(0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.1)


abline(a = sumMAN$statistics[2,1], b = sumMAN$statistics[1,1], col="darkred", lwd=2, lty=5)
text(x= 1.45, y = sumMAN$statistics[1,1]-0.28, labels = paste("b= ", round(sumMAN$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=1)

points(x = xpos1, PA, pch=21, bg= pallete[4], cex=2 + 1.5*wA)
points(x=xpos2, PM, pch=21, bg= pallete[5], cex=2+ 1.5*wM)



# Bar plots of simple effect:

plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of noise",
     ylim= c(-1, 0.25), xlim=c(1, 2), cex.main=1.5, cex.lab=1.4, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5),
     labels = c('-1', '-.75','-.5','-.25','0', '.25','.5'),
     cex.axis=1.1)
axis(1, at= c(1.1,1.9), labels= c("Acoustical", "Environmental"), cex.axis=1.2, family="serif")

load("Summary/Reg/sumAC.Rda")
load("Summary/Reg/sumEN.Rda")
load("Summary/Reg/nonLyrS.Rda")

arrows(x0 = 1.25, y0 =sumAC$quantiles[1,1] , x1 = 1.25, y1 = sumAC$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, sumAC$statistics[1,1], bg= pallete[2], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =sumEN$quantiles[1,1] , x1 = 1.75, y1 = sumEN$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, sumEN$statistics[1,1], bg= pallete[3], pch=22, cex=1.5)

par(xpd=TRUE)
text(x = 0.6, y = 0.25, labels = "b",  font=2, cex=2.5, family="serif")
par(xpd=FALSE)


# second:
plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of sound",
     ylim= c(-1, 0.25), xlim=c(1, 2), cex.main=1.5, cex.lab=1.4, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5),
     labels = c('-1', '-.75','-.5','-.25','0', '.25','.5'),
     cex.axis=1.1)
axis(1, at= c(1.1,1.9), labels= c("Noise", "Music"), cex.axis=1.2, family="serif")


arrows(x0 = 1.25, y0 =sumAC$quantiles[1,1] , x1 = 1.25, y1 = sumAC$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, sumAC$statistics[1,1], bg= pallete[4], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =nonLyrS$quantiles[1,1] , x1 = 1.75, y1 = nonLyrS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, nonLyrS$statistics[1,1], bg= pallete[5], pch=22, cex=1.5)



dev.off()
