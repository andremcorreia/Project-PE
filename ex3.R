# Importar libraries
library(ggplot2)
library(dplyr)

# Ler a data do ficheiro GENDER_EMP_19032023152556981.txt
data <- read.delim("GENDER_EMP_19032023152556091.txt", sep = "\t")

# Filtrar data para a variavel EMP3 entre homens e mulheres nos grupos etarios 15-24, 25-54 e 55-64 registados em 2010 na Suecia
sw_data <- data[data$Country == "Sweden" & data$TIME == "2010" & data$IND == "EMP3" & (data$Sex == "Men" | data$Sex == "Women") & (data$AGE == "1524" | data$AGE == "2554"| data$AGE == "5564"), ]

# Criar o grafico de barras pelo ggplot
ggplot(sw_data, aes(x = Age.Group, y = Value, fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Taxa de Desemprego na Suécia por sexo e faixa etária em 2010",
       x = "Faixa Etária",
       y = "Taxa de Desemprego (%)",
       fill = "Sexo")


