Name <- function(x, col_nammer = NA, names = NA) {
  # Change a dataframe name where select
  i <- names(x)
  i[col_namer] <- names
  names(x) <- i
  return(x)
}
