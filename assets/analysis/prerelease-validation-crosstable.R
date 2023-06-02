#!/usr/bin/env Rscript
library(argparser)
suppressPackageStartupMessages(library(tidyverse))

parser <- argparser::arg_parser('Outputs list of project_names with incosistencies',
                                 name = 'prerelease-validation-manual.R')

parser <- add_argument(parser, 'samplesTable',
                       type='character',
                       nargs=1,
                       help='Path to the samples.tsv')
parser <- add_argument(parser, 'libraryTable',
                       type="character",
                       nargs=1,
                       help='Path to the libraries.tsv')
parser <- add_argument(parser, 'outputTable',
                       type='character',
                       nargs=1,
                       help='Path, including the name, to the output file')

argv <- parse_args(parser)

samples <- read.delim(argv$samplesTable, sep = "\t")
libraries <- read.delim(argv$libraryTable, sep = "\t")
allCombined <- samples %>% full_join(libraries, by = c("project_name", "publication_year", "sample_name", "archive", "archive_project"))
write_tsv(allCombined, file = argv$outputTable)
publication_doi_na <- allCombined %>% filter(is.na(publication_doi))
cat("\n")
cat("POSSIBLE PROBLEMS FOR:", paste0(unique(publication_doi_na$project_name), sep = ","), "\n")
cat("\n")
