library(tidyverse)

previous_tag <- "v21.09"
release_tag <- "master"
new_release <- "v22.09"

previous_env <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-environmental/ancientmetagenome-environmental.tsv"))
previous_microb <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv"))
previous_single <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv"))
previous_pubs <- c(previous_env$publication_doi, previous_microb$publication_doi, previous_single$publication_doi) %>% unique() %>% length

new_env <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv"))
new_microb <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv"))
new_single <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv"))
new_pubs <- c(new_env$publication_doi, new_microb$publication_doi, new_single$publication_doi) %>% unique() %>% length

adds_pubs <- new_pubs - previous_pubs
adds_env <- nrow(new_env) - nrow(previous_env)
adds_microb <- nrow(new_microb) - nrow(previous_microb)
adds_single <-  nrow(new_single) - nrow(previous_single)

tot_pubs <- new_pubs
tot_env <- nrow(new_env)
tot_microb <- nrow(new_microb)
tot_single <- nrow(new_single)

## TODO TO EXTEND TO INCLUDE LIBRARY

paste0("Release ", new_release, 
       " includes ", adds_pubs, " new publications, representing ", 
       adds_microb, " new ancient host-associated metagenome samples, ", 
       adds_single, " new ancient microbial genomes, and ", 
       adds_env , " new ancient environmental samples. ",
       "This brings the repository to a total of ", 
       tot_pubs, " publications, ",
       tot_microb,  " new ancient host-associated metagenome samples, ", 
       tot_single,  " ancient microbial genomes, and ", 
       tot_env,  " new ancient environmental samples"
       )
