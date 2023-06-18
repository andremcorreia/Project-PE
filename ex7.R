set.seed(1473) 

m <- 1621 
n <- 19 

ssq <- replicate(m, sum(rnorm(n, mean = 0, sd = 1)^2))

q1 <- quantile(ssq, probs = 0.3, type = 2)

q2 <- qchisq(0.3, df = n)

diff <- abs(q1 - q2)

round(diff, 4)

