#!/usr/bin/env bash
#moving-pictures-Rmd.sh and atacama.sh
R -e "rmarkdown::render('Tutorials_Render.Rmd', output_format='md_document')"

