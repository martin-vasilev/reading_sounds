
Add_data_cor<- function(data, ID, N_C, N_E, sample, age, grade, cit, year, sound,
                    sound_type, db_C, db_E, task, measure,
                    mean_C, var_C, mean_E, var_E, var_type, analysis, reference){
  
 # if(design=="within"){
 #   N_E<- N_C
 # }
  
  cur_study<- data.frame(ID, N_C, N_E, sample, age, grade, cit, year, sound,
                         sound_type, db_C, db_E, task, measure,
                         mean_C, var_C, mean_E, var_E, var_type, analysis, reference)
  
  data<- rbind(data, cur_study)
  
  if(is.na(data$ID[1])){
      return(cur_study)
  }
  else{
      return(data)
  }
  
}