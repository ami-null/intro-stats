library(ggplot2)
alpha <- 0.01
z_crit <- qnorm(1 - alpha/2)   # 2.576
z_cal  <- -5.27

x  <- seq(-6, 6, length.out = 600)
df <- data.frame(x = x, y = dnorm(x))

ggplot(df, aes(x, y)) +
      geom_line() +
      geom_area(data = subset(df, x <= -z_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_area(data = subset(df, x >=  z_crit),
                              aes(x, y), fill = "firebrick", alpha = 0.4) +
      geom_vline(xintercept = z_cal, linetype = "dashed",
                                colour = "blue") +
      annotate("text", x = z_cal - 0.029, y = 0.15,
                            label = expression(Z[cal] == -5.27),
                            hjust = 1, colour = "blue") +
      annotate("text", x = -z_crit - 0.1, y = 0.02,
                            label = "-2.57", hjust = 1) +
      annotate("text", x =  z_crit + 0.1, y = 0.02,
                            label =  "2.57", hjust = 0) +
      labs(x = "Z", y = "") +
      theme_minimal() +
      theme(
          panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
          plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
          plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = -10, unit = "pt")
      )

ggsave("single-mean-z-test.pdf", width = 4, height = 3, bg = "transparent")
