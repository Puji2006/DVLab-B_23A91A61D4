# Load dataset (already available in base R)
data("airquality")

# View first few rows
head(airquality)

# Check structure
str(airquality)

# Summary statistics
summary(airquality)

# Create boxplot for all numeric variables
boxplot(airquality,
        main = "Boxplot of Air Quality Parameters",
        col = "lightblue",
        las = 2)

# Select important air quality parameters
boxplot(airquality[, c("Ozone", "Solar.R", "Wind", "Temp")],
        main = "Boxplot of Air Quality Parameters",
        col = c("orange", "yellow", "lightgreen", "pink"),
        ylab = "Values",
        las = 2)

# Remove missing values
airquality_clean <- na.omit(airquality)

# Boxplot after removing NA
boxplot(airquality_clean[, c("Ozone", "Solar.R", "Wind", "Temp")],
        main = "Boxplot of Air Quality Parameters (NA Removed)",
        col = c("orange", "yellow", "lightgreen", "pink"),
        ylab = "Values",
        las = 2)

# Install reshape2 (if not installed)
install.packages("reshape2")

# Load the package
library(reshape2)

# Convert data to long format
air_long <- melt(airquality, id.vars = c("Month", "Day"))

# Load ggplot2
library(ggplot2)

# Create boxplot
ggplot(air_long, aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Air Quality Parameters Boxplot",
       x = "Parameter",
       y = "Value")