x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

pdf("normal_mu_pm_1sigma.pdf", width = 6.5, height = 3.5)

plot(
    x,
    y,
    type = "l",
    ylab = "Density",
    xlab = "X",
    main = expression(paste(mu, "±", sigma)),
    lwd = 2
)

shade_x <- seq(-1, 1, length = 500)
shade_y <- dnorm(shade_x)

polygon(
    c(shade_x, rev(shade_x)),
    c(shade_y, rep(0, length(shade_y))),
    density = 20
    # border = NA,
    # col = "lightblue"
)

abline(v = c(-1, 1), lty = 2)

dev.off()
