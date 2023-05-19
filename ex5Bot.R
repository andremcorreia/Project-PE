set.seed(1294)  # fixa a semente aleatória
p <- 0.4        # parâmetro da distribuição geométrica
n <- 1058       # tamanho da amostra

#função de distribuição acumulada
FX <- function(x) 1 - (1-p)^(x+1)

#simula n valores da distribuição geométrica
amostra <- sapply(runif(n), function(u) floor(log(1-u)/log(1-p)))

#média e desvio padrão amostrais
media <- mean(amostra)
desvio <- sd(amostra)

#valores simulados superiores à média + desvio padrão amostrais
superiores <- amostra[amostra > media + desvio]

#proporção de valores simulados que são superiores à média + desvio padrão amostrais
proporcao <- length(superiores) / n

#apresenta o resultado com 4 casas decimais
round(proporcao, 4)
