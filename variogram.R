# Summary statistics for Y coordinates
min_y <- min(s256i$coords[, 2])
max_y <- max(s256i$coords[, 2])

cat("The minimum value of the Y coordinate is", min_y, "\n")
cat("The maximum value of the Y coordinate is", max_y, "\n")

# Basic scatter plot
plot(s256i$coords, main = "Data Locations", xlab = "X", ylab = "Y", col = "blue", pch = 16)

# Additional visualizations
par(mfrow = c(2, 2))
plot(s256i$coords, main = "Scatter Plot", col = "green", pch = 16)
hist(s256i$coords[, 1], main = "Histogram of X Coordinates", xlab = "X", col = "lightblue", border = "blue")
hist(s256i$coords[, 2], main = "Histogram of Y Coordinates", xlab = "Y", col = "pink", border = "red")
boxplot(s256i$coords, main = "Boxplot of Coordinates", col = c("yellow", "orange"))
