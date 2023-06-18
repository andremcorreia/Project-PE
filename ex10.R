# Definir parâmetros
null_value <- 23.7
mu <- 25.1
sigma <- sqrt(4)
n <- 44
m <- 300
alpha <- 0.04

# Definir semente
set.seed(443)

# Gerar m amostras e realizar o teste de hipóteses para cada amostra
not_rejected <- 0
for (i in 1:m) {
  sample <- rnorm(n, mean = mu, sd = sigma)
  x_bar <- mean(sample)
  z <- (x_bar - null_value) / (sigma / sqrt(n))
  p_value <- 2 * (1 - pnorm(abs(z)))
  
  # Verificar se a hipótese nula não foi rejeitada
  if (p_value > alpha) {
    not_rejected <- not_rejected + 1
  }
}

# Calcular a proporção de vezes que a hipótese nula não foi rejeitada
prob_not_rejected <- not_rejected / m
round(prob_not_rejected, 3)
