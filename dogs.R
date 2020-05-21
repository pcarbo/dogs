library(ggplot2)
library(cowplot)
dogs <- read.csv("dogs.csv",stringsAsFactors = FALSE)
fit  <- lm(AOD ~ weight,dogs)
b    <- coef(fit)
print(ggplot(dogs,aes(x = weight,y = AOD)) +
  geom_point(color = "dodgerblue") +
  geom_abline(intercept = b[1],slope = b[2],color = "magenta",
              linetype = "dotted") +
  theme_cowplot())