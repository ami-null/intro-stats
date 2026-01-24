# curve(
#     dlnorm(x, meanlog = 0, sdlog = 1),
#     from = 0,
#     to = 10,
#     lwd = 2,
#     xlab = "x",
#     ylab = "Density",
#     main = "Right-Skewed Distribution"
# )

# curve(
#     dlnorm(10 - x, meanlog = 0, sdlog = 0.6),
#     from = 0,
#     to = 10,
#     lwd = 2,
#     xlab = "x",
#     ylab = "Density",
#     main = "Left-Skewed Distribution"
# )

pdf("symmetric.pdf", width = 6, height = 4)
curve(
    dnorm(x),
    from = -3.5,
    to =3.5,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    # main = "Symmetric Distribution",
    bty = "l"
)
dev.off()


pdf("right-skewed.pdf", width = 6, height = 4)
curve(
    dgamma(x, shape = 2.75, scale = 1),
    from = 0,
    to = 10,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    # main = "Right-Skewed Distribution",
    bty = "l"
)
dev.off()


pdf("left-skewed.pdf", width = 6, height = 4)
curve(
    dbeta(x, shape1 = 5, shape2 = 2.25),
    from = 0,
    to = 1,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    # main = "Left-Skewed Distribution",
    bty = "l"
)
dev.off()
