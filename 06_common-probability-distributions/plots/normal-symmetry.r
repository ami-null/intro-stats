pdf("normal_symmetry.pdf", width = 3, height = 2.75)

par(
    mar  = c(3.4, 3.4, 1, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)

x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

a <- -1
b <- 1


# ---- P(Z < a or Z > b)
plot(
    x, y,
    type = "l",
    lwd = 2,
    xlab = "z",
    ylab = "Density"#,
    # main = expression(P(Z < a ~or~ Z > b))
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

text(a-0.18, 0.01, "-1", pos = 4)
text(b+0.18, 0.01, "1", pos = 2)

dev.off()
