
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

Ttest_to_d<- function(t, N_C=NULL, N_E=NULL, n=NULL, design="independent", r=NULL){
  # from Lajeunesse (2011)
  if(design== "independent"){
    d<- t*sqrt((N_C+ N_E)/(N_C*N_E))
  } else{
    d<- t*sqrt((2*(1-r))/(n))
  }
  
  return(d)
}