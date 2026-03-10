x <- seq(-6, 6, length.out = 500)

pdf("normal_shapes.pdf", width = 7.5, height = 3.5)

par(mfrow = c(1, 3))

mu <- 0
sigma <- 1
y <- dnorm(x, mu, sigma)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Normal(0, 1)",
    xlab = "x",
    ylab = "f(x)"
)

mu <- 0
sigma <- 2
y <- dnorm(x, mu, sigma)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Normal(0, 2)",
    xlab = "x",
    ylab = "f(x)"
)

mu <- 2
sigma <- 1
y <- dnorm(x, mu, sigma)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Normal(2, 1)",
    xlab = "x",
    ylab = "f(x)"
)

dev.off()
