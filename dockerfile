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

# IF RENV::RESTORE DOESNT WORK, uncomment the code below and remove RUN R -e "renv::restore()":
# RUN R -e "install packages('gtsummary')"
# RUN R -e "install packages('dplyr')"
# RUN R -e "install packages('labelled')"
# RUN R -e "install packages('ggplot')"
# RUN R -e "install packages('cowplot')"
# RUN R -e "install packages('rmarkdown')"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu
RUN apt-get update
RUN apt-get install -y pandoc
RUN apt-get install -y build-essential
RUN apt-get install -y libv8-dev libcurl4-openssl-dev libssl-dev libxml2-dev libjson-c-dev
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y libnode-dev
RUN apt-get install -y libx11-dev libxext-dev libxt-dev libxtst-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y g++
RUN apt-get install -y cmake

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

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######


# Add folders
RUN mkdir code
RUN mkdir output
RUN mkdir report

# Copy needed files
COPY code code
COPY Makefile .
COPY finalreport.Rmd .
COPY insurance.csv .

# Make report; move
CMD make && mv finalreport.html report