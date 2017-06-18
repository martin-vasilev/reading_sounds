
# A script for visualisation and checking of effect sizes

### Violin Plots

rm(list=ls())
load("Data/data_old.Rda")
data<- data_old
source("functions/settings.R")
library(vioplot)

# code adapted from:
# https://www.r-bloggers.com/exploratory-data-analysis-combining-box-plots-and-kernel-density-plots-into-violin-plots-for-ozone-pollution-data/

# overall ES:
png('Plots/descriptives/vio_All.png', width = 1600, height = 1600, units = "px", res = 300)
plot(1, 1, xlim = c(0.5,1.5), ylim = range(data$g), type = 'n', xlab = 'All studies', ylab = 'Effect size (g)',
     xaxt = 'n', family="serif", cex.lab=1.5, cex.axis=1.5)
vioplot(data$g, col=pallete[2], add=T) 
dev.off()

# breakdown by sound
png('Plots/descriptives/vio_sound.png', width = 3200, height = 1600, units = "px", res = 300)
plot(1, 1, xlim = c(0.5,3.5), ylim = range(data$g), type = 'n', xlab = 'Background sound',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.5, cex.axis=1.5)
vioplot(data$g[data$sound=="noise"], col=pallete[2], at=1, add=T) 
vioplot(data$g[data$sound=="speech"], col=pallete[3], at=2, add=T)
vioplot(data$g[data$sound=="music"], col=pallete[4], at=3, add=T)

axis(1, at = c(1,2, 3), labels = c('Noise', 'Speech', 'Music'))
dev.off()


# breakdown by measure:
png('Plots/descriptives/vio_measure.png', width = 3200, height = 1600, units = "px", res = 300)
plot(1, 1, xlim = c(0.5,3.5), ylim = range(data$g), type = 'n', xlab = 'Dependent measure',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.5, cex.axis=1.5)
vioplot(data$g[data$measure!="reading_speed" & is.element(data$task, RC)], col=pallete[2], at=1, add=T) 
vioplot(data$g[data$measure=="reading_speed" & is.element(data$task, RC)], col=pallete[3], at=2, add=T)
vioplot(data$g[is.element(data$task, Proof)], col=pallete[4], at=3, add=T)
axis(1, at = c(1,2, 3), labels = c('Reading comprehension', 'Reading speed', 'Proofreading accuracy'))
dev.off()


# breakdown by design:
png('Plots/descriptives/vio_design.png', width = 2400, height = 1600, units = "px", res = 300)
plot(1, 1, xlim = c(0.5,2.5), ylim = range(data$g), type = 'n', xlab = 'Design',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.5, cex.axis=1.5)
vioplot(data$g[data$design=="between"], col=pallete[2], at=1, add=T)
vioplot(data$g[data$design=="within"], col=pallete[3], at=2, add=T)
axis(1, at = c(1,2), labels = c('Between-subject', 'Within-subject'))
dev.off()


# breakdown by age:
png('Plots/descriptives/vio_age.png', width = 2400, height = 1600, units = "px", res = 300)
plot(1, 1, xlim = c(0.5,2.5), ylim = range(data$g), type = 'n', xlab = 'Age category',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.5, cex.axis=1.5)
vioplot(data$g[data$sample=="adults"], col=pallete[2], at=1, add=T)
vioplot(data$g[data$sample=="children"], col=pallete[3], at=2, add=T)
axis(1, at = c(1,2), labels = c('Adults (> 18 years)', 'Children (< 18 years)'))
dev.off()



#-----------------------------
# Descriptives Layout plot   :
#-----------------------------

png('Plots/Descriptive_panel.png', width = 4200, height = 6000, units = "px", res=600, type="cairo")

layout(mat = matrix(c(1,1,2,2,3,4),nrow = 3,ncol = 2,byrow = TRUE),heights = c(0.333,0.333, 0.333))
par(mar=c(6.5,5,4,0.5))

# All sounds:
plot(1, 1, xlim = c(0.5,3.5), ylim = range(data$g), type = 'n', xlab = 'Background sound',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.8, cex.axis=1.8,
     main="a", cex.main=2.8)
vioplot(data$g[data$sound=="noise"], col=pallete[2], at=1, add=T) 
vioplot(data$g[data$sound=="speech"], col=pallete[3], at=2, add=T)
vioplot(data$g[data$sound=="music"], col=pallete[4], at=3, add=T)
axis(1, at = c(1,2, 3), labels = c('Noise', 'Speech', 'Music'), cex.axis=1.5)

rect(xleft = 2.9, ybottom = 3, xright = 3.1, ytop = 3.5, col = NA, border = "darkred", lwd=1.8 )


# breakdown by measure:
plot(1, 1, xlim = c(0.5,3.5), ylim = range(data$g), type = 'n', xlab = 'Dependent measure',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.8, cex.axis=1.8,
     main="b", cex.main=2.8)
vioplot(data$g[data$measure!="reading_speed" & is.element(data$task, RC)], col=pallete[2], at=1, add=T) 
vioplot(data$g[data$measure=="reading_speed" & is.element(data$task, RC)], col=pallete[3], at=2, add=T)
vioplot(data$g[is.element(data$task, Proof)], col=pallete[4], at=3, add=T)
axis(1, at = c(1,2, 3), labels = c('Reading comprehension', 'Reading speed',
                                   'Proofreading accuracy'), cex.axis=1.5)
rect(xleft = 0.9, ybottom = 3, xright = 1.1, ytop = 3.5, col = NA, border = "darkred", lwd=1.8 )


# breakdow by age
plot(1, 1, xlim = c(0.5,2.5), ylim = range(data$g), type = 'n', xlab = 'Age category',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.8, cex.axis=1.8,
     main="c", cex.main=2.8)
vioplot(data$g[data$sample=="adults"], col=pallete[2], at=1, add=T)
vioplot(data$g[data$sample=="children"], col=pallete[3], at=2, add=T)
axis(1, at = c(1,2), labels = c('Adults', 'Children'), cex.axis=1.5)
rect(xleft = 1.9, ybottom = 3, xright = 2.1, ytop = 3.5, col = NA, border = "darkred", lwd=1.8 )

# breakdow by design:
plot(1, 1, xlim = c(0.5,2.5), ylim = range(data$g), type = 'n', xlab = 'Design',
     ylab = 'Effect size (g)', xaxt = 'n', family="serif", cex.lab=1.8, cex.axis=1.8,
     main="d", cex.main=2.8)
vioplot(data$g[data$design=="between"], col=pallete[2], at=1, add=T)
vioplot(data$g[data$design=="within"], col=pallete[3], at=2, add=T)
axis(1, at = c(1,2), labels = c('Between-subject', 'Within-subject'), cex.axis=1.5)
rect(xleft = 0.9, ybottom = 3, xright = 1.1, ytop = 3.5, col = NA, border = "darkred", lwd=1.8 )

dev.off()



