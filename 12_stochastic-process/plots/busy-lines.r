library(ggplot2)
df <- data.frame(time = seq(0, 40, by = 2),
                                     lines_busy = c(1,1,4,5,0,0,3,5,0,5,2,3,2,3,1,4,2,5,5,0,5))
ggplot(df, aes(x = time, y = lines_busy)) +
      geom_line(color = "steelblue") + geom_point(color = "steelblue") +
      # geom_text(aes(label = lines_busy), vjust = -1) +
      labs(title = "Number of Busy Lines", x = NULL, y = NULL) +
      theme_minimal()
ggsave("busy-lines.pdf", width = 8, height = 4)
