
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
par(mar=c(4,4.5,4,4))


# lyrical vs non-lyrical, meta-reg:
plot(0, type = "n", axes=FALSE, xlab="Type of music",
     ylab="Effect size (g)", main= "Non-lyrical vs Lyrical music", family="serif",
     ylim= c(-1, 0.25), xlim=c(1, 2), font.lab=2, cex.main=2, cex.lab=2)

axis(1, at= c(1.1,1.9), labels= c("Non-lyrical", "Lyrical"), cex.axis=2, family="serif")

axis(2, at = c(0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.6)
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
text(x= 1.5, y = sumR1$statistics[1,1], labels = paste("b= ", round(sumR1$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=-7)

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
Ns<- nrow(SM)-Nnon


plot(0, type = "n", axes=FALSE, xlab="Type of sound",
     ylab="Effect size (g)", main= "Lyrical music vs intelligible speech", family="serif",
     ylim= c(-1, 0.25), xlim=c(1, 2), font.lab=2, cex.main=2, cex.lab=2)

axis(1, at= c(1.1,1.9), labels= c("Lyrical music", "Intelligible speech"),
     cex.axis=2, family="serif")

axis(2, at = c(0.5,0.25, 0,-0.25,-0.5,-0.75,-1),
     labels = c('.5','.25','0','-.25', '-.5','-.75','-1'),
     cex.axis=1.6)

abline(a = sumR2$statistics[2,1], b = sumR2$statistics[1,1], col="darkred", lwd=2, lty=5)

text(x= 1.5, y = sumR2$statistics[1,1], labels = paste("b= ", round(sumR2$statistics[1,1],2)),
     family="serif", cex = 1.8, srt=1)


# third
plot(0, type = "n", axes=FALSE, xlab="Type of music",
     ylab="Effect size (g)", main= "", family="serif",
     ylim= c(-2, 1), xlim=c(1, 10), font.lab=2, cex.main=1.7, cex.lab=1.2)


# Bar plots of simple effect:

plot(NA, type = "n", axes=FALSE, family="serif",ylab="Effect size (g)", xlab="Type of music",
      ylim= c(-1, 0.25), xlim=c(1, 2), font.lab=2, cex.main=1.7, cex.lab=2, col="white")
axis(2, at = c(-1,-0.75,-0.5, -0.25, 0, 0.25,0.5),
     labels = c('-1', '-.75','-.5','-.25','0', '.25','.5'),
     cex.axis=1.6)
axis(1, at= c(1.1,1.9), labels= c("Non-lyrical", "Lyrical"), cex.axis=2, family="serif")

#plot(c(nonLyrS$statistics[1,1], lyrS$statistics[1,1]),font.lab=2, cex.lab=1.8,
#        names.arg = c("Non-lyrical", "Lyrical"), col= c(pallete[2], pallete[3]),
#        cex.axis=1.6, cex.names=1.8, space=1, ylim= c(-0.8, 0.2))
arrows(x0 = 1.25, y0 =nonLyrS$quantiles[1,1] , x1 = 1.25, y1 = nonLyrS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.25, nonLyrS$statistics[1,1], bg= pallete[2], pch=22, cex=1.5)

arrows(x0 = 1.75, y0 =lyrS$quantiles[1,1] , x1 = 1.75, y1 = lyrS$quantiles[1,5],
       code=3, angle=90, length=0.08, lwd=1.5)
points(1.75, lyrS$statistics[1,1], bg= pallete[3], pch=22, cex=1.5)

dev.off()
