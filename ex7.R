set.seed(1473) # fixar a semente

m <- 1621 # número de amostras
n <- 19 # tamanho da amostra

# gerar as amostras e calcular as somas dos quadrados
ssq <- replicate(m, sum(rnorm(n, mean = 0, sd = 1)^2))

# calcular o quantil de probabilidade 0.3 da amostra das somas dos quadrados
q1 <- quantile(ssq, probs = 0.3, type = 2)

# calcular o quantil correspondente à distribuição teórica
q2 <- qchisq(0.3, df = n)

# calcular a diferença em valor absoluto entre os dois quantis
diff <- abs(q1 - q2)

# arredondar o resultado para 4 casas decimais
round(diff, 4)

