#Bing Chilling
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
    se1 <- sqrt(p * (1 - p) / n)
    se2 <- sqrt(sample_mean * (1 - sample_mean) / n)
    ci1_length <- 2 * z * se1
    ci2_length <- 2 * z * se2
    diffs[j] <- ci2_length - ci1_length
  }
  mean_diffs[i] <- mean(diffs)
}

plot(n_values, mean_diffs, type = "b", xlab = "Sample size", ylab = "Mean difference in CI length")







#ChatGPT
# Set the seed
set.seed(1627)

# Define the parameters
p <- 0.8
gamma <- 0.98
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 3000

# Initialize a vector to store the average differences
mean_differences <- numeric(length(n_values))

# Perform the calculations for each value of n
for (i in 1:length(n_values)) {
  n <- n_values[i]
  differences <- numeric(k)
  
  # Generate k samples of size n from a Bernoulli distribution
  samples <- matrix(rbinom(k * n, size = 1, prob = p), nrow = k)
  
  for (j in 1:k) {
    sample <- samples[j, ]
    
    # Calculate the sample mean
    sample_mean <- mean(sample)
    
    # Calculate the standard deviation using Method 1
    std_dev1 <- sqrt(sample_mean * (1 - sample_mean) / n)
    
    # Calculate the standard deviation using Method 2
    std_dev2 <- sqrt((sample_mean * (1 - sample_mean)) / n)
    
    # Calculate the confidence intervals using Method 1
    z <- qnorm((1 + gamma) / 2)
    lower1 <- sample_mean - z * std_dev1
    upper1 <- sample_mean + z * std_dev1
    
    # Calculate the confidence intervals using Method 2
    lower2 <- sample_mean - z * std_dev2
    upper2 <- sample_mean + z * std_dev2
    
    # Calculate the difference in interval lengths
    difference <- upper2 - lower2 - (upper1 - lower1)
    differences[j] <- difference
  }
  
  # Calculate the average difference for this value of n
  mean_differences[i] <- mean(differences)
}

# Plot the variation of mean differences with sample size
plot(n_values, mean_differences, type = "b", xlab = "Sample Size (n)", ylab = "Mean Differences",
     main = "Comparison of Confidence Interval Methods", pch = 19)



#Poe
# Carregar pacotes
library(ggplot2)

# Definir semente
set.seed(1627)

# Parâmetros
p <- 0.8
gamma <- 0.98
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 3000

# Função para calcular o intervalo de confiança usando o Método 1
CI_method1 <- function(x, z) {
  mean_x <- mean(x)
  n <- length(x)
  a <- 1
  b <- -2 * mean_x
  c <- mean_x^2 - z^2 * (mean_x * (1 - mean_x)) / n
  roots <- sort(uniroot.all(function(P) P^2 + b * P + c, interval = c(0, 1)))
  return(c(roots[1], roots[2]))
}

# Função para calcular o intervalo de confiança usando o Método 2
CI_method2 <- function(x, z) {
  mean_x <- mean(x)
  n <- length(x)
  se <- sqrt((mean_x * (1 - mean_x)) / n)
  return(c(mean_x - z * se, mean_x + z * se))
}

# Função para gerar amostras e calcular as diferenças médias entre os intervalos de confiança
mean_diff_CI <- function(n) {
  diff_lengths <- numeric(k)
  z <- qnorm((1 + gamma) / 2)
  for (i in 1:k) {
    x <- rbinom(n, 1, p)
    ci1 <- CI_method1(x, z)
    ci2 <- CI_method2(x, z)
    diff_lengths[i] <- (ci2[2] - ci2[1]) - (ci1[2] - ci1[1])
  }
  return(mean(diff_lengths))
}

# Calcular diferenças médias para diferentes tamanhos de amostra
mean_diffs <- sapply(n_values, mean_diff_CI)

# Plotar gráfico das diferenças médias em função do tamanho da amostra
data <- data.frame(n_values, mean_diffs)
ggplot(data, aes(x = n_values, y = mean_diffs)) +
  geom_point() +
  geom_line() +
  labs(x = "Tamanho da amostra", y = "Diferença média entre os intervalos de confiança") +
  theme_minimal()

#Chat2
# Set the seed
set.seed(1627)

# Define the parameters
p <- 0.8
gamma <- 0.98
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 3000

# Initialize a vector to store the average differences
mean_differences <- numeric(length(n_values))

# Perform the calculations for each value of n
for (i in 1:length(n_values)) {
  n <- n_values[i]
  differences <- numeric(k)
  
  # Generate k samples of size n from a Bernoulli distribution
  samples <- matrix(rbinom(k * n, size = 1, prob = p), nrow = k)
  
  for (j in 1:k) {
    sample <- samples[j, ]
    
    # Calculate the sample mean
    sample_mean <- mean(sample)
    
    # Calculate the standard deviation using Method 1
    std_dev1 <- sqrt(sample_mean * (1 - sample_mean) / n)
    
    # Calculate the standard deviation using Method 2
    std_dev2 <- sqrt((sample_mean * (1 - sample_mean)) / n)
    
    # Calculate the confidence intervals using Method 1
    z <- qnorm((1 + gamma) / 2)
    lower1 <- sample_mean - z * std_dev1
    upper1 <- sample_mean + z * std_dev1
    
    # Calculate the confidence intervals using Method 2
    lower2 <- sample_mean - z * std_dev2
    upper2 <- sample_mean + z * std_dev2
    
    # Calculate the difference in upper and lower bounds
    difference <- (upper2 - lower2) - (upper1 - lower1)
    differences[j] <- difference
  }
  
  # Calculate the average difference for this value of n
  mean_differences[i] <- mean(differences)
}

# Plot the variation of mean differences with sample size
plot(n_values, mean_differences, type = "b", xlab = "Sample Size (n)", ylab = "Mean Differences",
     main = "Comparison of Confidence Interval Methods", pch = 19)

