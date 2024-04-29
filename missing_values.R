# Load necessary libraries
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)
# Function to handle missing data
handle_missing_data <- function(data, method = "mean") {
  # Display the original data
  cat("Original Data:\n")
  print(data)
  # Handling Missing Data
  if (method == "mean") {
    # Replace missing values with the mean of the respective column
    data_imputed <- data %>% mutate_all(funs(ifelse(is.na(.), mean(., na.rm = TRUE), .)))
  } else if (method == "median") {
    # Replace missing values with the median of the respective column
    data_imputed <- data %>% mutate_all(funs(ifelse(is.na(.), median(., na.rm = TRUE), .)))
  } else if (method == "zero") {
    # Replace missing values with zeros
    data_imputed <- data %>% replace(is.na(.), 0)
  } else {
    cat("Invalid imputation method. Supported methods: 'mean', 'median', 'zero'\n")
    return(NULL)
  }
  cat("\nData after Handling Missing Data (Imputation Method:", method, "):\n")
  print(data_imputed)
  return(data_imputed)
}
# Example data (replace this with your own dataset)
# Consider a data frame with missing values
data <- data.frame(
  A = c(1, 2, NA, 4, 5),
  B = c(5, 4, 3, 2, 1),
  C = c(10, NA, 8, 6, 4)
)
# Specify the imputation method ("mean", "median", "zero")
imputation_method <- "mean"
# Handle missing data
imputed_data <- handle_missing_data(data, imputation_method)