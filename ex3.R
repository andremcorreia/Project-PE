library(ggplot2)
library(dplyr)

# Load data
data <- read.delim("GENDER_EMP_19032023152556091.txt", sep = "\t")

# Filter data for Sweden, year 2000, and variable EMP
sw_data <- data[data$Country == "Sweden" & data$TIME == "2010" & data$IND == "EMP3" & (data$Sex == "Men" | data$Sex == "Women") & (data$AGE == "1524" | data$AGE == "2554"| data$AGE == "5564"), ]

# Create bar chart
ggplot(sw_data, aes(x = Age.Group, y = Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Unemployment rate in Sweden by sex and age group in 2000",
       x = "Age Group",
       y = "Unemployment Rate (%)",
       fill = "Sex")


