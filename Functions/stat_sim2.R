
# Script for performing a sensitivity analysis via statical simulations
# Martin Vasilev, 2017

stat_sim2<- function(data1, mu="dunif(-10, 10)", tau="dunif(0, 10)",
                    mean_s1, var_s1, mean_s2, var_s2, nsim= 10){
  
  source("Functions/Bmeta.R")
  if("rjags" %in% rownames(installed.packages())==FALSE){
    message("Installing required package 'rjags'...")
    install.packages("rjags")
  }
  library(rjags)
  
  K<-NULL
  T1<- NULL
  S.sqr1<- NULL
  T2<- NULL
  S.sqr2<- NULL
  
  string<- paste("Performing sensitivity analysis with ", nsim,
                 "simulations...")
  cat(string)
  cat("\n")
  
  for(i in 1:nsim){
    cat(toString(i))
    T1[i]<- runif(n = 1, min =  mean_s1[1], max =  mean_s1[2])
    S.sqr1[i]<- runif(n = 1, min = var_s1[1], max = var_s1[2]) 
    
    #T2[i]<- runif(n = 1, min =  mean_s2[1], max =  mean_s2[2])
    T2[i]<- mean_s2
    if(i%%2==0){
      T2[i]= -T2[i]
    }
    S.sqr2[i]<- runif(n = 1, min = var_s2[1], max = var_s2[2]) 
    
    t1<- data.frame(T1[i], S.sqr1[i])
    t2<- data.frame(T2[i], S.sqr2[i])
    colnames(t1)<- c("T", "S.sqr")
    colnames(t2)<- c("T", "S.sqr")
    t<- rbind(t1,t2)
    
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
  
  sim<- data.frame(K, T1, S.sqr1, T2, S.sqr2)
  
  return(sim)
}

