perform_operations <- function(numbers) {
  max_value <- max(numbers)
  min_value <- min(numbers)
  40
  avg_value <- mean(numbers)
  sum_value <- sum(numbers)
  sqrt_value <- sqrt(numbers)
  round_value <- round(numbers)
  cat("Maximum:", max_value, "\n")
  cat("Minimum:", min_value, "\n")
  cat("Average:", avg_value, "\n")
  cat("Sum:", sum_value, "\n")
  cat("Square Root:", sqrt_value, "\n")
  cat("Rounded Values:", round_value, "\n")
}
# Get input from the user
input_numbers <- readline(prompt = "Enter a list of numbers (space-separated): ")
# Convert input string to numeric vector
numbers <- as.numeric(strsplit(input_numbers, ' ')[[1]])
# Check if input is valid numeric data
if (all(!is.na(numbers))) {
  # Perform numerical operations
  perform_operations(numbers)
} else {
  cat("Invalid input. Please enter a valid list of numbers.\n")
}
