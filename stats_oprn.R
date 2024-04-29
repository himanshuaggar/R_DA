# Function to perform statistical operations
perform_statistical_operations <- function(data) {
  # Mean
  mean_value <- mean(data)
  cat("Mean:", mean_value, "\n")
  # Median
  median_value <- median(data)
  cat("Median:", median_value, "\n")
  # Mode (using a custom function)
  mode_value <- function(x) {
    ux <- unique(x)
    ux[which.max(tabulate(match(x, ux)))]
  }
  mode_result <- mode_value(data)
  cat("Mode:", mode_result, "\n")
  # Standard Deviation
  46
  sd_value <- sd(data)
  cat("Standard Deviation:", sd_value, "\n")
}
# Get input data from the user
input_data <- as.numeric(strsplit(readline(prompt = "Enter a list of numeric values (space-separated): "), ' ')[[1]])
# Check if input data is valid
if (!any(is.na(input_data))) {
  # Perform statistical operations
  perform_statistical_operations(input_data)
} else {
  cat("Invalid input. Please enter valid numeric values.\n")
}