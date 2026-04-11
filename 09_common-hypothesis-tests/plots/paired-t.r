library(ggplot2)
df_val <- 8
t_crit <- qt(0.95, df_val)   # 1.86 (right-tailed)
t_cal  <- 0.28

x  <- seq(-4, 4, length.out = 600)
dd <- data.frame(x = x, y = dt(x, df_val))

ggplot(dd, aes(x, y)) +
      geom_line() +
      geom_area(data = subset(dd, x >= t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_vline(xintercept = t_cal, linetype = "dashed",
                                colour = "steelblue") +
      annotate("text", x = t_cal - 1.6, y = 0.08,
                            label = expression(t[cal] == 0.28),
                            hjust = 0, colour = "steelblue") +
      annotate("text", x = t_crit, y = 0.015,
                            label = "1.86", hjust = 0) +
      labs(x = expression(t[8]), y = "") +
      theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
    )

ggsave("paired-t-test.pdf", width = 4, height = 3)
