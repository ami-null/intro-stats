x <- seq(0, 6, length.out = 500)

pdf("exponential_shapes.pdf", width = 6.5, height = 3.5)

par(mfrow = c(1, 3))

lambda <- 0.5
y <- dexp(x, lambda)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Exponential(0.5)",
    xlab = "x",
    ylab = "f(x)"
)

lambda <- 1
y <- dexp(x, lambda)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Exponential(1)",
    xlab = "x",
    ylab = "f(x)"
)

lambda <- 2
y <- dexp(x, lambda)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Exponential(2)",
    xlab = "x",
    ylab = "f(x)"
)

dev.off()
