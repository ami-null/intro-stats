library(ggplot2)
df_val <- 5
t_crit <- qt(0.975, df_val)   # 2.571

x  <- seq(-5, 5, length.out = 600)
dd <- data.frame(x = x, y = dt(x, df_val))

ggplot(dd, aes(x, y)) +
      geom_line() +
      geom_area(data = subset(dd, x <= -t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_area(data = subset(dd, x >=  t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      annotate("segment",
                            x = 4.2, xend = 4.85, y = 0.13, yend = 0.035,
                            arrow = arrow(length = unit(0.2, "cm")),
                            colour = "blue") +
      annotate("text", x = 4.0, y = 0.155,
                            label = expression(t[cal] == 16.56),
                            hjust = 1, colour = "blue", size = 3.5) +
      annotate("text", x = -t_crit - 0.1, y = 0.04,
                            label = "-2.57", hjust = 1, size = 3.2) +
      annotate("text", x =  t_crit + 0.1, y = 0.04,
                            label =  "2.57", hjust = 0, size = 3.2) +
      labs(x = expression(t[5]), y = "") +
      theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )

ggsave("corr-t-test.pdf", width = 4, height = 3)
