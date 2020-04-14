# author: Anh Le
# date: 04/13/2020

.PHONY: all clean

all: docs/finalreport.html docs/finalreport.pdf

# download data
data/autism.csv : src/load.R
<TAB>Rscript src/load.R --filepath="data/autism.csv" --url_to_read="https://github.com/STAT547-UBC-2019-20/data_sets/raw/master/Autism-Adult-Data.arff"

# clean data
## YOUR SOLUTION HERE
data/autism_cleaned.csv : src/clean.R data/autism.csv
<TAB>Rscript src/clean.R --filepath_raw="data/autism.csv" --filepath_cleaned="data/autism_cleaned.csv"

# EDA
## YOUR SOLUTION HERE
images/barplot.png images/correlation.png images/propbarplot.png : src/eda.R data/autism_cleaned.csv
<TAB>Rscript src/eda.R --filepath_cleaned="data/autism_cleaned.csv"

# Knit report
## YOUR SOLUTION HERE
docs/finalreport.html docs/finalreport.pdf : images/barplot.png images/correlation.png images/propbarplot.png docs/finalreport.Rmd data/autism_cleaned.csv src/knit.R docs/asd_refs.bib
<TAB>Rscript src/knit.R --finalreport="docs/finalreport.Rmd"
    
clean :
<TAB>rm -f data/*
<TAB>rm -f images/*
<TAB>rm -f docs/*.md
<TAB>rm -f docs/*.html