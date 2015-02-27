setwd("c:/Users/Zack/Google Drive/RProgrammingCoursera")
outcome_df = read.csv('outcome-of-care-measures.csv', stringsAsFactors = F)

rankhospital = function(state, outcome, rank){
    if (is.na(match(state, outcome_df$State)) == T) stop('invalid state')
    
    outcome_list = c('heart attack', 'pneumonia', 'heart failure')
    if (is.na(match(outcome, outcome_list)) == T) stop('invalid outcome')
    
    if(outcome == 'heart attack') outcome_column = 11
    if(outcome == 'heart failure') outcome_column = 17
    if(outcome == 'pneumonia') outcome_column = 23
    
    #Isolate State and Condition columns from outcome_df
    outcome_subset = outcome_df[outcome_df$State == state,c(2,outcome_column)]
    
    #Convert mortality rates to numbers and NAs
    outcome_subset[,2] = suppressWarnings(as.numeric(outcome_subset[,2]))
    
    #Remove NAs
    outcome_subset = na.omit(outcome_subset)
    
    #Rank subset df by mortality rate first, then hospital name
    outcome_subset = outcome_subset[order(outcome_subset[,2], outcome_subset[,1]),]
    
    #If rank is given as 'worst' or 'best', change rank to their interpretive values
    if(rank == 'worst') rank = nrow(outcome_subset) #i.e. highest mortality rate
    if(rank == 'best') rank = 1 #i.e. lowest mortality rate
    
    #Return the hospital name with the corresponding rank
    return(outcome_subset[rank,1])
}