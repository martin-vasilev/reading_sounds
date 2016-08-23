
print_data<- function(data, first=F){
  dat<- data[nrow(data),]
  
  if(first){
    string1<- paste("## Study ", toString(dat$ID),  " ##", sep= "") 
    return(cat(string1)); return(cat("\n"))
  }
  
  string2<- "something"
  
  l<<- list(string1, string2)
  
  return(cat(unlist(l)))
  
  
}