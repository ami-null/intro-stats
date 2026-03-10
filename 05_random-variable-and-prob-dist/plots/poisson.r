x <- 0:20

pdf("poisson_shapes.pdf", width = 6.5, height = 3.5)

par(mfrow = c(1, 3))

lambda <- 1
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(lambda = 1)",
     xlab = "x",
     ylab = "P(X = x)"
)

lambda <- 4
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(lambda = 4)",
     xlab = "x",
     ylab = "P(X = x)"
)

lambda <- 10
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(lambda = 10)",
     xlab = "x",
     ylab = "P(X = x)"
)

dev.off()
