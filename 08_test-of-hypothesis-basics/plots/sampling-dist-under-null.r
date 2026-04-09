# Parameters
x <- seq(-4, 4, length = 1000)
y <- dnorm(x)

# Plot

pdf("sampling-dist-under-null.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Sampling Distribution under " * H[0]),
     xlab = "Test Statistic (Z)", ylab = "Density")

abline(v = 0, lty = 2)
# text(-0.1, max(y)*0.85, expression(mu[0]), pos = 4)
dev.off()


# ----

# Define an arbitrary "unlikely" cutoff (before formal alpha)
cutoff <- 2

pdf("unlikely-region-under-null.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Unlikely Values under"~H[0]),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Shade right tail
xx1 <- seq(-4, -cutoff, length = 500)
yy1 <- dnorm(xx1)
polygon(c(xx1, rev(xx1)), c(rep(0, length(xx1)), rev(yy1)),
        density = 20, angle = 135)

# Right tail
xx2 <- seq(cutoff, 4, length = 500)
yy2 <- dnorm(xx2)
polygon(c(xx2, rev(xx2)), c(rep(0, length(xx2)), rev(yy2)),
        density = 20, angle = 45)

abline(v = cutoff, lty = 2)
text(cutoff, dnorm(cutoff), "Unlikely", pos = 4)

abline(v = -cutoff, lty = 2)
text(-cutoff, dnorm(-cutoff), "Unlikely", pos = 2)

# text(0, max(y)*0.75, expression(H[0]~"True"))
dev.off()


# ---- alpha
pdf("two-tail-rejection-region.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
alpha <- 0.05
z_crit <- qnorm(1 - alpha/2)

plot(x, y, type = "l", lwd = 2,
     main = expression("Rejection Regions (Two-tailed)"),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Left tail
xx1 <- seq(-4, -z_crit, length = 500)
yy1 <- dnorm(xx1)
polygon(c(xx1, rev(xx1)), c(rep(0, length(xx1)), rev(yy1)),
        density = 20, angle = 135)

# Right tail
xx2 <- seq(z_crit, 4, length = 500)
yy2 <- dnorm(xx2)
polygon(c(xx2, rev(xx2)), c(rep(0, length(xx2)), rev(yy2)),
        density = 20, angle = 45)

# Critical lines
abline(v = c(-z_crit, z_crit), lty = 2)

# Labels
# text(-z_crit, dnorm(-z_crit), expression(-z[alpha/2]), pos = 4)
# text(z_crit, dnorm(z_crit), expression(z[alpha/2]), pos = 2)
text(-z_crit, 0, expression(-z[alpha/2]), pos = 4)
text(z_crit, 0, expression(z[alpha/2]), pos = 2)

text(-2.8, 0.05, expression(alpha/2))
text(2.8, 0.05, expression(alpha/2))
text(0, 0.3, expression(1 - alpha))
dev.off()


# ---- right tail rejection region

alpha <- 0.05
z_crit <- qnorm(1 - alpha)

pdf("right-tailed-rejection-region.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Rejection Region (Right-tailed)"),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Shade rejection region
xx <- seq(z_crit, 4, length = 500)
yy <- dnorm(xx)
polygon(c(xx, rev(xx)), c(rep(0, length(xx)), rev(yy)),
        density = 20, angle = 45)

abline(v = z_crit, lty = 2)

# Labels
# text(z_crit, dnorm(z_crit), expression(z[alpha]), pos = 4)
text(z_crit, 0, expression(z[alpha]), pos = 2)
text(2.8, 0.05, expression(alpha))
text(0, 0.3, expression(1 - alpha))
dev.off()

# left tail rejection region
alpha <- 0.05
z_crit <- qnorm(alpha)

pdf("left-tailed-rejection-region.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Rejection Region (Left-tailed)"),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Shade rejection region
xx <- seq(z_crit, -4, length = 500)
yy <- dnorm(xx)
polygon(c(xx, rev(xx)), c(rep(0, length(xx)), rev(yy)),
        density = 20, angle = 45)

abline(v = z_crit, lty = 2)

# Labels
# text(z_crit, dnorm(z_crit), expression(z[alpha]), pos = 4)
text(z_crit, 0, expression(z[alpha]), pos = 4)
text(-2.8, 0.05, expression(alpha))
text(0, 0.3, expression(1 - alpha))
dev.off()

# --- observed
z_cal <- 0.85
alpha <- 0.1
z_crit <- qnorm(1 - alpha)

pdf("observed-fail-to-reject.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Fail to reject"~H[0]),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Rejection region
xx <- seq(z_crit, 4, length = 500)
yy <- dnorm(xx)
polygon(c(xx, rev(xx)), c(rep(0, length(xx)), rev(yy)),
        density = 20, angle = 45)

# Lines
abline(v = z_crit, lty = 2)
abline(v = z_cal, col = 2, lwd = 2)

# Labels
text(z_crit, dnorm(z_crit), expression(z[alpha]), pos = 4)
text(z_cal, dnorm(z_cal), expression(z[cal]), pos = 2, col = "red")
dev.off()


# -- observed, reject
z_cal <- 1.6
alpha <- 0.1
z_crit <- qnorm(1 - alpha)

pdf("observed-reject.pdf", height = 3.5, width = 3.5)
par(
    mar  = c(3.4, 3.4, 1.6, 1),  # minimal bottom/left for labels, almost nothing top/right
    mgp  = c(2.25, 0.85, 0)
)
plot(x, y, type = "l", lwd = 2,
     main = expression("Reject"~H[0]),
     xlab = "Test Statistic (Z)", ylab = "Density")

# Rejection region
xx <- seq(z_crit, 4, length = 500)
yy <- dnorm(xx)
polygon(c(xx, rev(xx)), c(rep(0, length(xx)), rev(yy)),
        density = 20, angle = 45)

# Lines
abline(v = z_crit, lty = 2)
abline(v = z_cal, col = 2, lwd = 2)

# Labels
text(z_crit, dnorm(z_crit), expression(z[alpha]), pos = 2)
text(z_cal, dnorm(z_cal), expression(z[cal]), pos = 4, col = "red")
dev.off()
