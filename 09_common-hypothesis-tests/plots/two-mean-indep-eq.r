library(ggplot2)
df_val <- 23
t_crit <- qt(0.975, df_val)   # 2.069
t_cal  <- 0.623

x  <- seq(-4, 4, length.out = 600)
dd <- data.frame(x = x, y = dt(x, df_val))

ggplot(dd, aes(x, y)) +
    geom_line() +
    geom_area(data = subset(dd, x <= -t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
    geom_area(data = subset(dd, x >=  t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
    geom_vline(xintercept = t_cal, linetype = "dashed",
                                colour = "steelblue") +
    annotate("text", x = t_cal - 1.9, y = 0.15,
                            label = expression(t[cal] == 0.623),
                            hjust = 0, colour = "steelblue") +
    annotate("text", x = -t_crit - 0.05, y = 0.06,
                            label = "-2.07", hjust = 1, colour = "firebrick") +
    geom_vline(xintercept = -t_crit, linetype = "dashed",
               colour = "firebrick") +
    annotate("text", x =  t_crit + 0.05, y = 0.06,
                            label =  "2.07", hjust = 0, colour = "firebrick") +
    geom_vline(xintercept = t_crit, linetype = "dashed",
               colour = "firebrick") +
    labs(x = expression(t[23]), y = "") +
    theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
    )

ggsave("two-mean-indep-equal.pdf", width = 4, height = 3)
