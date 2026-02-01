library(ggplot2)

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

xq1 <- quantile(x, 0.25)
xq2 <- quantile(x, 0.5)
xq3 <- quantile(x, 0.75)
xll <- xq1 - 1.5* IQR(x)
xul <- xq3 + 1.5* IQR(x)


ggplot() +
    aes(x=x) +
    geom_boxplot(alpha = 0.75, width = 0.65, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("Score") +
    ylim(c(-0.65, 0.65)) +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )

ggsave("boxplot.pdf", width = 6, height = 1.5, units = "in")


ggplot() +
    aes(x=x) +
    geom_boxplot(alpha = 0.75, width = 0.65, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("Score") +
    ylim(c(-0.65, 0.65)) +
    annotate("text", x = xq1, y = -0.55, label = "Q1", colour = "red") +
    annotate("text", x = xq2, y = -0.55, label = "Q2", colour = "red") +
    annotate("text", x = xq3, y = -0.55, label = "Q3", colour = "red") +
    annotate("text", x = xll, y = -0.55, label = "Q1-1.5 IQR", colour = "red") +
    annotate("text", x = xul, y = -0.55, label = "Q3+1.5 IQR", colour = "red") +
    # annotate("text", x = xq1, y = -0.3, label = "|", colour = "red") +
    # annotate("text", x = xq2, y = -0.3, label = "|", colour = "red") +
    # annotate("text", x = xq3, y = -0.3, label = "|", colour = "red") +
    # annotate("text", x = xll, y = -0.3, label = "|", colour = "red") +
    # annotate("text", x = xul, y = -0.3, label = "|", colour = "red") +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )

ggsave("boxplot-annotated.pdf", width = 6, height = 1.5, units = "in")



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
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )

ggsave("boxplot-pair.pdf", width = 6, height = 2.5, units = "in")



## Skewnews with boxplot

set.seed(1)
symm <- rnorm(100)
ggplot() +
    aes(x=symm) +
    geom_boxplot(alpha = 0.75, width = 0.65, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("") +
    ylim(c(-0.65, 0.65)) +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )
ggsave("boxplot-symmetric.pdf", width = 6, height = 2.5, units = "in")


set.seed(2)
lefts <- rbeta(100, shape1 = 5, shape2 = 2.25)
ggplot() +
    aes(x=lefts) +
    geom_boxplot(alpha = 0.75, width = 0.65, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("") +
    ylim(c(-0.65, 0.65)) +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )
ggsave("boxplot-left-skewed.pdf", width = 6, height = 2.5, units = "in")


set.seed(3)
rights <- rgamma(100, shape = 2.75, scale = 1)
ggplot() +
    aes(x=rights) +
    geom_boxplot(alpha = 0.75, width = 0.65, staplewidth = 0.35) +
    theme_minimal(base_size = 14) +
    xlab("") +
    ylim(c(-0.65, 0.65)) +
    theme(
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(fill = "transparent", colour = NA), # Transparent panel bg
        plot.background = element_rect(fill = "transparent", colour = NA),   # Transparent plot bg
    )
ggsave("boxplot-right-skewed.pdf", width = 6, height = 2.5, units = "in")
