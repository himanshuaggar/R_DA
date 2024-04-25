# Install and load necessary libraries
if (!requireNamespace("MASS", quietly = TRUE)) {
  install.packages("MASS")
}
library(MASS)

# Load the mtcars dataset (built-in dataset in R)
data("mtcars")

# Display the structure of the original dataset
cat("Original mtcars Dataset:\n")
str(mtcars)

# Separate features and target variable
features <- mtcars[, -1] # Exclude the first column (car names)
target <- mtcars$mpg

# Perform PCA
pca_result <- prcomp(features, center = TRUE, scale. = TRUE)

# Display the summary of PCA
summary(pca_result)

# Scree plot to visualize the variance explained by each principal component
screeplot(pca_result, type = "line", main = "Scree Plot")

# Biplot to visualize the relationship between original features and principal components
biplot(pca_result, scale = 0)

# Extract transformed data with reduced dimensionality
reduced_data <- as.data.frame(predict(pca_result, newdata = features))

# Display the transformed data with reduced dimensionality
cat("\nTransformed Data with Reduced Dimensionality:\n")
print(reduced_data)
