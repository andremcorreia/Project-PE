set.seed(1296)
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 3000
p <- 0.3
gamma <- 0.97
z <- qnorm((1 + gamma) / 2)

mean_diffs <- numeric(length(n_values))

for (i in seq_along(n_values)) {
  n <- n_values[i]
  diffs <- numeric(k)
  for (j in 1:k) {
    sample_x <- rbinom(n, size = 1, prob = p)
    sample_mean <- mean(sample_x)
    
    # Method 1
    a <- 1 + (z^2)/n
    b <- -2 * sample_mean - (z^2)/n
    mean_squared <- sample_mean^2
    roots <- (-b + c(-1, 1) * sqrt(b^2 - 4 * a * mean_squared)) / (2 * a)
    ci_1_length <- diff(roots)
    
    # Method 2
    ci_2_length <- diff(sample_mean + c(-1, 1) * z * sqrt(sample_mean * (1 - sample_mean) / n))
    diffs[j] <- ci_2_length - ci_1_length
  }
  mean_diffs[i] <- mean(diffs)
}

plot(n_values, mean_diffs, type = "b", xlab = "Sample size", ylab = "Mean difference in CI length")

