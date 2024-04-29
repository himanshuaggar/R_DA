#Generate some sample data
set.seed(123) # for reproducibility
x <- 1:50
y <- 3 * x + rnorm(50, mean = 0, sd = 10) # y = 3x + random noise
data <- data.frame(x = x, y = y)
# Fit the Simple Linear Regression model
model <- lm(y ~ x, data = data)
# Display the summary of the regression model
summary(model)
56
# Plot the data points and regression line
plot(x, y, main = "Simple Linear Regression", xlab = "Independent Variable (x)", ylab = "Dependent Variable (y)")
abline(model, col = "red")