
Add_data<- function(data=data, ID=NA, N_C= NA, N_E=NA, sample=NA, cit=NA, year=NA, design=NA, sound=NA,
                    sound_type=NA, db=NA, task=NA,measure=NA, mean_C=NA, var_C=NA, mean_E=NA, var_E=NA,
                    var_type=NA, reference=NA){
  
  if(design=="within"){
    N_E<- N_C
  }
  
  cur_study<- data.frame(ID, N_C, N_E, sample, cit, year, design, sound, sound_type, db, task, 
                         measure, mean_C, var_C, mean_E, var_E, var_type, reference)
  
  data<- rbind(data, cur_study)
  
  if(is.na(data$ID[1])){
      return(cur_study)
  }
  else{
      return(data)
  }
  
}