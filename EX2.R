# Ler a data do ficheiro TIME_USE_24092022.csv e remover os registos referentes a Africa do Sul (dados incompletos)
data <- read.csv("TIME_USE_24092022.csv", sep = ",")
data <- subset(data, País != "África do Sul")

# Importar library
library(ggplot2)

# Filtrar a data por Homens e pelas ocupacoes Cuidados pessoais e Trabalho nao remunerado
data_men <- subset(data, Sexo == "Homens" & (Ocupação == "Cuidados pessoais" | Ocupação == "Trabalho não remunerado"))

# Criar dois boxplots que permitam comparar os tempos medios diarios registados para homens nas duas diferentes ocupacoes
p <- ggplot(data_men, aes(x = Ocupação, y = Tempo)) +
  geom_boxplot() +
  ggtitle("Tempo médio diário para Homens para cada ocupação")

# Display plot
print(p)
