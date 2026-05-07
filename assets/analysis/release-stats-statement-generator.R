suppressPackageStartupMessages(library(tidyverse))

previous_tag <- "v25.12.2"
release_tag <- "master"
new_release <- "v26.03.0"

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

## DATES

# previous_env_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-environmental/dates/ancientmetagenome-environmental_dates.tsv"), show_col_types = FALSE)
# previous_microb_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientmetagenome-hostassociated/dates/ancientmetagenome-hostassociated_dates.tsv"), show_col_types = FALSE)
previous_single_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", previous_tag, "/ancientsinglegenome-hostassociated/dates/ancientsinglegenome-hostassociated_dates.tsv"), show_col_types = FALSE)
# previous_pubs_dates <- c(previous_env_dates$data_publication_doi, previous_microb_dates$data_publication_doi, previous_single_dates$data_publication_doi) %>%
previous_pubs_dates <- c(previous_single_dates$data_publication_doi) %>%
       unique() %>%
       length()

# new_env_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-environmental/dates/ancientmetagenome-environmental_dates.tsv"), show_col_types = FALSE)
new_microb_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientmetagenome-hostassociated/dates/ancientmetagenome-hostassociated_dates.tsv"), show_col_types = FALSE)
new_single_dates <- read_tsv(paste0("https://github.com/SPAAM-community/AncientMetagenomeDir/raw/", release_tag, "/ancientsinglegenome-hostassociated/dates/ancientsinglegenome-hostassociated_dates.tsv"), show_col_types = FALSE)
# new_pubs_dates <- c(new_env_dates$data_publication_doi, new_microb_dates$data_publication_doi, new_single_dates$data_publication_doi) %>%
new_pubs_dates <- c(new_microb_dates$publication_doi, new_single_dates$publication_doi) %>%
       unique() %>%
       length()

adds_pubs_dates <- new_pubs_dates - previous_pubs_dates
# adds_env_dates <- nrow(new_env_dates) - nrow(previous_env_dates)
adds_microb_dates <- nrow(new_microb_dates) # - nrow(previous_microb_dates)
adds_single_dates <- nrow(new_single_dates) - nrow(previous_single_dates)

tot_pubs_dates <- new_pubs_dates
# tot_env_dates <- nrow(new_env_dates)
tot_microb_dates <- nrow(new_microb_dates)
tot_single_dates <- nrow(new_single_dates)

## STATEMENTS

cat("\n\n###### RELEASE ANNOUNCEMENT #######\n\n")

cat(
       "\nRelease", new_release,
       "includes", adds_pubs_samples, "new publications, representing",
       adds_microb_samples, "new ancient host-associated metagenome samples,",
       adds_single_samples, "new ancient microbial genomes, and",
       adds_env_samples, "new ancient environmental samples.",
       "This brings the repository to a total of",
       format(tot_pubs_samples, big.mark = ","), "publications,",
       format(tot_microb_samples, big.mark = ","), "ancient host-associated metagenome samples,",
       format(tot_single_samples, big.mark = ","), "ancient microbial genomes, and",
       format(tot_env_samples, big.mark = ","), "ancient environmental samples.\n\nFurthermore, this release adds",
       adds_microb_libraries, "new ancient host-associated metagenome libraries,",
       adds_single_libraries, "new ancient microbial genome libraries, and",
       adds_env_libraries, "new ancient environmental libraries.",
       "This brings the repository to a total of",
       format(tot_microb_libraries, big.mark = ","), "ancient host-associated metagenome libraries,",
       format(tot_single_libraries, big.mark = ","), "ancient microbial genomes libraries, and",
       format(tot_env_libraries, big.mark = ","), "ancient environmental libraries.\n\nFinally,",
       "this release adds",
       adds_microb_dates, "new ancient host-associated metagenome dates,",
       adds_single_dates, "new ancient microbial genome dates.",
       "This brings the repository to a total of",
       format(tot_microb_dates, big.mark = ","), "ancient host-associated metagenome dates and",
       format(tot_single_dates, big.mark = ","), "ancient microbial genomes dates.\n\n"
)

