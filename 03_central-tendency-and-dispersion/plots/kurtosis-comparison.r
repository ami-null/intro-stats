# library(extrafont)
# loadfonts(device = "win")

pdf("kurtosis-comparison.pdf", width = 6, height = 4)

curve(dnorm(x, 50, 2), from = 30, 70, col = "red", ylab = "Density", lwd = 2, bty="l", xlab = "X")
curve(dnorm(x, 50, 3.5), from = 30, 70, add = T, col = "blue", lwd = 2)
curve(dnorm(x, 50, 6), from = 30, 70, add = T, col = "darkgreen", lwd = 2)

legend(
    "topright",
    legend = c(
        "Leptokurtic",
        "Mesokurtic",
        "Platykurtic"
    ),
    col = c("red", "blue", "darkgreen"),
    lty = c(1, 1, 1),
    lwd = c(2, 2, 2),
    bty = "n"    # no box around the legend
)
dev.off()

