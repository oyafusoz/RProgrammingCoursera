setwd("c:/Users/Zack/Google Drive/RProgrammingCoursera")
outcome_df = read.csv('outcome-of-care-measures.csv')

best = function(state, outcome){
    if (is.na(match(state, outcome_df$State)) == T) stop('invalid state')

    outcome_list = c('heart attack', 'pneumonia', 'heart failure')
    if (is.na(match(outcome, outcome_list)) == T) stop('invalid outcome')
    
    if(outcome == 'heart attack') outcome_column = 11
    if(outcome == 'heart failure') outcome_column = 17
    if(outcome == 'pneumonia') outcome_column = 23
    
    outcome_subset = outcome_df[outcome_df$State == state,c(2,outcome_column)]
    outcome_subset[,2] = as.numeric(levels(outcome_subset[,2])[outcome_subset[,2]])
    outcome_subset = na.omit(outcome_subset)
    best_hospital_index = which(outcome_subset[,2] == min(outcome_subset[,2]))
    best_hospital = as.character(sort(outcome_subset[best_hospital_index,1])[1])
    
    return(best_hospital)
}