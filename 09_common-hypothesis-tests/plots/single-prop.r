library(ggplot2)
z_crit <- qnorm(0.99)    # 2.326 (right-tailed)
z_cal  <- 2.52

x  <- seq(-3.5, 4, length.out = 600)
df <- data.frame(x = x, y = dnorm(x))

ggplot(df, aes(x, y)) +
      geom_line() +
      geom_area(data = subset(df, x >= z_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_vline(xintercept = z_cal, linetype = "dashed",
                                colour = "blue") +
      annotate("text", x = z_cal + 0.05, y = 0.15,
                            label = expression(Z[cal] == 2.52),
                            hjust = 0, colour = "blue") +
      annotate("text", x = z_crit-0.7, y = 0.02,
                            label = "2.33", hjust = 0) +
      labs(x = "Z", y = "") +
      theme_classic() +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
    )

ggsave("single-proportion-z.pdf", width = 4, height = 3)
