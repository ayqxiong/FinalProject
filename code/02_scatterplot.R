here::i_am("code/02_scatterplot.R")
abs_filepath <- here::here("insurance.csv")
insurance <- read.csv(abs_filepath, header=TRUE)

insurance <- readRDS(
  file = here::here("output/insurance_clean.rds")
)

library(ggplot2)
library(cowplot)

# Create a scatterplot of age vs. insurance charges
scatterplot <- ggplot(insurance, aes(x = age, y = charges)) +
  geom_point (alpha = 0.6) +
  labs(
    title = "Relationship between Age and Insurance Charges",
    x = "Age",
    y = "Insurance Charges"
  ) +
  geom_point() +
  geom_smooth(method = lm)
  theme_cowplot(12)

# Print the scatter plot
print(scatterplot)

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png"
)
