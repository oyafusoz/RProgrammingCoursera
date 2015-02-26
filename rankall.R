setwd("c:/Users/Zack/Google Drive/RProgrammingCoursera")
outcome_df = read.csv('outcome-of-care-measures.csv')
source(rankhospital)

rankall = function(outcome, rank){
    outcome_list = c('heart attack', 'pneumonia', 'heart failure')
    if (is.na(match(outcome, outcome_list)) == T) stop('invalid outcome')
    
    rank_df = data.frame()
    for(i in unique(outcome_df$State)){
        add = c(i, rankhospital(state = i, outcome = outcome, rank = rank))
        rank_df = rbind(rank_df, add)
    }
    return(rank_df)
}

head(rankall("heart attack", 20), 10)
