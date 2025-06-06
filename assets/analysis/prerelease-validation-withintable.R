library(tidyverse)

##################
## DATA LOADING ##
##################

## PREP: Load raw data ##

senv <-
  read_tsv(
    "ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv"
  )
shos <-
  read_tsv(
    "ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv"
  )
ssin <-
  read_tsv(
    "ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv"
  )

lenv <-
  read_tsv(
    "ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv"
  )
lhos <-
  read_tsv(
    "ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv"
  )
lsin <-
  read_tsv(
    "ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv"
  )

#################
## START TESTS ##
#################

## PREP: load data for archive_accession mismatch between tables? ###

senv_acc <- senv$archive_accession %>%
  strsplit(",") %>%
  unlist()
shos_acc <- shos$archive_accession %>%
  strsplit(",") %>%
  unlist()
ssin_acc <- ssin$archive_accession %>%
  strsplit(",") %>%
  unlist()

lenv_acc <-
  lenv$archive_sample_accession %>%
  strsplit(",") %>%
  unlist()
lhos_acc <-
  lhos$archive_sample_accession %>%
  strsplit(",") %>%
  unlist()
lsin_acc <-
  lsin$archive_sample_accession %>%
  strsplit(",") %>%
  unlist()

## TEST: Archive accession in sample, not library (missing): if no errors should result in character(0)
setdiff(senv_acc, lenv_acc)
setdiff(shos_acc, lhos_acc)
setdiff(ssin_acc, lsin_acc)

## TEST: Archive accession in library, not sample (unexpected extra): if no errors should result in character(0)
setdiff(lenv_acc, senv_acc)
setdiff(lhos_acc, shos_acc)
setdiff(lsin_acc, ssin_acc)

###############################
## DOI mismatch between tables? ###
###############################

## Prepare information for comparison ##

senv_doi <- senv$publication_doi %>%
  strsplit(",") %>%
  unlist()
shos_doi <- shos$publication_doi %>%
  strsplit(",") %>%
  unlist()
ssin_doi <- ssin$publication_doi %>%
  strsplit(",") %>%
  unlist()

lenv_doi <- lenv$data_publication_doi %>%
  strsplit(",") %>%
  unlist()
lhos_doi <- lhos$data_publication_doi %>%
  strsplit(",") %>%
  unlist()
lsin_doi <- lsin$data_publication_doi %>%
  strsplit(",") %>%
  unlist()


## TEST: Archive accession in sample, not library (missing): if no errors should result in character(0)
setdiff(senv_doi, lenv_doi)
setdiff(shos_doi, lhos_doi)
setdiff(ssin_doi, lsin_doi)

## TEST: Archive accession in library, not sample (unexpected extra): if no errors should result in character(0)
## Exception allowed: 10.1126/science.adf5300 (Klapper2023 reseq of FellowsYates2021 so no new samples)
setdiff(lenv_doi, senv_doi)
setdiff(lhos_doi, shos_doi)
setdiff(lsin_doi, ssin_doi)

####################################
## archive_accession duplicates? ###
####################################

## TEST: samples - expect one per accession: if no errors should result in A tibble 0 x 2

## For env: metagenome execeptions allow: none so far!
senv_dups <-
  senv$archive_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  print(n = 1000)

## For host ass. metagenome exceptions allowed: McDonough2018 [sample accession == museum specimen]
shos_dups <-
  shos$archive_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  filter(!archive_accession %in% c("SRS3118688", "SRS3118689", "SRS3151295")) %>%
  print(n = 1000)

## For single genome: exception allowed: Schuenemann2018/KrauseKyora2018b [resequencing], Krause-Kyora/Lugli [reanalysis],
## DeDios2020 [multi-species], Devault2017 [multi-species], Austin2022 [multi-species],
## Guellil2022 [multi-species], Bonczarowska2022 [multi-species]
## SeguinOrlando2021, Clavel2023 [sample re-use/reqseuqencing]
## Hodgkins2023 [sample re-use]
## White2021 [multi-species]
ssin_dup_exceptions <- c("ERS942272", "ERS942281", "ERS942282", "ERS4278128", "ERS4278129", "ERS4278130", "ERS942276", "SRS1779840", "SRS1779841", "SRS1779844", "SRS1779846", "SRS13524932", "ERS8968539", "ERS9069041", "ERS9069042", "ERS5823072", "ERS5823096", "ERS1020860", "ERS1124787", "ERS1892067", "ERS2020227", "ERS2865271", "ERS4266549", "ERS563409", "SRS591994", "SRS592075", "ERS9769380", "ERS9769381", "ERS9769382", "ERS9769383")

ssin_dups <-
  ssin$archive_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  filter(!archive_accession %in% ssin_dup_exceptions) %>%
  print(n = 1000)

## TEST: runs - expect one per accession: if no errors should result in A tibble 0 x 2

lenv_dups <-
  lenv$archive_data_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  print(n = 1000)

lhos_dups <-
  lhos$archive_data_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  print(n = 1000)

## Single genome exception allowed: Krause-Kyora/Lugli [reanalysis]
## Can exclude: c("ERR1094784","ERR1094793","ERR1094794","ERR4624258")
lsin_dup_exceptions <- c("ERR1094784", "ERR1094793", "ERR1094794", "ERR4624258", "ERR1193532", "ERR1193537", "ERR1368878", "ERR2112574", "ERR2112575", "ERR2112576", "ERR2112577", "ERR2112578", "ERR2204611", "ERR2204612", "ERR2204613", "ERR2204614", "ERR2204644", "ERR2862150", "ERR2862151", "ERR3841646", "ERR3841647", "ERR651004", "SRR1238558", "SRR1238559")

lsin_dups <-
  lsin$archive_data_accession %>%
  str_split(",") %>%
  unlist() %>%
  enframe(value = "archive_accession") %>%
  group_by(archive_accession) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  filter(n > 1) %>%
  filter(!archive_accession %in% lsin_dup_exceptions) %>%
  print(n = 1000)

### PULLER
## filter(ssin, archive_data_accession %in% lsin_dups$archive_accession)
## paste(ssin_dups$archive_accession,sep=",")
####
