
# Martin R. Vasilev, 2017

# Creates plots for publication bias assessment

load("Data/data.Rda")
source("functions/settings.R")

library(metafor)

res_music<- rma(g, g_var, data=subset(data, sound=="music"), method="REML")
res_noise<- rma(g, g_var, data=subset(data, sound=="noise"), method="REML")
res_speech<- rma(g, g_var, data=subset(data, sound=="speech"), method="REML")

#funnel(res_music, yaxis="sei", main="Inverse Standard Error", )
#funnel(res_noise, yaxis="sei", main="Inverse Standard Error")
#funnel(res_speech, yaxis="sei", main="Inverse Standard Error")


png('Pub_bias/panel_plot.png', width = 2400, height = 3200, units = "px", res=300, type="cairo")
par(mfrow=c(3,2), mar= c(5,5,5,1))

# funnel plots:
res <- rma(g, g_var, data=subset(data, is.element(task, RC) & measure!="reading_speed"), method="REML")
funnel(res, yaxis="sei", main="a", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, digits=2,
       at= c(-2,-1,0,1), xlab= "Effect size (g)")
funnel(res, yaxis="seinv", main="b", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, digits=2,
       at= c(-2,-1,0,1), xlab= "Effect size (g)")


## Trim and fill:
taf<- trimfill(res)
# No missing studies estimated!


## Radial plot: 
radial(res, main= "c", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Precision (1/SE)",
      zlab = "Effect size (g)/ SE", center = F, cex = 1.30, pch = 16, aty = c(-1.5,-1, -0.5, 0, 0.5), 
      level = 95)


## Sample size by effect size (+ breakdown by design)
d1<- subset(data, is.element(task, RC) & measure!="reading_speed")
d1$N_all<- NULL
for(i in 1:nrow(d1)){
  if(d1$design[i]=="between"){
    d1$N_all[i]<- d1$N_C[i]+ d1$N_E[i] 
  }else{
    d1$N_all[i]<- d1$N_C[i]
  }
}

d1b<- subset(d1, design=="between")
d1w<- subset(d1, design=="within")

plot(d1b$g, d1b$N_all, family="serif",
     cex.lab=1.7, cex.axis=1.5, cex.main=2.5, main="d",
     xlab= "Effect size (g)", ylab= "Sample size", pch=21, bg=pallete[3], cex=1.5, ylim= c(0, 340), 
     xlim= c(-2, 1))
points(d1w$g, d1w$N_all, pch=21, bg=pallete[2], cex=1.5)
legend(-0.155, 340, c('between-subject', 'within-subject'),pch = c(21, 21), pt.bg = c(pallete[3], pallete[2]), cex=1.2, 
       title="Design")


# effect sizes by publication date:
library(meta)
m1<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure!="reading_speed"),
             comb.random = T, level = 0.95, method.tau = "REML")
mr<- metareg(m1, ~year)

bubble(x = mr, family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Publication year",
       ylab="Effect size (g)", main= "e", xlim = c(1935, 2017), ylim= c(-2.2, 1.2), bg =  pallete[3],
       lwd = 2, lty = 2,regline = F, xaxt="n", yaxt="n")
abline(mr$b, col="red", lwd=2, lt=5)
axis(1, at = seq(1935, 2015, by = 10), srt=90, family= "serif", cex.axis = 1.5)
axis(2, at = seq(-2, 1, by = 0.5), srt=90, family= "serif", cex.axis = 1.5)


# effect sizes by impact factor if journal:
m2<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure!="reading_speed" & !is.na(IF)),
             comb.random = T, level = 0.95, method.tau = "REML")
mr2<- metareg(m2, ~IF)
bubble(x = mr2, family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Journal impact factor",
       ylab="Effect size (g)", main= "f", xlim = c(0, 5.5), ylim= c(-2.2, 1.2), bg =  pallete[5],
       lwd = 2, lty = 2,regline = F, xaxt="n", yaxt="n")
abline(mr2$b, col="red", lwd=2, lt=5)
axis(1, at = seq(0.5, 5.5, by = 1), srt=90, family= "serif", cex.axis = 1.5)
axis(2, at = seq(-2, 1, by = 0.5), srt=90, family= "serif", cex.axis = 1.5)


#cm<- metacum(x = m1, pooled = "random", year)

dev.off()




######################
#    reading speed   #
######################
library(metafor)

png('Pub_bias/panel_plot_rspeed.png', width = 2400, height = 3200, units = "px", res=300, type="cairo")
par(mfrow=c(3,2), mar= c(5,5,5,1))

# funnel plots:
res <- rma(g, g_var, data=subset(data, is.element(task, RC) & measure=="reading_speed"), method="REML")
funnel(res, yaxis="sei", main="a", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, digits=2,
       at= c(-2,-1,0,1), xlab= "Effect size (g)")

## Trim and fill:
taf<- trimfill(res)
funnel(taf, yaxis="sei", main="b", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, digits=2,
       at= c(-2,-1,0,1), xlab= "Effect size (g)")

funnel(res, yaxis="seinv", main="c", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, digits=2,
       at= c(-2,-1,0,1), xlab= "Effect size (g)")

## Radial plot: 
radial(res, main= "d", family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Precision (1/SE)",
       zlab = "Effect size (g)/ SE", center = F, cex = 1.30, pch = 16, aty = c(-1.5,-1, -0.5, 0, 0.5), 
       level = 95)


# effect sizes by publication date:
library(meta)
m1<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure=="reading_speed"),
             comb.random = T, level = 0.95, method.tau = "REML")
mr<- metareg(m1, ~year)

bubble(x = mr, family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Publication year",
       ylab="Effect size (g)", main= "e", xlim = c(1935, 2017), ylim= c(-2.2, 1.2), bg =  pallete[3],
       lwd = 2, lty = 2,regline = F, xaxt="n", yaxt="n")
abline(mr$b, col="red", lwd=2, lt=5)
axis(1, at = seq(1935, 2015, by = 10), srt=90, family= "serif", cex.axis = 1.5)
axis(2, at = seq(-2, 1, by = 0.5), srt=90, family= "serif", cex.axis = 1.5)


# effect sizes by impact factor if journal:
m2<- metagen(TE =g,seTE = sqrt(g_var), sm = "SMD",data=subset(data, is.element(task, RC) & measure=="reading_speed" & !is.na(IF)),
             comb.random = T, level = 0.95, method.tau = "REML")
mr2<- metareg(m2, ~IF)
bubble(x = mr2, family="serif", cex.lab=1.7, cex.axis=1.5, cex.main=2.5, xlab= "Journal impact factor",
       ylab="Effect size (g)", main= "f", xlim = c(0, 5.5), ylim= c(-2.2, 1.2), bg =  pallete[5],
       lwd = 2, lty = 2,regline = F, xaxt="n", yaxt="n")
abline(mr2$b, col="red", lwd=2, lt=5)
axis(1, at = seq(0.5, 5.5, by = 1), srt=90, family= "serif", cex.axis = 1.5)
axis(2, at = seq(-2, 1, by = 0.5), srt=90, family= "serif", cex.axis = 1.5)

dev.off()

