# Load necessary libraries
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
library(dplyr)
# Function to perform Min-Max normalization
min_max_normalization <- function(data) {
  # Display the original data
  cat("Original Data:\n")
  print(data)
  # Min-Max Normalization
  min_max_normalized <- data %>% mutate_all(funs((. - min(.)) / (max(.) - min(.))))
  cat("\nMin-Max Normalized Data:\n")
  print(min_max_normalized)
  return(min_max_normalized)
}
# Example data (replace this with your own dataset)
# Consider a data frame with numeric values
data <- data.frame(
  A = c(10, 20, 30, 40, 50),
  B = c(5, 15, 25, 35, 45),
  C = c(1, 2, 3, 4, 5)
)
# Perform Min-Max normalization
min_max_normalized_data <- min_max_normalization(data)