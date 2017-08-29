
# Script for performing a sensitivity analysis via statical simulations
# Martin Vasilev, 2017

stat_sim<- function(data1, mu="dunif(-10, 10)", tau="dunif(0, 10)", mean_s, var_s, nsim= 10){
  
  source("Functions/Bmeta.R")
  if("rjags" %in% rownames(installed.packages())==FALSE){
    message("Installing required package 'rjags'...")
    install.packages("rjags")
  }
  library(rjags)
  
  K<-NULL
  `T`<- NULL
  S.sqr<- NULL
  
  string<- paste("Performing sensitivity analysis with ", nsim,
                 "simulations...")
  cat(string)
  cat("\n")
  
  for(i in 1:nsim){
    cat(toString(i))
    `T`[i]<- runif(n = 1, min =  mean_s[1], max =  mean_s[2])
    S.sqr[i]<- runif(n = 1, min = var_s[1], max = var_s[2]) 
    t<- data.frame(`T`[i], S.sqr[i])
    colnames(t)<- c("T", "S.sqr")
    
    data<- rbind(data1, t)
    
    M_M <-jags.model(Bmeta(mu, tau, nrow(data), "stat_sim.txt"),
                     data, n.chains=3, n.adapt=2000, quiet=TRUE)
   
    M<- coda.samples(M_M, c('mu', 'tau'), n.iter=5000, quiet=TRUE)
    sum<- summary(M); 
    
    K[i]<- sum$statistics[1,1] # Pooled mean
  }
  
  #print(table(K))
  string<- paste("The mean effect size is: ", round(mean(K), digits=3))
  message(string)
  string<- paste("SD: ", round(sd(K), digits=3))
  message(string)
  string<- paste("Range: ", round(range(K), digits=3)[1], " - ", round(range(K), digits=3)[2])
  message(string)
  
  sim<- data.frame(K, `T`, S.sqr)
  
  return(sim)
}

