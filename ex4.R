set.seed(2315)
k <- 1396
lambda <- 10.5
x <- rexp(k, lambda)
s <- cumsum(x)
T <- ceiling(s[k])
mean_num_events <- k / T
expected_num_events <- lambda
abs_deviation <- abs(mean_num_events - expected_num_events)
round(abs_deviation, 4)

