library(sp)

# Convert to data frame and clean
df <- data.frame(s256i$coords, data = s256i$data)
df <- df[complete.cases(df), ]

# Convert to SpatialPointsDataFrame
spatial_df <- SpatialPointsDataFrame(coords = df[, 1:2], data = data.frame(data = df$data))

# Fit anisotropic model
anisotropic_fit <- likfit(geodata = s256i,
                          coords = coordinates(spatial_df),
                          data = spatial_df$data,
                          ini.cov.pars = c(1, 0.5),
                          nug = 0.05)
print(anisotropic_fit)
