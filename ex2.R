library(ggplot2)

data <- read.csv("TIME_USE_24092022.csv", sep = ",")
data <- subset(data, País != "África do Sul")
data_men <- subset(data, Sexo == "Homens" & (Ocupação == "Cuidados pessoais" | Ocupação == "Trabalho não remunerado"))

ggplot(data_men, aes(x = Ocupação, y = Tempo)) +
  geom_boxplot() +
  ggtitle("Tempo médio diário em minutos para Homens para cada ocupação")
