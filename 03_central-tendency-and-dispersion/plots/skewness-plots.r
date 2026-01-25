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
par(
    mar  = c(3.4, 3.4, 0.5, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
    # xaxs = "i",            # no extra x padding
    # yaxs = "i"             # no extra y padding
)

curve(
    dnorm(x),
    from = -3.5,
    to =3.5,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    bty = "l",
    cex.lab = 1.5,
    cex.axis = 1.5
)
dev.off()


pdf("right-skewed.pdf", width = 6, height = 4)
par(
    mar  = c(3.4, 3.4, 0.5, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
    # xaxs = "i",            # no extra x padding
    # yaxs = "i"             # no extra y padding
)
curve(
    dgamma(x, shape = 2.75, scale = 1),
    from = 0,
    to = 10,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    bty = "l",
    cex.lab = 1.5,
    cex.axis = 1.5
)
dev.off()


pdf("left-skewed.pdf", width = 6, height = 4)
par(
    mar  = c(3.4, 3.4, 0.5, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
    # xaxs = "s",            # no extra x padding
    # yaxs = "s"             # no extra y padding
)
curve(
    dbeta(x, shape1 = 5, shape2 = 2.25),
    from = 0,
    to = 1,
    lwd = 2,
    xlab = "X",
    ylab = "Density",
    bty = "l",
    cex.lab = 1.5,
    cex.axis = 1.5
)
dev.off()
