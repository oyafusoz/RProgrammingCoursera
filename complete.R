complete <- function(directory, id = 1:332) {
  append_df = data.frame()
  
  for (i in id){
    file = read.csv(list.files(directory)[i])
    append_df = rbind(append_df, c(id = i, nobs = sum(complete.cases(file))))
  }
  colnames(append_df) = c('id', 'nobs')
  return(append_df)
}

##Instructions can be found on the coursera website, Assigment 1: Air Pollution. 
#Line 2: create a new empty dataframe that will hold id station and number of complete obs
#Lines 4-5: loop through each id number and read it in.
#Line 6: rbind append_df with a vector of length 2 containing the id number and the sum of the complete cases for a particular dataset
#Line 8: create the column headers (probably a better way to do this earlier in the script?)
#Line 9: return the created dataframe