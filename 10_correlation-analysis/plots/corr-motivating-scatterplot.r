library(ggplot2)
df <- data.frame(
      x = c(2, 3, 6, 4, 7, 3, 6),
      y = c(5, 7, 11, 8, 13, 6, 12)
    )
ggplot(df, aes(x, y)) +
      geom_point(size = 1) +
      labs(
            x = "Number of Family Members",
            y = "Monthly Food Expenditure\n(thousand taka)",
            title = "Scatter Diagram"
          ) +
      theme_classic() +
      theme(plot.title = element_text(hjust = 0.5)) +
    theme(
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
        plot.margin = margin(t = 5.5, r = 0, b = 5.5, l = 0, unit = "pt")
    )

ggsave("corr-motivating-scatter.pdf",
                width = 4.5, height = 3.2)
