#load& understand the dataset
data(diamonds)
data(package = .packages(all.available = TRUE))
library(ggplot2)
data(diamonds)
str(diamonds)
dim(diamonds)
?diamonds
View(diamonds)

#Very Basic Scatter
plot(diamonds$carat,diamonds$price)

#improved scatter
plot(diamonds$carat, diamonds$price,col = rgb(0,0,1,0,1),pch=16, main = "Scatter Plot: Carat vs Price")

#Hexabin using base R
install.packages('hexbin')
library(hexbin)
hb<- hexbin(diamonds$carat,diamonds$price, xbins = 40)
plot(hb,main="Hexbin Plot")

#Basic Hexbin
ggplot(diamonds,aes(x=carat, y = price))+
  geom_hex()
#labled Hexbin plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs(title="Hexagon Binning: Diamond Structure",x = "carat",y="price")+
  theme_minimal()

#Control Hexagon density
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="lightblue",high= "black")+
  theme_minimal()
#Color meaning:
#-light _ fewer diamonds
#-Dark- dense region
#Professional palette(viridis)

ggplot(diamonds,aes(carat,price))+geom_hex(bins=35)+scale_fill_viridis_c()+
  theme_minimal()

#ADD legend title
ggplot(diamonds,aes(carat,price))+geom_hex(bins=20)+
  scale_fill_viridis_c(name="Count")+
  labs(title = "Density Structure of Diamonds", x="Carat", y ="Price")+
  theme_minimal()
#Facted Hexbin
ggplot(diamonds,aes(carat,price))+geom_hex()+scale_fill_viridis_c()+
  facet_wrap(~cut)+
  theme_minimal()

#Log Scale Hexbin

ggplot(diamonds,aes(carat,price))+geom_hex()+scale_fill_viridis_c()+
  scale_y_log10()+
  theme_minimal()
