suppressPackageStartupMessages(library(tidyverse))

previous_tag <- "v23.06.0"
release_tag <- "master"
new_release <- "v23.09.0"

## SAMPLES

previous_env_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv"), show_col_types = FALSE)
previous_microb_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv"), show_col_types = FALSE)
previous_single_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv"), show_col_types = FALSE)
previous_pubs_samples <- c(previous_env_samples$publication_doi, previous_microb_samples$publication_doi, previous_single_samples$publication_doi) %>%
       unique() %>%
       length()

new_env_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv"), show_col_types = FALSE)
new_microb_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv"), show_col_types = FALSE)
new_single_samples <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv"), show_col_types = FALSE)
new_pubs_samples <- c(new_env_samples$publication_doi, new_microb_samples$publication_doi, new_single_samples$publication_doi) %>%
       unique() %>%
       length()

adds_pubs_samples <- new_pubs_samples - previous_pubs_samples
adds_env_samples <- nrow(new_env_samples) - nrow(previous_env_samples)
adds_microb_samples <- nrow(new_microb_samples) - nrow(previous_microb_samples)
adds_single_samples <- nrow(new_single_samples) - nrow(previous_single_samples)

tot_pubs_samples <- new_pubs_samples
tot_env_samples <- nrow(new_env_samples)
tot_microb_samples <- nrow(new_microb_samples)
tot_single_samples <- nrow(new_single_samples)

## LIBRARIES

previous_env_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv"), show_col_types = FALSE)
previous_microb_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv"), show_col_types = FALSE)
previous_single_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv"), show_col_types = FALSE)
previous_pubs_libraries <- c(previous_env_libraries$data_publication_doi, previous_microb_libraries$data_publication_doi, previous_single_libraries$data_publication_doi) %>%
       unique() %>%
       length()

new_env_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv"), show_col_types = FALSE)
new_microb_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv"), show_col_types = FALSE)
new_single_libraries <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv"), show_col_types = FALSE)
new_pubs_libraries <- c(new_env_libraries$data_publication_doi, new_microb_libraries$data_publication_doi, new_single_libraries$data_publication_doi) %>%
       unique() %>%
       length()

adds_pubs_libraries <- new_pubs_libraries - previous_pubs_libraries
adds_env_libraries <- nrow(new_env_libraries) - nrow(previous_env_libraries)
adds_microb_libraries <- nrow(new_microb_libraries) - nrow(previous_microb_libraries)
adds_single_libraries <- nrow(new_single_libraries) - nrow(previous_single_libraries)

tot_pubs_libraries <- new_pubs_libraries
tot_env_libraries <- nrow(new_env_libraries)
tot_microb_libraries <- nrow(new_microb_libraries)
tot_single_libraries <- nrow(new_single_libraries)

## STATEMENTS

cat(
       "\nRelease", new_release,
       "includes", adds_pubs_samples, "new publications, representing",
       adds_microb_samples, "new ancient host-associated metagenome samples,",
       adds_single_samples, "new ancient microbial genomes, and",
       adds_env_samples, "new ancient environmental samples.",
       "This brings the repository to a total of",
       tot_pubs_samples, "publications,",
       tot_microb_samples, "ancient host-associated metagenome samples,",
       tot_single_samples, "ancient microbial genomes, and",
       tot_env_samples, "ancient environmental samples\n\nFurthermore, this release adds",
       adds_microb_libraries, "new ancient host-associated metagenome libraries,",
       adds_single_libraries, "new ancient microbial genome libraries, and",
       adds_env_libraries, "new ancient environmental libraries.",
       "This brings the repository to a total of",
       tot_microb_libraries, "ancient host-associated metagenome libraries,",
       tot_single_libraries, "ancient microbial genomes libraries, and",
       tot_env_libraries, "ancient environmental libraries.\n\n"
)
