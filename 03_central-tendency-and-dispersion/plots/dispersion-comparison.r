# library(extrafont)
# loadfonts(device = "win")

pdf("dispersion-comparison.pdf", width = 6, height = 4)

curve(dnorm(x, 50, 2), from = 35, 65, col = "red", ylab = "Density", lwd = 2, bty="l", xlab = "X")
curve(dnorm(x, 50, 3), from = 35, 65, add = T, col = "blue", lwd = 2)
curve(dnorm(x, 50, 4.5), from = 35, 65, add = T, col = "darkgreen", lwd = 2)

legend(
    "topright",
    legend = c(
        "Low dispersion",
        "Mild dispersion",
        "High dispersion"
    ),
    col = c("red", "blue", "darkgreen"),
    lty = c(1, 1, 1),
    lwd = c(2, 2, 2),
    bty = "n"    # no box around the legend
)
dev.off()

