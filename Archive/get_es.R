
get_es<- function(data){
  
  # FUNCTIONS:
  #######################################################################################
  CohensD<- function(m1, m2, s1, s2, n1, n2=NA, type= "between", var="SD"){ # Calculates Cohen's d
    md<- m2-m1
    
    if(var=="SE"){
      s1<- s1*sqrt(n1)
      s2<- s2*sqrt(n2)
    }

    if(type=="between"){
      SDpooled <- sqrt(((n1-1)*(s1^2) + (n2-1)*(s2^2))/ (n1+n2-2))
    }else{
      
    }
    d<- md/SDpooled
    
    return(d)
  }
  
  
  varCohensD<- function(d, n1, n2){ # calculates the variance for Cohen's d
    var_d<- (n1+n2)/(n1*n2) + d^2/(2*(n1+n2))
    
    return(var_d)
  }
  
  HedgesG<- function(d, n1, n2){ # calculates Hedges' g from Cohen's d (correction for small sample studies)
    df<- n1+n2-2
    J<- 1- 3/(4*df-1)
    g<- J*d
    
    return(g)
  }
  
  varHedgesG<- function(var_d, n1, n2){
    df<- n1+n2-2
    J<- 1- 3/(4*df-1)
    var_g<- (J^2)*var_d
  }
  
  #######################################################################################
  
  d<-NULL; var_d<- NULL; g<- NULL; var_g<- NULL
  for(i in 1:nrow(data)){
    if(data$design[i]=="between"){
      d[i]<- CohensD(m1= data$mean_C[i], m2= data$mean_E[i], s1= data$var_C[i], s2= data$var_E[i],
                     n1=data$N_C[i], n2= data$N_E[i], var= data$var_type[i])
      var_d[i]<- varCohensD(d[i], data$N_C[i], data$N_E[i])
      g[i]<- HedgesG(d[i], data$N_C[i], data$N_E[i])
      var_g[i]<- varHedgesG(var_d[i], data$N_C[i], data$N_E[i])
      
    } else{
      d[i]<- NA
      var_d[i]<-NA
      g[i]<- NA
      var_g[i]<- NA
    } 
  }
  
  es<- data.frame(data$ID, data$cit, data$year, data$design, data$sound, data$sound_type, data$db, data$task,
                  data$measure, d, var_d, g, var_g)
  
  return(es)
}

