# Importar bibliotecas
library(ggplot2)
library(readxl)

# Ler data do ficheiro econ.xlsx 
data <- read_excel("econ.xlsx")

# Selecionar a data a utilizar
data <- subset(data, as.Date(tempo, format = "%d/%m/%Y") >= as.Date("1998-01-01"))

# Transform the data associated with each variable
data$gcp_z <- (data$gcp - mean(data$gcp)) / sd(data$gcp)
data$ndesemp_z <- (data$ndesemp - mean(data$ndesemp)) / sd(data$ndesemp)

# Criar o plot atraves do ggplot
ggplot(data, aes(x = tempo)) +
  geom_line(aes(y = gcp_z, color = "gcp")) +
  geom_line(aes(y = ndesemp_z, color = "ndesemp")) +
  scale_color_manual(name = "Variáveis", values = c("gcp" = "blue", "ndesemp" = "red")) +
  labs(x = "Tempo", y = "Z-score") +
  ggtitle("Evolução gcp vs ndesemp ao longo do tempo")

