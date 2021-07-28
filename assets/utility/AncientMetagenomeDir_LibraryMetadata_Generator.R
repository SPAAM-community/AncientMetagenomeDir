#! /usr/bin/env Rscript

# https://github.com/docopt/docopt.R

initial.options <- commandArgs(trailingOnly = FALSE)

input_tab <- initial.options[6]
verbose <- initial.options[7]

## TESTING ######################

## TODO: Check all samples have info or at least NA for all columns
# verbose <- TRUE

#################################

## Add check of required
require(tidyverse)
require(jsonlite)
require(httr)
require(xml2)
require(progress)

## Find location of script to load aux. files
file.arg.name <- "--file="
script.name <- sub(file.arg.name, "", initial.options[grep(file.arg.name, initial.options)])
script.basename <- dirname(script.name)

source(paste0(script.basename, "/library_pull_data.R"))
source(paste0(script.basename, "/library_pull_functions.R"))

## Load table -> TEST WHEN DO NOT FILTER TO ENA/SRA
thedir_sampletab <- read_tsv(input_tab)

## Get RUN metadata
pb <- progress_bar$new(
  total = nrow(thedir_sampletab),
  format = "(:spin) Getting run metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)
thedir_runacc <- thedir_sampletab %>%
  mutate(run_metadata = map(archive_accession, ~ {
    pb$tick()
    get_run_from_sample_metadata(.x, v = verbose)
  })) %>%
  unnest(cols = c(run_metadata))

## initialise empty exp. template, as inconsistent exp. metadata, so better to
## propagate known columns of interest and leave everything else as NA
exp_template <- indsc_exp_fields %>% enframe()
exp_template_empty <- exp_template %>%
  select(name) %>%
  mutate(value = NA) %>%
  pivot_wider(names_from = name, values_from = value)

## Get EXPERIMENT metadata using experiment IDs stored in RUN table
pb <- progress_bar$new(
  total = nrow(thedir_runacc),
  format = "(:spin) Getting experiment metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)
thedir_runacc_exp <- thedir_runacc$experiment_accession %>%
  map(~ {
    pb$tick()
    get_experiment_metadata(., v = verbose)
  }) %>%
  bind_rows()

thedir_runacc_exp_final <- thedir_runacc_exp %>%
  left_join(thedir_runacc, ., by = c("experiment_accession" = "experiment_id", "experiment_title", "library_name", "library_strategy", "library_source", "library_selection"))

## Select only relevant columns and save
thedir_runacc_exp_final %>%
  distinct() %>%
  column_cleanup(cols_of_interest) %>%
  write_tsv(paste0(tools::file_path_sans_ext(input_tab), "_librarymetadata.tsv", collapse = ""))
