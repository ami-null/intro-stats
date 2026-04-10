# ── Shared settings ────────────────────────────────────────────────────────────
x   <- seq(-4, 4, length = 1000)
y   <- dnorm(x)
col_reject <- rgb(0.8, 0.1, 0.1, 0.4)   # red shading for rejection region
col_retain <- rgb(0.2, 0.2, 0.8, 0.15)  # blue shading for fail-to-reject region

plot_base <- function(title) {
    plot(x, y, type = "l", lwd = 1,
         ylab = "Density", xlab = "Test Statistic",
         main = title, ylim = c(0, 0.42)#,
         #bty = "n", yaxt = "n"
    )
}

shade <- function(from, to, mu = 0, sd = 1, col) {
    xs <- seq(from, to, length = 300)
    polygon(c(xs, rev(xs)),
            c(dnorm(xs, mu, sd), rep(0, 300)),
            col = col, border = NA)
}

# ── 1. Two-tailed (alpha = 0.05) ───────────────────────────────────────────────
pdf("two-tail.pdf", width = 5, height = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
alpha <- 0.050
cv    <- qnorm(1 - alpha / 2)          # 1.96

plot_base(expression(paste("Two-tailed, ", alpha, " = 0.05")))

shade(-4,  -cv, col = col_reject)      # left rejection region
shade( cv,   4, col = col_reject)      # right rejection region
shade(-cv,  cv, col = col_retain)      # fail-to-reject region

lines(x, y, lwd = 1)                   # redraw curve on top of shading
abline(v = c(-cv, cv), lty = 2, col = "gray30")

# annotations
text( cv + 0.55, 0.03, expression(alpha/2), cex = 0.9, col = "red", pos = 3)
text(-cv - 0.55, 0.03, expression(alpha/2), cex = 0.9, col = "red", pos = 3)
text( cv-0.25,  0.04, expression(z[alpha/2]),  cex = 0.8, xpd = TRUE, pos = 1)
text(-cv+.025,  0.04, expression(-z[alpha/2]), cex = 0.8, xpd = TRUE, pos = 1)

legend(
    "topright",
    bty = "n",
    # cex = 0.85,
    legend = c("Rejection region", "Fail-to-reject region"),
    fill   = c(col_reject, col_retain),
    border = NA#,
    # bg = "white"
    # box.col = "white"
)

dev.off()


# ── 2. Left-tailed (alpha = 0.05) ──────────────────────────────────────────────
pdf("left-tailed.pdf", width = 5, height = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)#,
    # cex = 0.8
)
alpha <- 0.05
cv    <- qnorm(alpha)                  # -1.645

plot_base(expression(paste("Left-tailed, ", alpha, " = 0.05")))

shade(-4, cv, col = col_reject)
shade( cv,  4, col = col_retain)

lines(x, y, lwd = 1)
abline(v = cv, lty = 2, col = "gray30")

text(cv - 0.55, 0.03, expression(alpha), cex = 0.9, col = "red", pos = 3)
text(cv+.25, 0.03, expression(-z[alpha]),   cex = 0.8, xpd = TRUE, pos = 1)

legend(
    "topright",
    bty = "n",
    # cex = 0.85,
    legend = c("Rejection region", "Fail-to-reject region"),
    fill   = c(col_reject, col_retain),
    border = NA#,
    # bg = "white"
)

dev.off()


# ── 3. Right-tailed (alpha = 0.05) ─────────────────────────────────────────────
pdf("right-tailed.pdf", width = 5, height = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)#,
    # cex = 0.8
)
alpha <- 0.05
cv    <- qnorm(1 - alpha)              # 1.645

plot_base(expression(paste("Right-tailed, ", alpha, " = 0.05")))

shade(-4, cv, col = col_retain)
shade( cv,  4, col = col_reject)

lines(x, y, lwd = 1)
abline(v = cv, lty = 2, col = "gray30")

text(cv + 0.55, 0.03, expression(alpha), cex = 0.9, col = "red", pos = 3)
text(cv-0.25, 0.03, expression(z[alpha]),    cex = 0.8, xpd = TRUE, pos = 1)

legend(
    "topright",
    bty = "n",
    # cex = 0.85,
    legend = c("Rejection region", "Fail-to-reject region"),
    fill   = c(col_reject, col_retain),
    border = NA#,
    # bg = "white"
)

dev.off()
