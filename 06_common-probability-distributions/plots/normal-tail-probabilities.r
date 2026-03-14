pdf("normal_tail_probabilities.pdf", width = 6.5, height = 3.5)

par(mfrow = c(1, 2))

x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

z <- 1

# ---- P(Z < z)
plot(x, y,
    type = "l",
    lwd = 2,
    xlab = "z",
    ylab = "Density",
    main = expression(P(Z < z)))

x_fill <- seq(-4, z, length = 500)
y_fill <- dnorm(x_fill)

polygon(c(-4, x_fill, z),
        c(0, y_fill, 0),
        density = 20)

abline(v = z, lty = 2)
text(z, 0.02, "z", pos = 4)


# ---- P(Z > z)
plot(x, y,
    type = "l",
    lwd = 2,
    xlab = "z",
    ylab = "Density",
    main = expression(P(Z > z)))

x_fill <- seq(z, 4, length = 500)
y_fill <- dnorm(x_fill)

polygon(c(z, x_fill, 4),
        c(0, y_fill, 0),
        density = 20)

abline(v = z, lty = 2)
text(z, 0.02, "z", pos = 2)

dev.off()
