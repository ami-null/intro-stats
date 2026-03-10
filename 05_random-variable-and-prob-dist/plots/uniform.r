x <- seq(0, 10, length.out = 500)

pdf("uniform_shapes.pdf", width = 6.5, height = 3.5)

par(mfrow = c(1, 3))

a <- 0
b <- 1
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(0, 1)",
    xlab = "x",
    ylab = "f(x)"
)

a <- 1
b <- 5
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(0, 5)",
    xlab = "x",
    ylab = "f(x)"
)

a <- 2
b <- 8
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(2, 8)",
    xlab = "x",
    ylab = "f(x)"
)

dev.off()
