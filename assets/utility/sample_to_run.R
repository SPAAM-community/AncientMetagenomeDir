library(tidyverse)
library(jsonlite)
library(httr)
library(xml2)

## Load table -> TEST WHEN DO NOT FILTER TO ENA/SRA
hostass_meta <- read_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv") %>%
  filter(archive == "ENA" | archive == "SRA") %>%
  slice_tail(n = 200)

## Get RUN metadata
hostass_samacc <- hostass_meta %>%
  mutate(run_metadata = map(archive_accession, ~ get_run_from_sample_metadata(.x, v = T))) %>%
  unnest(cols = c(run_metadata))

## Get EXPERIMENT metadata using experiment IDs stored in RUN table
hostass_expacc <- hostass_samacc %>% mutate(exp_metadata = map(experiment_accession, ~ get_experiment_metadata(.x, v = T))) %>% unnest()

## Select only relevant columns and save
hostass_expacc %>% column_cleanup(cols_of_interest) %>% write_tsv("~/Downloads/thedir_libmetadata_v3.tsv")

#hostass_expacc %>% select(!!!cols_of_interest) %>% write_tsv("~/Downloads/thedir_libmetadata_v3.tsv")

