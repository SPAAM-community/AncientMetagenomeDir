#! /usr/bin/env Rscript

# https://github.com/docopt/docopt.R

args <- commandArgs(trailingOnly = TRUE)

input_tab <- args[1]
verbose <- args[2]

## Add check of required
require(tidyverse)
require(jsonlite)
require(httr)
require(xml2)
require(progress)

source("library_pull_data.R")
source("library_pull_functions.R")

## TODO: genericise the variable names throughout this script away from hostass

## Load table -> TEST WHEN DO NOT FILTER TO ENA/SRA
print("[AncientMetagenomeDir_LibraryMetadata_Generator.R] Only pulling ENA/SRA data!")
hostass_meta <- read_tsv(input_tab) %>%
  filter(archive == "ENA" | archive == "SRA")

## Get RUN metadata
pb <- progress_bar$new(
  total = nrow(hostass_meta),
  format = "(:spin) Getting run metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)
hostass_samacc <- hostass_meta %>%
  mutate(run_metadata = map(archive_accession, ~ {
    pb$tick()
    get_run_from_sample_metadata(.x, v = F)
  })) %>%
  unnest(cols = c(run_metadata))

## Get EXPERIMENT metadata using experiment IDs stored in RUN table
pb <- progress_bar$new(
  total = nrow(hostass_samacc),
  format = "(:spin) Getting experiment metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)
hostass_expacc <- hostass_samacc %>%
  mutate(exp_metadata = map(experiment_accession, ~ {
    pb$tick()
    get_experiment_metadata(.x, v = F)
  })) %>%
  unnest()

## Select only relevant columns and save
## TODO BUG `project_name` and `publication_doi` are not saved?
hostass_expacc %>%
  column_cleanup(cols_of_interest) %>%
  write_tsv(paste0(tools::file_path_sans_ext(input_tab), "_librarymetadata.tsv", collapse = ""))
