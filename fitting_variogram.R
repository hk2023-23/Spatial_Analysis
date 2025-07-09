library(geoR)

# Find X coordinate of point with smallest data value
smallest_value_index <- which.min(s256i$data)
x_coord <- s256i$coords[smallest_value_index, 1]
print(x_coord)

# Sample variogram
sample_variogram <- variog(s256i, max.dist = 1, uvec = seq(0, 1, length.out = 11))
plot(sample_variogram, main = "Sample Variogram")

# Fit spherical variogram using OLS
ols_fit <- variofit(sample_variogram, ini.cov.pars = c(1, 0.5), nugget = 0.5,
                    cov.model = "spherical", weights = "npairs")

# Fit using MLE
mle_fit <- variofit(sample_variogram, ini.cov.pars = c(1, 0.5), nugget = 0.5,
                    cov.model = "spherical", weights = "npairs",
                    minimisation.function = "optim")

# Plot both fits
plot(sample_variogram, main = "Fitted Variograms")
lines(ols_fit, col = "blue", lwd = 2)
lines(mle_fit, col = "red", lwd = 2)
legend("topright", legend = c("OLS Fit", "MLE Fit"), col = c("blue", "red"), lty = 1, lwd = 2)
