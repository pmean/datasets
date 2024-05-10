extract_description <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # the description (if it exists) as
  # defined in the description section of
  # the yaml file.
  warn_text <- "No description available"
  x <- names(dd$description)
  if (is.null(x)) x <- warn_text
}

extract_labels <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # labels (if they exist) for every
  # variable defined in the vars
  # section of the yaml file
  n_vars <- length(dd$vars)
  vlabels <- rep("", n_vars)
  for (i_vars in 1:n_vars) {
    x <- dd$vars[[i_vars]]$label
    if (!is.null(x)) vlabels[i_vars] <- x
  }
  vlabels
}

extract_names <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # names of each variable defined in the
  # vars section of the yaml file.
  warn_text <- "No names recorded in the vars section of the yaml file"
  x <- names(dd$vars)
  if (is.null(x)) x <- warn_text
  x
}
