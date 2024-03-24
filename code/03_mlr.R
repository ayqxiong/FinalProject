here::i_am("code/03_mlr.R")
abs_filepath <- here::here("insurance.csv")
insurance <- read.csv(abs_filepath, header=TRUE)

insurance <- readRDS(
  file = here::here("output/insurance_clean.rds")
)

library(gtsummary)

# Multiple linear regression
Multiple_linear_regression <- mlrfull <- lm(charges~age + sex + bmi + children + smoker + region, data = insurance)
summary(mlrfull)

mlr_table <- tbl_regression(mlrfull)

print(mlrfull)

saveRDS(
  Multiple_linear_regression,
  file = here::here("output/Multiple_linear_regression.rds")
)

saveRDS(
  mlr_table,
  file = here::here("output/mlr_table.rds")
)
