library(tidyverse)
library(jsonlite)
library(httr)
library(xml2)

find_project_accession <- function(accession){
  sample_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>% GET(url = .) %>% content %>% as_list
  secondary_proj_id <- sample_res$SAMPLE_SET$SAMPLE$SAMPLE_LINKS$SAMPLE_LINK$XREF_LINK$ID[[1]]
  secondary_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", secondary_proj_id, "?download=false&gzip=false") %>% GET(url = .) %>% content %>% as_list
  return(secondary_res$STUDY_SET$STUDY$IDENTIFIERS$SECONDARY_ID[[1]])
}

find_multiple_project_accession <- function(accession_list) {
  acc_vec <- str_split(accession_list, ",") %>% unlist
  proj_res <- map(acc_vec, find_project_accession) %>% unlist %>% unique
  return(paste0(proj_res, collapse = ","))
}

#find_project_accession("SRS4625244")

ancient_metagenome <- read_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv")

ancient_metagenome <- mutate(ancient_metagenome, archive_project_accession = map(archive_accession, find_multiple_project_accession))

## Multi test
accession <- paste0(ancient_metagenome$archive_accession[100:104], collapse ="%2C")
search_url <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession)
GET(url = search_url, timeout(60)) %>% content

## BIG TEST
multi_accession <- ancient_metagenome %>% filter(archive %in% c("ENA","SRA")) %>% pull(archive_accession) %>% str_split(",") %>% unlist
accession <- paste0(multi_accession, collapse ="%2C")
search_url <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession)
search_res <- GET(url = search_url)

## There is a bad ID somewhere!!! find it! Might need to do a loop...
