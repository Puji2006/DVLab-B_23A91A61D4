data(iris)

?iris
## Inspect the data
head(iris)
str(iris)
View(iris)
class(iris)


#Very Basic Bar Chart(chart R)
#Count of each species

barplot(table(iris$species))

# Labelled bar chart 
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Flowers",
  col = "lightblue"
)

#Bar chart from aggregated data
#mean sepal length per species
mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)
mean_sepal

barplot(
  mean_sepal,
  col = "violet",
  main = "Average sepal Length by Species",
  ylab = "Mean Sepal Length"
)

#Grouped (CLUSTERED) BAR CHART 

#compare sepal and petal length(mean)

group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species,mean),
  Petal = tapply(iris$Petal.Length, iris$Species,mean)
)+
  group_means

group_means <- rbind(
  Sepal_l = tapply(iris$Sepal.Length, iris$Species,mean),
  Sepal_w = tapply(iris$Sepal.Width, iris$Species,mean),
  Petal_l = tapply(iris$Petal.Length, iris$Species,mean),
  Petal_w = tapply(iris$Petal.Width, iris$Species,mean)
  
)
group_means
barplot(
  group_means,
  beside = TRUE,
  col = c("skyblue","pink"),
  legand.text = TRUE,
  main = "Grouped Bar Chart: Sepal vs Petal Length"
)


#Stacked bar chart 

barplot(
  group_means,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Length"
)