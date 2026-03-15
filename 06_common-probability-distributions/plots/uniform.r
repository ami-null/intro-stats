x <- seq(0, 10, length.out = 500)

pdf("uniform_shapes.pdf", width = 6.5, height = 3.5)

par(
    mfrow = c(1, 3),
    mar  = c(4.5, 3.1, 2, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2, 0.85, 0),
    cex = 0.75
)

a <- 1
b <- 3
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(1, 3)",
    xlab = "x",
    ylab = "f(x)",
    ylim = c(0, 0.5)

)

a <- 1
b <- 5
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(0, 5)",
    xlab = "x",
    ylab = "f(x)",
    ylim = c(0, 0.5)
)

a <- 2
b <- 8
y <- dunif(x, a, b)
plot(x, y,
    type = "l",
    lwd = 1,
    main = "Uniform(2, 8)",
    xlab = "x",
    ylab = "f(x)",
    ylim = c(0, 0.5)
)

dev.off()
