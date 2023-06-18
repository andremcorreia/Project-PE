set.seed(1126)
p <- 0.3
n <- 1041
u <- runif(n)
x <- floor(log(1-u)/log(1-p))-1
mean_x <- mean(x)
sd_x <- sd(x)
prop <- sum(x > mean_x + sd_x)/sum(x > mean_x)
round(prop, 4)

