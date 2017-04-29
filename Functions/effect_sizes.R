
Cohens_d<- function(M_C, M_E, S_C, S_E, N_C=NULL, N_E=NULL, N=NULL, r=NULL, design="between", type= "C-E"){
  
    if(type=="C-E"){
      MD<- M_C-M_E
    }else{
      MD<- M_E-M_C
    }
  
  if(design=="between"){
    
    SDp<- sqrt(((N_C-1)*(S_C^2) + (N_E-1)*(S_E^2))/(N_C+N_E-2))
    
  }else{
    Sdiff<- sqrt(S_C^2 + S_E^2 - 2*r*S_C*S_E)
    SDp<- Sdiff/sqrt(2*(1-r))
  }
  
  return(MD/SDp)
}


Cohens_d_var<- function(d, N_C=NULL, N_E=NULL, N=NULL, r=NULL, design="between"){
  
  if(design=="between"){
    d_var<- (N_C + N_E)/(N_C*N_E) + (d^2)/(2*(N_C+N_E))
  } else{
    d_var<- (1/N + (d^2)/(2*N))* (2*(1-r)) 
  }
  
  return(d_var)
}


Hedges_g<- function(d, N_C=NULL, N_E=NULL, N=NULL, design= "between"){
  
  if(design== "between"){
    df<- N_C + N_E-2
  }else{
    df<- N-1
  }
  
  J<- 1- 3/(4*df-1) # correction factor
  
  g<- J*d
  
  return(g)
}


Hedges_g_var<- function(d_var, N_C=NULL, N_E=NULL, N=NULL, design= "between"){
  
  if(design== "between"){
    df<- N_C + N_E-2
  }else{
    df<- N-1
  }
  
  J<- 1- 3/(4*df-1) # correction factor
  
  g_var<- (J^2)*d_var
  
  return(g_var)
}
  

d_to_r<- function(d, n1, n2, varD=NULL){
  # "a" is a correction factor for when n1!= n2
  a<- (n1+ n2)^2/ (n1*n2)
  r<- d/ sqrt(d^2+a)
  
  if(length(varD==0)){
    
      return(r)
  
    } else{
        varR<- ((a^2)*varD)/(d^2+a)^3
      return(varR)
  }
}

r_to_d<- function(r){(2*r)/sqrt(1-r^2)}

r_to_d_var<- function(r_var, r){4*r_var/ ((1-r^2)^3)}


Ttest_to_d<- function(t, N_C=NULL, N_E=NULL, n=NULL, design="between", r=NULL){
  # from Lajeunesse (2011)
  
  if(design== "between"){
    d<- t*sqrt((N_C+ N_E)/(N_C*N_E))
  } else{
    d<- t*sqrt((2*(1-r))/(n))
  }
  return(d)
}


Ttest_to_d_var<- function(d, N_C=NULL, N_E=NULL, n=NULL, design="between", r=NULL){
  # from Borenstein (2009)
  
  if(design== "between"){
     var<- (N_C+N_E)/ (N_C*N_E) + (d^2)/(2*(N_C+N_E))
  } else{
     var<- (1/n + (d^2)/(2*n))*2*(1-r)
  }
  return(var)
}


ANOVA_to_d<- function(Fvalue, N_C=NULL, N_E=NULL, n=NULL, design="between", r=NULL){
  #from Borenstein (2009)
  
  if(design=="between"){
    d<- sqrt((Fvalue*(N_C+N_E))/ (N_C*N_E))
  } else{
    d<- sqrt((2*Fvalue*(1-r))/n)
  }
  return(d)
}


ANOVA_to_d_var<- function(d, N_C=NULL, N_E=NULL, n=NULL, design="between", r=NULL){
  #from Borenstein (2009)
  
  if(design=="between"){
    var<- (N_C+N_E)/(N_C*N_E) + (d^2)/(2*(N_C+N_E))
  } else {
    var<- (1/n + (d^2)/(2*n))*2*(1-r)
  }
  return(var)
}


corr_var<- function(r,n){ ((1-r^2)^2)/(n-1) }


Fishers_z<- function(r){ 0.5*log((1+r)/(1-r)) }

Fishers_z_var<- function(n){ 1/(n-3) }

Fishers_z_to_r<- function(z){ (exp(2*z)-1)/(exp(2*z)+1) }
