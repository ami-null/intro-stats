x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

pdf("normal_mu_pm_all_sigma.pdf", width = 7, height = 2.75)
par(
    mfrow = c(1, 3),
    mar  = c(3.1, 3.1, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2, 0.85, 0),
    cex = 1
)


####### 1 sigma

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


########## 2 sigma
plot(
    x,
    y,
    type = "l",
    ylab = "Density",
    xlab = "X",
    main = expression(paste(mu, "±2", sigma)),
    lwd = 2
)

shade_x <- seq(-2, 2, length = 500)
shade_y <- dnorm(shade_x)

polygon(
    c(shade_x, rev(shade_x)),
    c(shade_y, rep(0, length(shade_y))),
    density = 20
    # border = NA,
    # col = "lightblue"
)

abline(v = c(-2, 2), lty = 2)

######### 3 sigma

plot(
    x,
    y,
    type = "l",
    ylab = "Density",
    xlab = "X",
    main = expression(paste(mu, "±3",sigma)),
    lwd = 2
)

shade_x <- seq(-3, 3, length = 500)
shade_y <- dnorm(shade_x)

polygon(
    c(shade_x, rev(shade_x)),
    c(shade_y, rep(0, length(shade_y))),
    density = 20
    # border = NA,
    # col = "lightblue"
)

abline(v = c(-3, 3), lty = 2)

dev.off()
