output/insurance_clean.rds: code/00_clean_data.R insurance.csv
	Rscript code/00_clean_data.R

output/01_table1.rds: code/01_table1.R output/insurance_clean.rds
	Rscript code/01_table1.R
	
output/02_scatterplot.png: code/02_scatterplot.R output/insurance_clean.rds
	Rscript code/02_scatterplot.R
	
output/03_mlr.rds: code/03_mlr.R output/insurance_clean.rds
	Rscript code/03_mlr.Rmak
	
report/finalreport.html: code/04_render_report.R
	Rscript code/04_render_report.R

# make rule for renv::restore
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
  				# prompt = FALSE automatically answers questions to install rule
# renv::snapshot() to update packages
    
.PHONY:	clean
clean:
	rm -f output/*.rds && rm -f *.png && html
# && only executes second command if first command executes successfully

# Docker
PROJECTFILES = finalreport.rmd code/04_render_report.R code/00_clean_data.R code/01_table1.R code/02_scatterplot.R code/03_mlr.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# Build image
docker_image: $(PROJECTFILES) $(RENVFILES) dockerfile
	docker build -t finaldocker .
	touch $@

# Container
report/finalreport.html:
	docker run -v "docker run -v "$$(pwd)/report":/FinalProject_report/report ayqxiong/finaldocker || "/$$(pwd)/report":/FinalProject_report/report ayqxiong/finaldocker
