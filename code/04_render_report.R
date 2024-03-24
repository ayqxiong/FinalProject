here::i_am(
 "code/render_report.R"
)

library(rmarkdown)

render(
  "FinalProject3.Rmd",
  output_format = "html_document",
  output_file = here::here("output/FinalProject3.html")
)

print("it works")