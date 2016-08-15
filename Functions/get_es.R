get_es<- function(data){
  
  CohensD<- function(md, s1, s2){
    SDpooled <- sqrt((s1^2 + s2^2)/2)
    d<- md/SDpooled
    return(d)
  }
  
  
  
}