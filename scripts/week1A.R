#Accessing the infoanout the dataset
VADeaths

#Checking the type of dataset
class(VADeaths)

#accessing help for unknown functions or classes
help(class)

#Coverting the given datset into data frame
va_df <- as.data.frame(VADeaths)

#Checking to confirm if the dataset changed to dataframe
class(va_df)

#Creating view of dataset into a table
View(va_df)

#Creating a newcolumn in the dataframe
va_df$AgeGroups <- row.names(VADeaths)

#changing the data into 'long' format using 'reshape' function
va_long = reshape(va_df,
                  direction = "long",
                  varying = colnames(VADeaths),
                  v.names = "DeathRate",
                  timevar = "Population",
                  times = colnames(VADeaths)
)
View(va_long)

hist(va_long$DeathRate)
#Changing the title,labels,color,bins
hist(va_long$DeathRate,
     breaks=5,
     main= "Basic Histogram of VA Deaths",
     xlab= "VA DeathsRates",
     ylab= "Frequency",
     labels=TRUE,
     col = "pink",
     border = "red")

library(ggplot2)
ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(bins = 10,fill = "pink", col = "red")+
  labs(
    title= "GGPLOT- Histogram",
    x = "Death Rate",
    y = "Frequency"
  )+
  #facet_wrap
  theme_minimal()