## TWITTER
cat("\n\n###### TWITTER #######\n\n")


cat(
       "\n🚨  New release of #AncientMetagenomeDir! (", new_release, ", <NAME GOES HERE>)\n",
       "https://github.com/SPAAM-community/AncientMetagenomeDir/releases/tag/", new_release, "\n",
       "It is a community resource of #metadata of >2K shotgun-sequenced #AncientMetagenome or ancient microbial genome enriched samples & >5K libraries. Stats below (🧵 1/5)\n\n",
       "\n📈 Release ", new_release, ": \n",
       "📚 ", tot_pubs_samples, " (+", adds_pubs_samples, ") publications\n",
       "🧬 ", tot_microb_samples, " (+", adds_microb_samples, ") ancient host-associated metagenome samples\n",
       "🦠 ", tot_single_samples, " (+", adds_single_samples, ") ancient microbial genomes\n",
       "🌅 ", tot_env_samples, " (+", adds_env_samples, ") ancient environmental samples\n(🧵 2/5)\n\n",
       "\n📈 More stats\n",
       "🧬 ", tot_microb_libraries, " (+", adds_microb_libraries, ") ancient host-associated metagenome libraries\n",
       "🦠 ", tot_single_libraries, " (+", adds_single_libraries, ") ancient microbial genome libraries\n",
       "🌅 ", tot_env_libraries, " (+", adds_env_libraries, ") ancient environmental libraries\n(🧵 3/5)\n\n",
       "\n📈 And even more stats\n",
       "🧬 ", tot_microb_dates, " (+", adds_microb_dates, ") ancient host-associated metagenome dates\n",
       "🦠 ", tot_single_dates, " (+", adds_single_dates, ") ancient microbial genome dates\n(🧵 4/5)\n\n",
       "\nMany thanks to <PEOPLE GO HERE>(🧵 5/5)\n",
       sep = ""
)

cat("\n\n###### MASTODON #######\n\n")

cat(
       "\n🚨  New release of AncientMetagenomeDir! (", new_release, ", <NAME GOES HERE>)\n",
       "https://github.com/SPAAM-community/AncientMetagenomeDir/releases/tag/", new_release, "\n",
       "It is a community resource of #metadata of >2K shotgun-sequenced #AncientMetagenome or ancient microbial genome enriched samples & >5K libraries. Stats below: \n",
       "\n📈 Release ", new_release, ": \n",
       "📚 ", tot_pubs_samples, " (+", adds_pubs_samples, ") publications\n",
       "🧬 ", tot_microb_samples, " (+", adds_microb_samples, ") ancient host-associated metagenome samples\n",
       "🦠 ", tot_single_samples, " (+", adds_single_samples, ") ancient microbial genomes\n",
       "🌅 ", tot_env_samples, " (+", adds_env_samples, ") ancient environmental samples\n\n#AncientDNA #palaeogenomics #aDNA #metagenomics(🧵 1/3)\n\n",
       "\n📈 More stats\n",
       "🧬 ", tot_microb_libraries, " (+", adds_microb_libraries, ") ancient host-associated metagenome libraries\n",
       "🦠 ", tot_single_libraries, " (+", adds_single_libraries, ") ancient microbial genome libraries\n",
       "🌅 ", tot_env_libraries, " (+", adds_env_libraries, ") ancient environmental libraries\n(🧵 2/3)\n\n",
       "\n📈 And even more stats\n",
       "🧬 ", tot_microb_dates, " (+", adds_microb_dates, ") ancient host-associated metagenome dates\n",
       "🦠 ", tot_single_dates, " (+", adds_single_dates, ") ancient microbial genome dates\n",
       "\nMany thanks to <PEOPLE GO HERE>(🧵 3/3)\n",
       sep = ""
)
