source(C://Users//Mervin//Google Drive//RProgrammingCoursera//complete.R)
corr <- function(directory, threshold = 0) {
  
  cor_vector = vector()
  
  if(sum(complete(directory)$nobs > threshold) > 0)
    for(i in 1:length(list.files(directory))){
      file = read.csv(list.files(directory)[i], header = T)
      if(sum(complete.cases(file)) > threshold){
        cor_vector = c(cor_vector, cor(file$nitrate, file$sulfate, use = 'complete.obs'))
      }
      else(cor_vector = cor_vector)
    }
  
  else(cor_vector = 0)
  
  return(cor_vector)
}