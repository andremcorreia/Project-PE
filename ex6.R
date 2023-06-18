benford_prob <- function(x) {
  log10(1 + 1/x)
}

prob_5_or_7 <- benford_prob(5) + benford_prob(7)

count_5_or_7 <- 0
for (i in 3:30) {
  first_digit <- as.numeric(substr(as.character(2^i), 1, 1))
  if (first_digit == 5 || first_digit == 7) {
    count_5_or_7 <- count_5_or_7 + 1
  }
}
fraction_5_or_7 <- count_5_or_7 / (30 - 3 + 1)

abs_difference <- abs(prob_5_or_7 - fraction_5_or_7)

rounded_abs_difference <- round(abs_difference, 4)

cat("1. Probability of x being equal to 5 or 7: ", prob_5_or_7, "\n")
cat("2. Fraction of powers of two with the first digit being 5 or 7: ", fraction_5_or_7, "\n")
cat("3. Absolute difference between the values: ", abs_difference, "\n")
cat("4. Rounded absolute difference: ", rounded_abs_difference, "\n")
