x  <- seq(-4, 7, length = 1000)
cv <- qnorm(0.95)          # critical value for alpha = 0.05, right-tailed

plot(x, dnorm(x, 0, 1), type = "l", lwd = 2,
     ylab = "Density", xlab = "Test Statistic",
     main = "", ylim = c(0, 0.45))
lines(x, dnorm(x, 2.5, 1), lwd = 2, lty = 2)
abline(v = cv, lty = 3, col = "gray40")

# beta region (under H_A, left of critical value)
xb <- seq(-4, cv, length = 300)
polygon(c(xb, rev(xb)), c(dnorm(xb, 2.5, 1), rep(0, 300)),
        col = rgb(1, 0, 0, 0.3), border = NA)

# power region (under H_A, right of critical value)
xp <- seq(cv, 7, length = 300)
polygon(c(xp, rev(xp)), c(dnorm(xp, 2.5, 1), rep(0, 300)),
        col = rgb(0, 0, 1, 0.3), border = NA)

legend(
    "topright", bty = "n",
    legend = c(
        expression(H[0]*" distribution"),
        expression(H[A]*" distribution")
    ),
    lwd = c(2, 2), lty = c(1, 2)
)
legend(
    "topleft", bty = "n",
    legend = c(
        expression(beta*" (Type II error)"),
        "Power"
    ),
    fill = c(rgb(1,0,0,0.3), rgb(0,0,1,0.3)),
    border = c("black", "black")
)
