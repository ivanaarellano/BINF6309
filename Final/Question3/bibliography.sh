#!/usr/bin/env bash
R -e "rmarkdown::render('bibliography.Rmd', output_format='md_document')"