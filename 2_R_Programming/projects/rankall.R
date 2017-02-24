rankall <- function(outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  
  # Change outcome column class
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  if (num == "best"){
    return(out_dt[order(state, get(outcome), `hospital name`)
    , .(hospital = head(`hospital name`, 1))
    , by = state])
  }
  
  if (num == "worst"){
    return(out_dt[order(get(outcome), `hospital name`)
    , .(hospital = tail(`hospital name`, 1))
    , by = state])
  }
  
  return(out_dt[order(state, get(outcome), `hospital name`)
                , head(.SD,num)
                , by = state, .SDcols = c("hospital name") ])
  
}