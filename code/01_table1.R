here::i_am("code/01_table1.R")

insurance <- readRDS(
  file = here::here("output/insurance_clean.rds")
  
)

library(gtsummary)
library(dplyr)

table1 <- demographics_summary <- 
  tbl_summary(
    insurance %>%
      select(age, sex, bmi, children, smoker, region),
    label = list(
      age = "Age",
      sex = "Gender",
      bmi = "BMI",
      children = "Number of Children",
      smoker = "Smoker Status",
      region = "Region"
    )
  )

# Print the demographics summary table
demographics_summary

saveRDS(
  table1,
  file = here::here("output/table1.rds")
)
