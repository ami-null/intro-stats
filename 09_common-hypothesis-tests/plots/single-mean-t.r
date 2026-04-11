library(ggplot2)
df_val <- 9
t_crit <- qt(0.975, df_val)     # 2.262
t_cal  <- 3.84

x  <- seq(-5, 5, length.out = 600)
dd <- data.frame(x = x, y = dt(x, df_val))

ggplot(dd, aes(x, y)) +
      geom_line() +
      geom_area(data = subset(dd, x <= -t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_area(data = subset(dd, x >=  t_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_vline(xintercept = t_cal, linetype = "dashed",
                                colour = "blue") +
      annotate("text", x = t_cal - 1.95, y = 0.2,
                            label = expression(t[cal] == 3.84),
                            hjust = 0, colour = "blue") +
      annotate("text", x = -t_crit, y = 0.05,
                            label = "-2.26", hjust = 1) +
      annotate("text", x =  t_crit, y = 0.05,
                            label =  "2.26", hjust = 0) +
      labs(x = expression(t[9]), y = "") +
      theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
    ) +
    scale_y_continuous(expand = c(0, 0))

ggsave("single-mean-t-test.pdf", width = 4, height = 3)
