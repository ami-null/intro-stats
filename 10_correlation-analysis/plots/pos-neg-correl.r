library(ggplot2)
set.seed(1)

df <- data.frame(x = 1:30, y = 2*(1:30) + rnorm(30, sd = 3))

ggplot(df, aes(x, y)) +
      geom_point(size = 1) +
      labs(title = "Positive Correlation", x = "X", y = "Y") +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5)) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )
ggsave("corr-positive.pdf", width = 3.5, height = 3.5)



df <- data.frame(x = 1:30, y = -2*(1:30) + 70 + rnorm(30, sd = 3))
ggplot(df, aes(x, y)) +
      geom_point(size = 1) +
      labs(title = "Negative Correlation", x = "X", y = "Y") +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5)) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )
ggsave("corr-negative.pdf", width = 3.5, height = 3.5)
