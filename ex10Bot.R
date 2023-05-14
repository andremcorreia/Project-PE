mu0 <- 23.7
mu1 <- 25.1
sigma2 <- 4
sigma <- sqrt(sigma2)
n <- 44
m <- 300
alpha <- 0.04
set.seed(443)
p_values <- numeric(m)

for (i in 1:m) {
  sample <- rnorm(n, mean = mu1, sd = sigma)
  t_test <- t.test(sample, alternative = "two.sided", mu = mu0, conf.level = 1 - alpha)
  p_values[i] <- t_test$p.value
}
prop_nao_rejeitou_h0 <- sum(p_values > alpha) / m
cat(sprintf("A probabilidade estimada do teste conduzir à não rejeição de H0 é %.3f.", prop_nao_rejeitou_h0))
