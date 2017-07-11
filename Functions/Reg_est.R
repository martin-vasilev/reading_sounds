
Reg_est<- function(P, crit=0.3){
  plot(P$mu, P$beta, xlab= expression(theta), ylab= expression(beta), cex.lab=1.2)
  
  C<- cor.test(P$mu, P$beta)
  message( paste("Correlation between beta and theta: ", round(C$estimate,2)))
  
  if(abs(C$estimate)>crit){
    message("Houston, we have a problem...")
  }
}