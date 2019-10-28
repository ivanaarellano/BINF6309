#!/usr/bin/env bash
#moving-pictures-Rmd.sh
R -e "rmarkdown::render('moving-pictures.Rmd', output_format='md_document')"

