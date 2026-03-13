pdf("pdf_area.pdf", width = 3, height = 3)

x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

z <- 1

# ---- P(Z < z)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(
    x, y,
    type = "l",
    lwd = 2,
    xlab = expression(x),
    ylab = "Density",
    main = expression(P(X < x))
)

x_fill <- seq(-4, z, length = 500)
y_fill <- dnorm(x_fill)

polygon(c(-4, x_fill, z),
        c(0, y_fill, 0),
        density = 20)

abline(v = z, lty = 2)
text(z-0.3, 0.0035, "x", pos = 4)

dev.off()

#########

pdf("cdf.pdf", width = 3, height = 3)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)

cdf <- pnorm(x)
plot(
    x, cdf,
    type = "l",
    lwd = 2,
    xlab = expression(x),
    ylab = expression(F(x)),
    main = expression(F(x))
)

abline(v = z, lty = 2)
text(z-0.3, 0.0035, "x", pos = 4)

dev.off()


