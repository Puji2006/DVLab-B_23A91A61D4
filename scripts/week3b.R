# Load dataset
data(airquality)

# Inspect the data
head(airquality)
str(airquality)
View(airquality)
class(airquality)

# Remove NA values from Ozone
ozone_clean <- na.omit(airquality$Ozone)

# 1. Very Basic Bar Chart (Ozone values)
barplot(ozone_clean)

# 2. Bar Chart from Aggregated Data
# Mean Ozone per Month
mean_ozone <- tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE)
mean_ozone

barplot(
  mean_ozone,
  col = "orange",
  main = "Average Monthly Ozone Concentration",
  xlab = "Month",
  ylab = "Mean Ozone (ppb)"
)

# 3. Grouped (Clustered) Bar Chart
# Compare Ozone and Solar Radiation (mean per month)

group_means <- rbind(
  Ozone = tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE),
  Solar_R = tapply(airquality$Solar.R, airquality$Month, mean, na.rm = TRUE)
)

group_means

barplot(
  group_means,
  beside = TRUE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Grouped Bar Chart: Ozone vs Solar Radiation"
)

# 4. Stacked Bar Chart
barplot(
  group_means,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Ozone vs Solar Radiation"
)