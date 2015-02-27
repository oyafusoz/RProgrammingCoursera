setwd("c:/Users/Zack/Google Drive/RProgrammingCoursera")
outcome_df = read.csv('outcome-of-care-measures.csv', stringsAsFactors = F)

best = function(state, outcome){
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
    
    #Find which index(ices) have the minimum mortality rate(s)
    best_hospital_index = which(outcome_subset[,2] == min(outcome_subset[,2]))
    
    #alphabetize the 'best' hospitals (if there are ties) and report the first one
    best_hospital = sort(outcome_subset[best_hospital_index,1])[1]
    
    return(best_hospital)
}