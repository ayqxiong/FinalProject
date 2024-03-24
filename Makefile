output/insurance_clean.rds: code/00_clean_data.R insurance.csv
	Rscript code/00_clean_data.R

output/01_table1.rds: code/01_table1.R output/insurance_clean.rds
	Rscript code/01_table1.R
	
output/02_scatterplot.png: code/02_scatterplot.R output/insurance_clean.rds
	Rscript code/02_scatterplot.R
	
output/03_mlr.rds: code/03_mlr.R output/insurance_clean.rds
	Rscript code/03_mlr.R

.PHONY:	clean
clean:
	rm -f output/*.rds && rm -f *.png
# && only executes second command if first command executes successfully