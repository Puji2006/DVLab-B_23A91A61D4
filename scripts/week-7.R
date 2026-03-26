#Load and Understand the HairEyeColor Dataset
#Load Dataset
data(HairEyeColor)
#Check structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor
#very basic Mosaic plot(Base R)
mosaicplot(HairEyeColor)
#Add Titles and Colors
mosaicplot(HairEyeColor, main="Mosaic Plot: Hair, Eye Color and Sex",
           color = TRUE)
#two variable Mosaic plot
HairEye2D <- margin.table(HairEyeColor, c(1,2))
mosaicplot(HairEye2D, main="Hair vs Eye Color Mosaic Plot",
           color = TRUE)
#Mosaic Plots by Sex
par(mfrow = c(1,2))
mosaicplot(HairEyeColor[,,"Male"], main="Male", color=TRUE)
mosaicplot(HairEyeColor[,,"Female"], main="Female", color=TRUE)
par(mfrow=c(1,1))
#Custom Colors
mosaicplot(HairEye2D, col=c("brown","black","red","yellow"),
           main = "Hair vs Eye Color(Custom Colors)")
#Advanced Mosaic Plot using `vcd`
install.packages("vcd")
library(vcd)
mosaic(HairEyeColor, Shade=TRUE, legend=TRUE,
       main="Shaded Mosaic Plot(vcd)")
#Convert Dataset to Data Frame(For ggplot)
hair_eye_df <- as.data.frame(HairEyeColor)
head(hair_eye_df)
#ggplot Alternative(Proportional Mosaic-style plot)
library(ggplot2)
ggplot(hair_eye_df, aes(x=Hair,y=Freq, fill=Eye))+
  geom_bar(stat = "identity", position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proprotional Distribution of Eye Color by Hair",
    y = "Proportion")+
  theme_minimal()
#Advanced Mosaic with Residual shading)
mosaic(~Hair+Eye+Sex, data=hair_eye_df, shade=TRUE, legend=TRUE)

