library(ggplot2)

set.seed(1637)

n <- 141
location <- 1.2
scale <- 1.6

sampleCauchy <- rcauchy(n, location, scale)
sampleSorted <- sort(sampleCauchy)

quantiles <- (1:n) / (n + 1)
cauchyQuantiles <- qcauchy(quantiles, location, scale)
normalQuantiles <- qnorm(quantiles, mean = 2.2, sd = sqrt(3.6))

df <- data.frame(sampleSorted, cauchyQuantiles, normalQuantiles)
ggplot(df, aes(x = sampleSorted)) +
  geom_point(aes(y = normalQuantiles, color = "Normal"), size = 3, shape = 1) +
  geom_point(aes(y = cauchyQuantiles, color = "Cauchy"), size = 3, shape = 1) +
  scale_color_manual(name = "Variáveis", values = c("Cauchy" = "blue", "Normal" = "red")) +
  geom_abline(intercept = 0, slope = 1, color = "green", linetype = "dashed") +
  labs(y = "Quantis de probabilidade",
       x = "Valores gerados ordenados",
       title = "Comparação entre distribuições Cauchy e Normal") +
  theme_minimal() + xlim(-30, 30) + ylim(-30, 30)
  
  




