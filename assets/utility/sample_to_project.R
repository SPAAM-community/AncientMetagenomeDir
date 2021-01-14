library(tidyverse)
library(jsonlite)
library(httr)
library(xml2)

find_project <- function(accession){
  sample_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>% GET(url = .) %>% content %>% as_list
  secondary_proj_id <- sample_res$SAMPLE_SET$SAMPLE$SAMPLE_LINKS$SAMPLE_LINK$XREF_LINK$ID[[1]]
  secondary_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", secondary_proj_id, "?download=false&gzip=false") %>% GET(url = .) %>% content %>% as_list
  return(secondary_res$STUDY_SET$STUDY$IDENTIFIERS$SECONDARY_ID[[1]])
}

find_multiple_project <- function(archive, accession_list) {
  print(accession_list)
  
  if (archive %in% c("SRA", "ENA")) {
  acc_vec <- str_split(accession_list, ",") %>% unlist
  proj_res <- map(acc_vec, find_project) %>% unlist %>% unique
  return(paste0(proj_res, collapse = ","))
  } else {
    return("NOT_INDSC")
  }
}

#find_project("SRS4625244")

## This workS!!!
ancient_metagenome <- read_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv")
ancient_metagenome <- mutate(ancient_metagenome, archive_project = map2(archive, archive_accession, find_multiple_project)) %>% 
  relocate(archive_project, archive_accession, .after = last_col()) %>% 
  mutate(archive_project = unlist(archive_project)) %>% 
  write_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv")

ancient_singlegenome <- read_tsv("ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv")
ancient_singlegenome <- mutate(ancient_singlegenome, archive_project = map2(archive, archive_accession, find_multiple_project)) %>%
  relocate(archive_project, archive_accession, .after = last_col()) %>%
  mutate(archive_project = unlist(archive_project)) %>% 
  write_tsv("ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv")

ancient_environmental <- read_tsv("ancientmetagenome-environmental/ancientmetagenome-environmental.tsv")
ancient_environmental <- mutate(ancient_environmental, archive_project = map2(archive, archive_accession, find_multiple_project)) %>% 
  relocate(archive_project, archive_accession, .after = last_col()) %>%
  mutate(archive_project = unlist(archive_project)) %>% 
  write_tsv("ancientmetagenome-environmental/ancientmetagenome-environmental.tsv")


## Extras

## Multiple accessions on uery - Mini
# accession <- paste0(ancient_metagenome$archive_accession[100:104], collapse ="%2C")
# search_url <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession)
# GET(url = search_url, timeout(60)) %>% content

## Multiple accessions on uery - Mwhole list
multi_accession <- ancient_metagenome %>% filter(archive %in% c("ENA","SRA")) %>% pull(archive_accession) %>% str_split(",") %>% unlist
accession <- paste0(multi_accession, collapse ="%2C")
search_url <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession)
search_res <- GET(url = search_url)

## Discrepencant IDs from different projects test

accession <- "SRS473747,ERS2985765,ERS2985815,ERS3881533"
