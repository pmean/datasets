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

review_yaml_structure <- function() {
  library(glue)
  library(magrittr)
  library(readr)

  fn <- list.files()
  yaml_files <- str_subset(fn, "yaml$")

  yaml_aggregate <- NULL
  
  for (yaml_file in yaml_files) {
    dd <- read_yaml(yaml_file)
    root <- str_replace(yaml_file, "\\..*", "")
    yaml_aggregate %<>% bind_rows(data.frame(files=root, fields=names(dd)))
  }
  recommended_fields <- c(
    "data_dictionary",
    "description",
    "additional_description",
    "note",
    "source",
    "source_url",
    "repository",
    "repository_url",
    "download_url",
    "copyright",
    "format",
    "varnames",
    "missing_value_code",
    "size",
    "vars")
  all_names <- data.frame(
    fields=recommended_fields,
    field_order=1:length(recommended_fields))
  for (dd in unique(yaml_aggregate$files)) {
    yaml_aggregate %>%
      filter(files==dd) %>%
      full_join(all_names, by="fields") %>% 
      select(fields, field_order, files) %>%
      arrange(field_order) %>%
      print
    cat("\n\n")
  }
}
