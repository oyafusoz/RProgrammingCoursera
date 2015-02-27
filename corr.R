source('C://Users//Mervin//Google Drive//RProgrammingCoursera//complete.R')
corr <- function(directory, threshold = 0) {
  cor_vector = vector()
  
  if(sum(complete(directory)$nobs > threshold) > 0)
    for(i in list.files(directory)){
      file = read.csv(i, header = T)
      if(sum(complete.cases(file)) > threshold){
        cor_vector = c(cor_vector, cor(file$nitrate, file$sulfate, use = 'complete.obs'))
      }
      else(cor_vector = cor_vector)
    }
  else(cor_vector = cor_vector)
  return(cor_vector)
}

##Instructions can be found on the coursera website, Assigment 1: Air Pollution. 
#Line 1: source the complete.R script so that we have the created complete function
#Line 3: create a vector cor_vector to store the values of the correlation coefficient
#Line 5: ask whether there is at least one monitor with more observations than the threshold:
##If True: continue on Lines 6 - 12
#Line 6-8: read a file in the directory, ask whether there are more observations than the threshold; if so append the correlational coefficient with 

##If False: continue on to line 13