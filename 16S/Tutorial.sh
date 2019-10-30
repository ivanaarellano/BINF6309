#!/usr/bin/env bash
#moving-pictures-Rmd.sh
R -e "rmarkdown::render('Tutorial_Render.Rmd', output_format='md_document')"

