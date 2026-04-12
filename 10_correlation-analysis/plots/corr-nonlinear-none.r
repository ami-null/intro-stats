library(ggplot2); set.seed(3)
x <- seq(-3, 3, length.out = 60)
df <- data.frame(x = x, y = x^2 + rnorm(60, sd = 0.5))
ggplot(df, aes(x, y)) +
      geom_point(size = 1) +
      labs(title = "Non-linear Correlation", x = "X", y = "Y") +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5)) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )

ggsave("corr-nonlinear.pdf", width = 3.5, height = 3.5)



df <- data.frame(x = runif(50, 0, 10), y = runif(50, 10, 50))
ggplot(df, aes(x, y)) +
      geom_point(size = 1) +
      labs(title = "No Correlation", x = "X", y = "Y") +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5)) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )
ggsave("corr-none.pdf", width = 3.5, height = 3.5)
