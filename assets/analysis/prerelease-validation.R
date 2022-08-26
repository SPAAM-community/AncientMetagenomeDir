library(tidyverse)

senv <- read_tsv("ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv") %>% mutate(Table = "Environment")
shos <- read_tsv("ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv") %>% mutate(Table = "HostAssociatedMetagenome")
ssin <- read_tsv("ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv") %>% mutate(Table = "HostAssociatedSingle")

lenv <- read_tsv("ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv") %>% mutate(Table = "Environment")
lhos <- read_tsv("ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv") %>% mutate(Table = "HostAssociatedMetagenome")
lsin <- read_tsv("ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv") %>% mutate(Table = "HostAssociatedSingle")

###############
### SRS IDS ###
###############


senv_acc <- senv$archive_accession %>% strsplit(",") %>% unlist
shos_acc <- shos$archive_accession %>% strsplit(",") %>% unlist
ssin_acc <- ssin$archive_accession %>% strsplit(",") %>% unlist

lenv_acc <- lenv$archive_sample_accession %>% strsplit(",") %>% unlist
lhos_acc <- lhos$archive_sample_accession %>% strsplit(",") %>% unlist
lsin_acc <- lsin$archive_sample_accession %>% strsplit(",") %>% unlist

## In sample, not library
env_s_no_l <- setdiff(senv_acc, lenv_acc)
hos_s_no_l <-setdiff(shos_acc, lhos_acc)
sin_s_no_l <- setdiff(ssin_acc, lsin_acc)

## In library, not sample
env_l_no_s <- setdiff(lenv_acc, senv_acc)
hos_l_no_s <- setdiff(lhos_acc, shos_acc)
sin_l_no_s <- setdiff(lsin_acc, ssin_acc)

## In sample, not library
bind_rows(
  senv %>% filter(archive_accession %in% env_s_no_l) %>% select(Table, project_name, publication_doi, sample_name, archive_accession),
  shos %>% filter(archive_accession %in% hos_s_no_l) %>% select(Table, project_name, publication_doi, sample_name, archive_accession),
  ssin %>% filter(archive_accession %in% sin_s_no_l) %>% select(Table, project_name, publication_doi, sample_name, archive_accession),
) #%>% write_tsv("assets/analysis/samples_without_libraries.csv")

## In library, not sample
bind_rows(
  lenv %>% filter(archive_sample_accession %in% env_l_no_s) %>% select(Table, project_name, data_publication_doi, sample_name, archive_sample_accession, archive_data_accession),
  lhos %>% filter(archive_sample_accession %in% hos_l_no_s) %>% select(Table, project_name, data_publication_doi, sample_name, archive_sample_accession, archive_data_accession),
  lsin %>% filter(archive_sample_accession %in% sin_l_no_s) %>% select(Table, project_name, data_publication_doi, sample_name, archive_sample_accession, archive_data_accession),
) #%>% write_tsv("assets/analysis/libraries_without_samples.csv")

#################
## PROJECT IDS ##
#################

senv_acc <- senv$project_name %>% strsplit(",") %>% unlist
shos_acc <- shos$project_name %>% strsplit(",") %>% unlist
ssin_acc <- ssin$project_name %>% strsplit(",") %>% unlist

lenv_acc <- lenv$project_name %>% strsplit(",") %>% unlist
lhos_acc <- lhos$project_name %>% strsplit(",") %>% unlist
lsin_acc <- lsin$project_name %>% strsplit(",") %>% unlist

## In sample, not library
env_s_no_l <- setdiff(senv_acc, lenv_acc)
hos_s_no_l <-setdiff(shos_acc, lhos_acc)
sin_s_no_l <- setdiff(ssin_acc, lsin_acc)

## In library, not sample
env_l_no_s <- setdiff(lenv_acc, senv_acc)
hos_l_no_s <- setdiff(lhos_acc, shos_acc)
sin_l_no_s <- setdiff(lsin_acc, ssin_acc)

env_s_no_l
hos_s_no_l
sin_s_no_l

env_l_no_s
hos_l_no_s
sin_l_no_s

#################
## DOIS ##
#################

senv_acc <- senv$publication_doi %>% strsplit(",") %>% unlist
shos_acc <- shos$publication_doi %>% strsplit(",") %>% unlist
ssin_acc <- ssin$publication_doi %>% strsplit(",") %>% unlist

lenv_acc <- lenv$data_publication_doi %>% strsplit(",") %>% unlist
lhos_acc <- lhos$data_publication_doi %>% strsplit(",") %>% unlist
lsin_acc <- lsin$data_publication_doi %>% strsplit(",") %>% unlist

## In sample, not library
env_s_no_l <- setdiff(senv_acc, lenv_acc)
hos_s_no_l <- setdiff(shos_acc, lhos_acc)
sin_s_no_l <- setdiff(ssin_acc, lsin_acc)

env_s_no_l
hos_s_no_l
sin_s_no_l

## In library, not sample
env_l_no_s <- setdiff(lenv_acc, senv_acc)
hos_l_no_s <- setdiff(lhos_acc, shos_acc)
sin_l_no_s <- setdiff(lsin_acc, ssin_acc)

env_l_no_s
hos_l_no_s
sin_l_no_s
