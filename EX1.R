library(ggplot2)
library(readxl)

data <- read_excel("econ.xlsx")
data <- subset(data, as.Date(tempo, format = "%d/%m/%Y") >= as.Date("1998-01-01"))
data$gcp_z <- (data$gcp - mean(data$gcp)) / sd(data$gcp)
data$ndesemp_z <- (data$ndesemp - mean(data$ndesemp)) / sd(data$ndesemp)

ggplot(data, aes(x = tempo)) +
  geom_line(aes(y = gcp_z, color = "gcp")) +
  geom_line(aes(y = ndesemp_z, color = "ndesemp")) +
  scale_color_manual(name = "Variáveis", values = c("gcp" = "blue", "ndesemp" = "red")) +
  labs(x = "Tempo", y = "Valor") +
  ggtitle("Evolução gcp vs ndesemp desde 1998")

