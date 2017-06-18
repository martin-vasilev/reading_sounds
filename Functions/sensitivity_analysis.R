# Script for performing a sensitivity analysis by using the leave-one-out method
# Martin Vasilev, 2016

sensitivity_analysis<- function(data1, mu="dunif(-200, 200)", tau="dunif(0, 200)"){
  
  source("Functions/Bmeta.R")
  if("rjags" %in% rownames(installed.packages())==FALSE){
    message("Installing required package 'rjags'...")
    install.packages("rjags")
  }
  library(rjags)
  
  K<-NULL
  string<- paste("Performing sensitivity analysis on ", nrow(data1),
                 "studies using the leave-one-out method...")
  message(string)
  
  for(i in 1:nrow(data1)){
    
    data<- data1[-i,]
    
    M_M <-jags.model(Bmeta(mu, tau, nrow(data), "sensitivity.txt"),
                     data, n.chains=3, n.adapt=3000, quiet=TRUE)
    string<- paste("Repeating analysis without study ", i," ...", sep="")
    print(string)
    M<- coda.samples(M_M, c('mu', 'tau','theta'), n.iter=75000, thin=5, quiet=TRUE)
    sum<- summary(M); sum
    
    K[i]<- sum$statistics[1,1] # Pooled mean
  }
  
  #print(table(K))
  string<- paste("The mean effect size is: ", round(mean(K), digits=3))
  message(string)
  string<- paste("SD: ", round(sd(K), digits=3))
  message(string)
  string<- paste("Range: ", round(range(K), digits=3)[1], " - ", round(range(K), digits=3)[2])
  message(string)
  
  return(K)
}

