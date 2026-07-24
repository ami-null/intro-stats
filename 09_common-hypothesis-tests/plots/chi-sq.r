library(ggplot2)
df_val  <- 1
chi_crit <- qchisq(0.95, df_val)   # 3.841
chi_cal  <- 14.25

x  <- seq(0.01, 18, length.out = 600)
dd <- data.frame(x = x, y = dchisq(x, df_val))

ggplot(dd, aes(x, y)) +
    geom_line() +
    geom_area(data = subset(dd, x >= chi_crit), aes(x, y), fill = "firebrick", alpha = 0.4) +
    geom_vline(xintercept = chi_cal, linetype = "dashed", colour = "steelblue") +
    annotate("text", x = chi_cal + 0.2, y = 0.04, label = expression(chi[cal]^2 == 14.25),
             hjust = 0, colour = "steelblue") +
    geom_vline(xintercept = chi_crit, linetype = "dashed", colour = "firebrick") +
    annotate("text", x = chi_crit+0.2, y = 0.04, label = expression(chi[crit]^2 == 3.84),
             hjust = 0, colour = "firebrick") +
    labs(x = expression(chi[1]^2), y = "") +
    theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
    ) +
    ylim(0, 0.25)


ggsave("chi-square-association.pdf", width = 4, height = 3)
