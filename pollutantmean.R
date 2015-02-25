pollutantmean <- function(directory, pollutant, id = 1:332) {  
  append_df = data.frame()
  
  for(i in id){
    file = read.csv(list.files(directory)[i])
    append_df = rbind(append_df, file)
  }
  
  return(mean(append_df[, paste(pollutant)], na.rm = T))
}

#Instructions can be found on the coursera website, Assigment 1: Air Pollution. 
#Line 2: create a new empty dataframe where we will append the dataframes
#Lines 4-7: loop through each id number, read it in, then rbind it to append_df
#Line 9: return the mean given the pollutant chosen.