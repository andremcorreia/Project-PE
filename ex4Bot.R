# 1. Definir a semente
set.seed(2315)

# 2. Gerar a amostra
lambda <- 10.5
k <- 1396
amostra <- rexp(n = k, rate = lambda)

# 3. Calcular a soma sucessiva das observações
s <- cumsum(amostra)

# 4. Encontrar T
T <- ceiling(s[k])

# 5. Dividir o intervalo (0, T] em intervalos de amplitude unitária
intervalos <- 1:T

# 6. Contabilizar o número de acontecimentos em cada subintervalo
contagem <- sapply(intervalos, function(x) sum(x <= s & s < x+1))

# 7. Calcular a média do número de acontecimentos por subintervalo
media_contagem <- mean(contagem)

# 8. Calcular o desvio absoluto entre a média e o valor esperado (teórico)
valor_esperado <- k / T
desvio_absoluto <- abs(media_contagem - valor_esperado)

# 9. Arredondar o desvio para 4 casas decimais
desvio_arredondado <- round(desvio_absoluto, 4)

# Exibir o desvio arredondado
desvio_arredondado

