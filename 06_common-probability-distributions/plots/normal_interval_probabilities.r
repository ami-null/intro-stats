pdf("normal_interval_probabilities.pdf", width = 6.5, height = 3.5)

par(mfrow = c(1, 2))

x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

a <- -1
b <- 1

# ---- P(a < Z < b)
plot(
    x, y,
    type = "l",
    lwd = 2,
    xlab = "z",
    ylab = "Density",
    main = expression(paste("P(", a, " < Z < ", b, ")"))
)

# curve(
#     dnorm(x),
#     from = -4,
#     to = 4,
#     type = "l",
#     lwd = 2,
#     xlab = "z",
#     ylab = "Density",
#     main = expression(paste("P(", a, " < Z < ", b, ")"))
# )

x_fill <- seq(a, b, length = 500)
y_fill <- dnorm(x_fill)

polygon(
    c(a, x_fill, b),
    c(0, y_fill, 0),
    density = 20
)

abline(v = a, lty = 2)
abline(v = b, lty = 2)

text(a+.18, 0.02, "a", pos = 2)
text(b-.18, 0.02, "b", pos = 4)


# ---- P(Z < a or Z > b)
plot(
    x, y,
    type = "l",
    lwd = 2,
    xlab = "z",
    ylab = "Density",
    main = expression(P(Z < a ~or~ Z > b))
)

# left tail
x_left <- seq(-4, a, length = 500)
y_left <- dnorm(x_left)

polygon(
    c(-4, x_left, a),
    c(0, y_left, 0),
    density = 20
)

# right tail
x_right <- seq(b, 4, length = 500)
y_right <- dnorm(x_right)

polygon(
    c(b, x_right, 4),
    c(0, y_right, 0),
    density = 20
)

abline(v = a, lty = 2)
abline(v = b, lty = 2)

text(a-0.18, 0.02, "a", pos = 4)
text(b+0.18, 0.02, "b", pos = 2)

dev.off()
