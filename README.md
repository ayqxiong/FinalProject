---
title: Final Project Pt 3 Github
author: Annabelle Xiong
output: github_document
---

# Final Project Description

-   `code/` contains all code that is used to create the figures and tables required
    -   `code/00_clean_data.R` is used to clean the original dataset and produce `insurance_clean.rds`
        -   `insurance_clean.rds` should be saved to `output/`
    -   `code/02_scatterplot.R` produces a scatterplot of age vs. insurance charges
        -   scatterplot output should be saved to `output/`
    -   `code/03_mlr.R` produces a Multiple linear regression analysis
        -   Multiple linear regression summary table should be saved to `output/`
    -   `code/04_render_report.R` is used for rendering the combined report from the command line
-   The code is combined in `combined_report.Rmd`.

## Synchronizing Package Repository

This project uses the `renv` package manager to manage packages to maintain a consistent package environment.

To synchronize the package repository:

1.  **Install `renv`**: Install `renv` in R using: `install.packages("renv")` in terminal, if you haven't already done so
2.  **Restore** `renv`: Use `make install` to restore renv

## Building Docker Image

-   Link to docker image: <https://hub.docker.com/r/ayqxiong/finaldocker>

-   You can pull this image directly with `docker pull ayqxiong/finaldocker`
