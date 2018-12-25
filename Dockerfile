FROM rocker/tidyverse:3.5.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  # Dependencies for drake
  libudunits2-dev \
  libzmq3-dev \
# Bioconductor packages for drake
&& Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("graph")' \
# CRAN packages
&& install2.r --error --deps TRUE \
  rlang \
  assertr \
  assertthat \
  conflicted \
  furrr \
  drake \
  here
  
WORKDIR /home/rstudio
