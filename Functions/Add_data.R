Add_data<- function(data=data, ID=NA, N= NA, cit=NA, year=NA, sound=NA, db=NA, task=NA, 
                    measure=NA, mean_C=NA, var_C=NA, mean_E=NA, var_E=NA, var_type=NA,
                    reference=NA){
  
  cur_study<- data.frame(ID, N, cit, year, sound, db, task, 
                         measure, mean_C, var_C, mean_E, var_E, var_type, reference)
  
  data<- rbind(data, cur_study)
  
  if(is.na(data$ID[1])){
      return(cur_study)
  }
  else{
      return(data)
  }
  
}