# 1. Read the data file in R and remove all records referring to South Africa (incomplete data).
data <- read.csv("TIME_USE_24092022.csv", sep = ",")
data <- subset(data, País != "África do Sul")

# 2. In a single graph, create two boxplots that allow comparing the average daily times recorded for Men in two different occupations: Personal care and Unpaid work.
library(ggplot2)

# Filter data for Men and the two occupations
data_men <- subset(data, Sexo == "Homens" & (Ocupação == "Cuidados pessoais" | Ocupação == "Trabalho não remunerado"))

# Create boxplots
p <- ggplot(data_men, aes(x = Ocupação, y = Tempo)) +
  geom_boxplot() +
  ggtitle("Comparing average daily times for Men in Personal Care and Unpaid Work")

# Display plot
print(p)
