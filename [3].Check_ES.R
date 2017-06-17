
# A script for visualisation and checking of effect sizes

### Violin Plots

load("Data/data.Rda")
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

