pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}

# Example usage
pollutantmean(directory = '~/Desktop/specdata', pollutant = 'sulfate', id = 20)