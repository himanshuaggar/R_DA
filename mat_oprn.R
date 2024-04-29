# Function to perform matrix operations
perform_matrix_operations <- function(matrix1, matrix2) {
  # Addition
  add_result <- matrix1 + matrix2
  cat("Matrix Addition Result:\n")
  print(add_result)
  # Subtraction
  sub_result <- matrix1 - matrix2
  cat("\nMatrix Subtraction Result:\n")
  print(sub_result)
  # Multiplication
  mul_result <- matrix1 %*% matrix2
  cat("\nMatrix Multiplication Result:\n")
  print(mul_result)
  # Inverse (only if the matrix is square and invertible)
  if (det(matrix1) != 0) {
    inv_result <- solve(matrix1)
    cat("\nMatrix Inverse Result:\n")
    print(inv_result)
  } else {
    cat("\nMatrix 1 is not invertible (determinant is zero).\n")
  }
  # Transpose
  trans_result1 <- t(matrix1)
  trans_result2 <- t(matrix2)
  cat("\nTranspose of Matrix 1:\n")
  print(trans_result1)
  cat("\nTranspose of Matrix 2:\n")
  print(trans_result2)
  # Division (matrix1 / matrix2 = matrix1 * inverse(matrix2))
  if (det(matrix2) != 0) {
    div_result <- matrix1 %*% solve(matrix2)
    cat("\nMatrix Division Result:\n")
    print(div_result)
  } else {
    cat("\nMatrix 2 is not invertible (determinant is zero).\n")
    43
  }
}
# Get input matrices from the user
matrix1 <- matrix(as.numeric(readline(prompt = "Enter elements of Matrix 1 (space-separated): ")), nrow = 3, byrow = TRUE)
matrix2 <- matrix(as.numeric(readline(prompt = "Enter elements of Matrix 2 (space-separated): ")), nrow = 3, byrow = TRUE)
# Check if input matrices are valid
if (all(!is.na(matrix1)) && all(!is.na(matrix2))) {
  # Perform matrix operations
  perform_matrix_operations(matrix1, matrix2)
} else {
  cat("Invalid input. Please enter valid numeric matrices.\n")
}