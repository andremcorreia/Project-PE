library(ggplot2)
library(readxl)

# Read the data from the econ.xlsx file
data <- read_excel("econ.xlsx")

# Select the data to use
data <- subset(data, as.Date(tempo, format = "%d/%m/%Y") >= as.Date("1998-01-01"))

# Transform the data associated with each variable
data$gcp_z <- (data$gcp - mean(data$gcp)) / sd(data$gcp)
data$ndesemp_z <- (data$ndesemp - mean(data$ndesemp)) / sd(data$ndesemp)

# Create a plot using ggplot
ggplot(data, aes(x = tempo)) +
  geom_line(aes(y = gcp_z, color = "gcp")) +
  geom_line(aes(y = ndesemp_z, color = "ndesemp")) +
  scale_color_manual(name = "Variable", values = c("gcp" = "blue", "ndesemp" = "red")) +
  labs(x = "Time", y = "Z-score") +
  ggtitle("Evolution of gcp and ndesemp over time")

