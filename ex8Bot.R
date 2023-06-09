library(ggplot2)
set.seed(1693)
n <- 101
location <- -3.2
scale <- 2
cauchy_sample <- rcauchy(n, location = location, scale = scale)


quantiles <- (1:n) / (n + 1)

cauchy_quantiles <- qcauchy(quantiles, location = location, scale = scale)

normal_mean <- 0.6
normal_variance <- 2.4
normal_sd <- sqrt(normal_variance)
normal_quantiles <- qnorm(quantiles, mean = normal_mean, sd = normal_sd)


ordered_sample <- sort(cauchy_sample)

data <- data.frame(ordered_sample, cauchy_quantiles, normal_quantiles)


ggplot(data) +
  geom_point(aes(x = ordered_sample, y = cauchy_quantiles), color = "blue", alpha = 0.5) +
  geom_point(aes(x = ordered_sample, y = normal_quantiles), color = "red", alpha = 0.5) +
  geom_abline(intercept = 0, slope = 1, color = "black", linetype = "dashed") +
  labs(x = "Valores gerados ordenados",
       y = "Quantis de probabilidade",
       title = "Gráfico de quantis",
       subtitle = "Distribuição de Cauchy (azul) vs Distribuição Normal (vermelho)") +
  theme_minimal()



#Bing Chilling
set.seed(1637)
n <- 141
x <- sort(rcauchy(n, location = 1.2, scale = 1.6))
p <- (1:n)/(n + 1)
y <- qcauchy(p, location = 1.2, scale = 1.6)
z <- qnorm(p, mean = 2.2, sd = sqrt(3.6))

plot(x, y, col = "red", xlab = "Generated values", ylab = "Quantiles", main = "Cauchy vs Normal")
points(x, z, col = "blue")
abline(0, 1)
legend("topleft", legend = c("Cauchy", "Normal"), col = c("red", "blue"), pch = 1)



#Poeeeeeee

# Instale e carregue o pacote ggplot2
library(ggplot2)

# Defina a semente
set.seed(1693)

# Gere a amostra de Cauchy
n <- 101
location <- -3.2
scale <- 2
sample_cauchy <- rcauchy(n, location, scale)

# Ordene a amostra
sample_sorted <- sort(sample_cauchy)

# Calcule os quantis de probabilidade
quantiles <- (1:n) / (n + 1)
cauchy_quantiles <- qcauchy(quantiles, location, scale)
normal_quantiles <- qnorm(quantiles, mean = 0.6, sd = sqrt(2.4))

# Crie o gráfico
df <- data.frame(sample_sorted, cauchy_quantiles, normal_quantiles)
ggplot(df, aes(x = sample_sorted)) +
  geom_point(aes(y = cauchy_quantiles), color = "blue", size = 3, shape = 1) +
  geom_point(aes(y = normal_quantiles), color = "red", size = 3, shape = 1) +
  geom_abline(intercept = 0, slope = 1, color = "green", linetype = "dashed") +
  labs(x = "Valores gerados ordenados",
       y = "Quantis de probabilidade",
       title = "Comparação entre distribuições Cauchy e Normal") +
  theme_minimal()

