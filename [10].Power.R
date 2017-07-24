
# Martin R. Vasilev, 2017

if('pwr' %in% rownames(installed.packages())==FALSE){
  message(paste("Installing required package ", toupper('pwr'), "..."))
  install.packages('pwr')
}else{
  library('pwr')
}

# possibles sample sizes (two-sample t-test):
Nrange<- seq(2,400, 2)
ESrange<- seq(-0.01, -2, -0.01)
P<- data.frame(matrix(NA, nrow = length(ESrange), ncol = length(Nrange)))


# calculate ES:

for (i in 1:length(ESrange)){ # ES
  for(j in 1:length(Nrange)){ # N
    a<- pwr.t.test(n = Nrange[j], d = ESrange[i], sig.level = 0.05, power = NULL,
                   type = "two.sample", alternative = 'two.sided')
    
    P[i,j]<- a$power
  }
}

# re-order for plot, N starting from 1 at bottom
#P2<- P[seq(length(Nrange),1,-1),] 
P2<- P
P3<- data.matrix(P2)


#c<- NULL
#for(i in 1:150){
#  c[i]<- paste("V", i, sep='')
#}
#colnames(P3)<- seq(1,150,1)
#colnames(P3)<- c

#rotate <- function(x) t(apply(x, 2, rev))

# Power plot:
#library(lattice)
#levelplot(P3, pretty=F, contour=T, cuts=10)
#contourplot(P3)
#at= seq(0.01,1, 0.01)

#levelplot(rotate(P3), pretty=T)

#plot_ly(z = P3, type = "heatmap")

require(grDevices)

png('Plots/powerPlot.png', width = 4800, height = 2800, units = "px", res=600, type="cairo")


filled.contour(seq(0.005, 2, 0.01), Nrange, P3,color.palette = terrain.colors,
               plot.title = title(main = "",
                                  xlab = "|Effect size|", ylab = "Sample size",
                                  family="serif", cex.lab=1.3),
               plot.axes = { axis(1, seq(0, 2, by = 0.1), family="serif")
                 axis(2, seq(0, 400, by = 50), family="serif") },
               key.title = title(main = "Power", family="serif"))

par(xpd=TRUE)
arrows(x0 = 0.01, y0 = 425, x1 =0.5, y1 = 425, lwd=1.3,
       length =0.08, angle=90, code=3, lty = 1, col= "darkred")

dev.off()


