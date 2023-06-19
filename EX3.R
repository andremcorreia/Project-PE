library(ggplot2)
library(dplyr)

data <- read.delim("GENDER_EMP_19032023152556091.txt", sep = "\t")
sw_data <- data[data$Country == "Sweden" & data$TIME == "2010" & data$IND == "EMP3" & (data$Sex == "Men" | data$Sex == "Women") & (data$AGE == "1524" | data$AGE == "2554"| data$AGE == "5564"), ]

ggplot(sw_data, aes(x = Age.Group, y = Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Unemployment Rate in Sweden by sex and age in 2010",
       x = "Age",
       y = "Unemployment Rate (%)",
       fill = "Sex")
