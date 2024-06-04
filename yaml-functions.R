extract_description <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # the description (if it exists) as
  # defined in the description section of
  # the yaml file.
  warn_text <- "No description available"
  description <- names(dd$description)
  if (is.null(description)) description <- warn_text
  return(description)
}

extract_names <- function(dd) {
  return(names(dd$vars))
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
  return(vlabels)
}

extract_labels <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # labels (if they exist) for every
  # variable defined in the vars
  # section of the yaml file
  n_vars <- length(dd$vars)
  vlabels <- names(dd$vars)
  for (i_vars in 1:n_vars) {
    x <- dd$vars[[i_vars]]$label
    if (!is.null(x)) vlabels[i_vars] <- x
  }
  return(vlabels)
}

extract_scales <- function(dd) {
  # This function takes a data dictionary
  # in yaml format (with a specific
  # predefined structure) and extracts
  # the scales of each variable defined
  # in the vars section of the yaml file.
  n_vars <- length(dd$vars)
  vscales <- rep("no scale recorded", n_vars)
  for (i_vars in 1:n_vars) {
    x <- dd$vars[[i_vars]]$scale
    if (!is.null(x)) vscales[i_vars] <- x
  }
  return(vscales)
}

list_datasets <- function() {
	fn <- list.files()
	yaml_files <- str_subset(fn, "yaml$")
	for (f in yaml_files) {
		dd <- read_yaml(f)
		root <- str_replace(f, "\\..*", "")
		cat(glue("{root}: {dd$description}"))
		cat("\n\n")
	}
	return(0)
}
list_datasets()

# https://github.com/pmean/datasets/blob/master/.yaml
# https://raw.githubusercontent.com/pmean/datasets/master/.yaml
# https://raw.githubusercontent.com/pmean/datasets/master/.csv

