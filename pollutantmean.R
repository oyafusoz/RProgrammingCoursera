pollutantmean <- function(directory, pollutant, id = 1:332) {  
  file_numbers = as.numeric(substr(list.files(directory),1,3)) 
  i = 1
  append_df = data.frame(Date=vector(), sulfate=vector(), nitrate=vector(), ID=vector())
  
  while(i <= length(id)){
    file = read.csv(list.files(directory)[match(id[i], file_numbers)], header = T)
    append_df = rbind(append_df, file)
    i = i + 1
  }
 mean(append_df[, match(pollutant, names(append_df))], na.rm = T)
}