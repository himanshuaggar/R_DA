#diagnose any disease using KNN classification and plot the results. 

# Loading package
library(e1071)
library(caTools)
library(class)
library(ggplot2)

setwd("C:\\Users\\himan\\Downloads\\heartcsv")
# Loading data
heart <- read.csv("heart.csv")

# Splitting data into train and test data
split <- sample.split(heart, SplitRatio = 0.7)
train_cl <- subset(heart, split == "TRUE")
test_cl <- subset(heart, split == "FALSE")

# Feature Scaling
train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])

# Fitting KNN Model to training dataset
classifier_knn <- knn(train = train_scale,
                      test = test_scale,
                      cl = train_cl$target,
                      k = 1)

cm <- table(test_cl$target, classifier_knn)
cm

# Model Evaluation - Choosing K
# Calculate out of Sample error
misClassError <- mean(classifier_knn != test_cl$target)
print(paste('Accuracy =', 1 - misClassError))

# Data preparation
k_values <- c(1, 3, 5, 7, 15, 19)

# Calculate accuracy for each k value
accuracy_values <- sapply(k_values, function(k) {
  classifier_knn <- knn(train = train_scale,
                        test = test_scale,
                        cl = train_cl$target,
                        k = k)
  1 - mean(classifier_knn != test_cl$target)
})

# Create a data frame for plotting
accuracy_data <- data.frame(K = k_values, Accuracy = accuracy_values)

# Plotting and displaying the plot
print(ggplot(accuracy_data, aes(x = K, y = Accuracy)) +
        geom_line(color = "lightblue", size = 1) +
        geom_point(color = "lightgreen", size = 3) +
        labs(title = "Model Accuracy for Different K Values",
             x = "Number of Neighbors (K)",
             y = "Accuracy") +
        theme_minimal())
