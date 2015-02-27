setwd("c:/Users/Zack/Google Drive/RProgrammingCoursera")
outcome_df = read.csv('outcome-of-care-measures.csv', stringsAsFactors = F)
source('rankhospital.r')

rankall = function(outcome, rank){
    outcome_list = c('heart attack', 'pneumonia', 'heart failure')
    if (is.na(match(outcome, outcome_list)) == T) stop('invalid outcome')
    states = sort(unique(outcome_df$State))
    
    rank_df = data.frame(State = vector(), Hospital = vector())
    for(i in 1:length(states)){
        rank_df[i,] = c(states[i], 
                        rankhospital(state = states[i], outcome = outcome, rank = rank))
    }
    return(rank_df)
}