# Import data
here::i_am("code/00_clean_data.R")
abs_filepath <- here::here("insurance.csv")
insurance <- read.csv(abs_filepath, header=TRUE)

# Load libraries
library(gtsummary)
library(dplyr)
library(labelled)

# Load packages
pacman::p_load(
  mlbench,
  tidyverse,
  rio,
  sjPlot
)

# Label variables
var_label(insurance) = list(
  age = "Age",
  sex = "Gender",
  bmi = "BMI",
  children = "Number of Children",
  smoker = "Smoker Status",
  region = "Region"
)

saveRDS(
  insurance,
  file = here::here("output/insurance_clean.rds")
)
