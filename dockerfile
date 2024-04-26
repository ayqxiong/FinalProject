FROM rocker/r-ubuntu as base

# Creating project directory
RUN mkdir FinalProject_report
WORKDIR /FinalProject_report

RUN mkdir -p renv
COPY renv.lock .
COPY .Rprofile .
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu
RUN apt-get update
RUN apt-get install -y pandoc

WORKDIR FinalProject_report
COPY --from=base /FinalProject_report .

# Add folders
RUN mkdir code
RUN mkdir output

# Copy needed files
COPY code code
COPY Makefile .
COPY finalreport.Rmd .

# Make report; move
CMD make && mv finalreport.html report