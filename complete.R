complete <- function(directory, id = 1:332) {
  file_numbers = as.numeric(substr(list.files(directory),1,3)) 
  append_df = data.frame('id'=vector(), 'nobs'=vector())
  
  i = 1
  while(i <= length(id)){
    file = read.csv(list.files(directory)[match(id[i], file_numbers)], header = T)
    append_df = rbind(append_df, list(id = id[i], nobs = sum(complete.cases(file))))
    i = i + 1
  }
  return(append_df)
}