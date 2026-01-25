set.seed(1)
x1 <- rnorm(100, 5, 5)
set.seed(2)
x2 <- rnorm(100, 5, 10)
x <- c(x1, x2)
x <- x+60
# boxplot(x, horizontal = T, xlab = "Marks", pch = 20)


set.seed(3)
y1 <- rnorm(100, 10, 10)
set.seed(4)
y2 <- rnorm(100, 10, 15)
y <- c(y1, y2)
y <- y+50


df <- data.frame(
    Score = c(x, y),
    Section = rep(c("1", "2"), each = 200)
)

# boxplot(Score ~ Section, df, horizontal = T)

library(ggplot2)
ggplot() +
    aes(x=x) +
    geom_boxplot(alpha = 0.75, width = 0.75, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("Marks") +
    ylim(c(-0.6, 0.6)) +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()
    )

ggsave("boxplot.pdf", width = 6, heigh = 1.5, units = "in")



library(ggplot2)
ggplot(df) +
    aes(x=Score, group = Section, y = Section) +
    geom_boxplot(alpha = 0.75, width = 0.5, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    # xlab("Marks") +
    # ylim(c(-0.6, 0.6)) +
    # xlim(c(30, 95)) +
    theme(
        # axis.ticks.y = element_blank(),
        # axis.text.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank()
    )

ggsave("boxplot-pair.pdf", width = 6, heigh = 2.5, units = "in")
