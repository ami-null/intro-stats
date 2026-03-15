pdf("binomial-shape.pdf", width = 6.5, height = 3.5)

n <- 20
x <- 0:n

par(
    mfrow = c(1, 3),
    mar  = c(4.5, 3.1, 2, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2, 0.85, 0),
    cex = 0.75
)

p <- 0.2
y <- dbinom(x, size = n, prob = p)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Binomial(n = 20, p = 0.2)",
     xlab = "x",
     ylab = "P(X = x)")

p <- 0.5
y <- dbinom(x, size = n, prob = p)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Binomial(n = 20, p = 0.5)",
     xlab = "x",
     ylab = "P(X = x)")

p <- 0.8
y <- dbinom(x, size = n, prob = p)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Binomial(n = 20, p = 0.8)",
     xlab = "x",
     ylab = "P(X = x)")

dev.off()
