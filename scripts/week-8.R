#Load and understand the "matcars" Dataset
#Load dataset
data(mtcars)

#inspect Structure
str(mtcars)

#View first few rows
head(mtcars)

#Basic Heat Map(Base R)
heatmap(as.matrix(mtcars))

#improved Heat Map with labels
heatmap(as.matrix(mtcars), main = "Heatmap of matcars Dataset",
        Colv =NA,
        Rowv =NA)

#Heat Map witih Custom Colors
colors <- colorRampPalette(c("green","yellow","cyan"))(50)
heatmap(as.matrix(mtcars),col=colors,main="Custom Color Heatmap",
        Colv = NA,
        Rowv = NA)

#Correlation Heat map (base R)
corr_matrix <- cor(mtcars)
heatmap(corr_matrix,col=colorRampPalette(c("blue","maroon","pink"))(50),
        main="correlation Heatamap of mtcars",
        Colv = NA,
        Rowv = NA)

#ggplot2 Hea tMap (Basic)
library(reshape2)
mtcars$Car <- rownames(mtcars)
mtcars_long <- melt(mtcars, id.var="Car")
View(mtcars_long)

#Styled ggplot heat map
library(ggplot2)
ggplot(mtcars_long,aes(x=variable,y=Car,fill=value))+
  geom_tile() +
  scale_fill_gradient(low = "white",high = "red") +
  theme_minimal()+
  labs(title = "Heatmap of mtcars Dataset")

#Another way 
ggplot(mtcars_long,aes(variable,Car,fill=value))+
  geom_tile()+
  scale_fill_viridis_c()+
  theme_minimal()

#Correlation in Hearmap with ggplot2
corr_matrix <- cor(mtcars[,sapply(mtcars,is.numeric)])
corr_long <- melt(corr_matrix)
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  scale_fill_gradient2(low = "blue", mid="white",high="pink",midpoint=0)+
  theme_minimal()+
  labs(title="Correlation Heatmap of mtcars")

#Heat map with values displayes
ggplot(corr_long,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  geom_text(aes(label=round(value,2)))+
  scale_fill_gradient2(low = "blue",mid="white",high="maroon",midpoint=0)+
  theme_minimal()
#Advanced heatmap using pheatmap
install.packages("pheatmap")
library(pheatmap)
pheatmap(
  cor(mtcars[,sapply(mtcars,is.numeric)]),
  display_numbers=round(corr_matrix,2),
  main="Advanced Correlation Heatmap"
)

