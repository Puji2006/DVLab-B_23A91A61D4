?AirPassengers
class(AirPassengers)
View(AirPassengers)
ap_df <- data.frame(
  year = time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)
ap_df

ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)
ap_df_months
plot(AirPassengers)
#help(plot)
#?plot
plot(AirPassengers,
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col="blue",
)
#changing line width
plot(AirPassengers,
     type = 'l',
     lwd = 2,
     main = "Air Passengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col="blue",
)
grid()
#changing point color
points(AirPassengers,
       type = 'o',
       pch  = 18,
       col = "skyblue"
)
grid()

library(ggplot2)
ggplot(
  ap_df,
  aes(x=year, y=passengers)
)+
  geom_line(col="navyblue",linewidth = 0.5)+
  labs(
    title="Trend Analysis of Air Passengers",
    caption = "Using Air Passengers Dataset",
    subtitle = "From 1949-1960",
    x = "Months",
    y = "No.of Passengers"
  )+
  geom_point(color = 'red')+
  geom_smooth(se = FALSE, color = "black")
theme_minimal()