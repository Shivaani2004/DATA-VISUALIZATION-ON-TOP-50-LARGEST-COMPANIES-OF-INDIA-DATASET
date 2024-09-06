setwd("E:/projects/micro project")
getwd()
data = read.csv("companies.csv")
data
summary(data)
str(data)
# Check for missing values in x and y
if (any(is.na(data$Profit)) || any(is.na(data$Value))) {
  # Handle missing values here, such as removing or imputing them
  data <- na.omit(data)  # Remove rows with missing values
}

# Create the plot
plot(data$Profit, data$Value, xlab = "Profit", ylab = "Value(in US billions)", col = "red")
library(ggplot2)
library(tidyr)
library(dplyr)
#custom_colors <- scale_color_gradientn(colors = c("blue", "green", "red"),
                                      # values = scales::rescale(c(0, mean(data$Assets), max(data$Assets))),
                                       #name = "Assets")



                                   # scatter Graph 
ggplot(data, aes(Profit,Value,color= Assets)) +
  geom_point(size = 2) +
  geom_jitter(width = 0.6, alpha = 0.5) +
  #custom_colors +
  scale_color_gradient(low = "blue" ,high = "orange") +     # Specify your color range
  labs(title = "50 largest companies of India", x = "Profit", y = "Value (in US billions)")




                                  # line Graph
ggplot(data, aes(x = Profit, y = Value, color = Assets)) +
  geom_line() +
scale_color_gradient(low = "blue" ,high = "pink") +                      # Specify your color range
    labs(title = "50 largest companies of India", x = "Profit", y = "Value (in US billions)")
                                   

                                



                                   # Bar Graph

ggplot(data, aes(x = Rank, y = Profit, fill = Profit)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Rank", y = "Profit",title ="Top 50 Largest companies of India")





                                   #BOXplot 

ggplot(data, aes(x = Profit, y = Value, fill = Assets)) +
  geom_boxplot(fill = "cyan", alpha = 0.5) +
  theme_bw() +
  labs(title = "50 Largest companies of India", x = "Profit", y = "Value of company, US Billion" ,fill ="Transmissions")




                                  #Histograph 
#hist(data$Value , xlab ="Value",main =" Histogram for Value" , col ="yellow")
ggplot(data, aes(x = Value)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Histogram Example", x = "Value", y = "Frequency")
