Select <- function(x, id, set) {
	j <- which(names(x) == id)
	selecter <- FALSE
	for(i in seq(set)) {
		selecter <- x[, j] == set[i] | selecter
	}
	return(x[which(selecter),])
}
