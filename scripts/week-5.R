#Week 5a
#Load the data
data(iris)

#Understand the data
str(iris)
View(iris)

#Basic Scatter Plot: sepal length vs sepal width
plot(iris$Sepal.Length,iris$Sepal.Width)
#Labeled scatter plot
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  main = "Sepal Length vs Sepal Width",
  xlab = "Sepal Length (cm)",
  ylab = "Sepal Width (cm)",
  col = "blue",
  pch = 16
)

#Colored scatter plot by species
plot(iris$Sepal.Length,
     iris$Sepal.Width,
     col = as.numeric(iris$Species),
     pch = 16,
     main = "Sepal Dimensions by species")

legend(
  "topright",
  legend=levels(iris$Species),
  col=1:3,
  pch = 16
)

#Multi variates scatter
#Add size as a third variable
plot(iris$Sepal.Length,
     iris$Sepal.Width,
     col = as.numeric(iris$Species),
     pch = 16,
     cex = iris$Petal.Length/max(iris$Petal.Length),
     main = "Multivariate scatter plot(Color+size)"
)

#Scatter plot matrix
#All numeric variables against each other
pairs(
  iris[,1:4],
  col = as.numeric(iris$Species),
  pch = 16,
  main = "Scatter plot matrix of iris dataset"
)

#GGPlot 2
# Load ggplot2
library(ggplot2)
# Basic Scatter Plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
# Colored Scatter by Species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color =
                   Species)) +
  geom_point(size = 2) +
  theme_minimal()
# Multivariate Scatter Plot
# Color + Size encoding
ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Sepal.Width,
    color = Species,
    size = Petal.Length
  )
) +
  geom_point(alpha = 0.7) +
  theme_minimal()
# Faceted Scatter Plot
# One scatter plot per species
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = "steelblue") +
  facet_wrap(~Species) +
  theme_minimal()
# Scatter Plot Matrix
# Using GGally (extension of ggplot2)
install.packages('GGally')
library(GGally)
ggpairs(
  iris,
  columns = 1:4,
  aes(color = Species, alpha = 0.6)
)