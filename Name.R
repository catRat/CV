Name <- function(x, col_nammer = NA, names = NA) {
	i <- names(x)
	i[col_namer] <- names
	names(x) <- i
	return(x)
}
