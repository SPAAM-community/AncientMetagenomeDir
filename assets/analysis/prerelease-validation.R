library(tidyverse)

senv <- read_tsv("ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv")
shos <- read_tsv("ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv")
ssin <- read_tsv("ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv")

lenv <- read_tsv("ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv")
lhos <- read_tsv("ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv")
lsin <- read_tsv("ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv")

senv_acc <- senv$archive_accession %>% strsplit(",") %>% unlist
shos_acc <- shos$archive_accession %>% strsplit(",") %>% unlist
ssin_acc <- ssin$archive_accession %>% strsplit(",") %>% unlist

lenv_acc <- lenv$archive_sample_accession %>% strsplit(",") %>% unlist
lhos_acc <- lhos$archive_sample_accession %>% strsplit(",") %>% unlist
lsin_acc <- lsin$archive_sample_accession %>% strsplit(",") %>% unlist

## In sample, not library
setdiff(senv_acc, lenv_acc)
setdiff(shos_acc, lhos_acc)
setdiff(ssin_acc, lsin_acc)

## In library, not sample
setdiff(lenv_acc, senv_acc)
setdiff(lhos_acc, shos_acc)
setdiff(lsin_acc, ssin_acc)


one <- c(1,2,3)
two <- c(2,3,4)
