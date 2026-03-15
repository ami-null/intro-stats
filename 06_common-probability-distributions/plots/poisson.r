x <- 0:20

pdf("poisson_shapes.pdf", width = 6.5, height = 3.5)

par(
    mfrow = c(1, 3),
    mar  = c(4.5, 3.1, 2, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2, 0.85, 0),
    cex = 0.75
)

lambda <- 1
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(1)",
     xlab = "x",
     ylab = "P(X = x)"
)

lambda <- 4
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(4)",
     xlab = "x",
     ylab = "P(X = x)"
)

lambda <- 10
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 2,
     main = "Poisson(10)",
     xlab = "x",
     ylab = "P(X = x)"
)

dev.off()
