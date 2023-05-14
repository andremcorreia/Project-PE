# Function to calculate the probability based on Benford's Law
benford_prob <- function(x) {
  log10(1 + 1/x)
}

# 1. Calculate the probability of x being equal to 5 or 7
prob_5_or_7 <- benford_prob(5) + benford_prob(7)

# 2. Count powers of two in the range [2^3, 2^30] with the first digit being 5 or 7
count_5_or_7 <- 0
for (i in 3:30) {
  first_digit <- as.numeric(substr(as.character(2^i), 1, 1))
  if (first_digit == 5 || first_digit == 7) {
    count_5_or_7 <- count_5_or_7 + 1
  }
}
fraction_5_or_7 <- count_5_or_7 / (30 - 3 + 1)

# 3. Calculate the absolute difference between the values obtained in steps 1 and 2
abs_difference <- abs(prob_5_or_7 - fraction_5_or_7)

# 4. Round the absolute difference to 4 decimal places
rounded_abs_difference <- round(abs_difference, 4)

# Print the results
cat("1. Probability of x being equal to 5 or 7: ", prob_5_or_7, "\n")
cat("2. Fraction of powers of two with the first digit being 5 or 7: ", fraction_5_or_7, "\n")
cat("3. Absolute difference between the values: ", abs_difference, "\n")
cat("4. Rounded absolute difference: ", rounded_abs_difference, "\n")
