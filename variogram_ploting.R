library(gstat)

# Prepare data
df <- data.frame(x = s256i$coords[, 1], y = s256i$coords[, 2], data = s256i$data)

# Compute and plot 2D variogram
variogram_2d <- variogram(data ~ 1, locations = ~ x + y, cutoff = 1, width = 0.03, data = df)
plot(variogram_2d, main = "2D Variogram Plot")
