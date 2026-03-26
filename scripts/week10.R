#Load and understand the dataset
data(iris)
str(iris)
#Basic 3D scatter plot(scatterplot3d)
#install necessary packages
install.packages("scatterplot3d")
library(scatterplot3d)
#Basic 3D plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Sepal.Length
)
#Labeled 3D scatter plot
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Sepal.Length,
  main = "3D Scatter Plot of Iris Data",
  xlab = "Sepal Length",
  ylab = "Sepal Width",
  zlab = "Sepal Length",
  pch = 16
)
#colored 3D scatter plot by species
colors <- as.numeric(iris$Species)
scatterplot3d(
  iris$Sepal.Length,
  iris$Sepal.Width,
  iris$Sepal.Length,
  color = colors,
  pch = 16,
  main = "3D Scatter Plot by Species"
)
legend(
  "topright",
  legend = levels(iris$Species),
  col = 1:3,
  pch = 16
)
#3D plot using 'cloud()' (lattice)
#Load lattice package
library(lattice)
#Basic 3D cloud plot
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data=iris
)
#colored cloud plot
cloud(
  Petal.Length ~ Sepal.Length * Sepal.Width,
  data = iris,
  groups = Species,
  auto.key = TRUE,
  main = "3D Cloud Plot of Iris Data"
)
#Multi-panel scatter using 'xyplot()'
#Although 'xyplot()' is not true 3D, it allows multi-dimensional comparison
xyplot(
  Petal.Length ~ Sepal.Length | Species,
  data = iris,
  pch = 16,
  color = "blue",
  layout = c(3,1)
)
#Interactive 3D plot using Plotly (Adavnced)
#Install plotly
install.packages("plotly")
library(plotly)
#Interactive 3D scatter
plot_ly(
  iris,
  x= ~Sepal.Length,
  y= ~Sepal.Width,
  z= ~Petal.Length,
  color = ~Species,
  type = "scatter3d",
  mode = "markers"
)
#3D plot with size encoding
plot_ly(
  iris,
  x= ~Sepal.Length,
  y= ~Sepal.Width,
  z= ~Petal.Length,
  color = ~Species,
  size = ~Petal.Width,
  type = "scatter3d",
  mode = "markers"
)

