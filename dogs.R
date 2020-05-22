library(ggplot2)
library(cowplot)

# Read the height, weight and age-of-death (AOD) data for different
# dog breeds. These data accompany the paper "Single-nucleotide-
# polymorphism-based association mapping of dog stereotypes" by Jones
# et al (2008), doi:10.1534/genetics.108.087866.
dogs <- read.csv("dogs.csv",stringsAsFactors = FALSE)

# Fit a line for AOD vs. body weight (in pounds).
fit <- lm(AOD ~ weight,dogs)
b   <- coef(fit)

# Plot AOD vs. body weight, along with the best-fit line (dashed, blue
# line). Compare with Figure 4 from Jones et al (2008).
print(ggplot(dogs,aes(x = weight,y = AOD)) +
  geom_point(color = "black") +
  geom_abline(intercept = b["(Intercept)"],slope = b["weight"],
              color = "darkorange",linetype = "dashed") +
  theme_cowplot())
