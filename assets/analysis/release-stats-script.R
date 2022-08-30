#!/usr/bin/env R

library(tidyverse)
library(zen4R)

##############################
## Release Stats Generation ##
##############################


## Download previous release from Zenodo: https://doi.org/10.5281/zenodo.3980833

## Load previous release files
old_path <- "/home/jfellows/Downloads/AncientMetagenomeDir-v21.09/SPAAM-community-AncientMetagenomeDir-d9610d3/"

old_senv <- read_tsv(paste0(old_path, "ancientmetagenome-environmental/ancientmetagenome-environmental.tsv"))
old_shos <- read_tsv(paste0(old_path, "ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv"))
old_ssin <- read_tsv(paste0(old_path, "ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv"))

## after v22.09 onwards
#old_senv <- read_tsv(paste0(old_path, "ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv"))
#old_shos <- read_tsv(paste0(old_path, "ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv"))
#old_ssin <- read_tsv(paste0(old_path, "ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv"))
#old_lenv <- read_tsv(paste0(old_path, "ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv"))
#old_lhos <- read_tsv(paste0(old_path, "ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv"))
#old_lsin <- read_tsv(paste0(old_path, "ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv"))

## Load new release files

new_senv <- read_tsv("ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv")
new_shos <- read_tsv("ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv")
new_ssin <- read_tsv("ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv")
new_lenv <- read_tsv("ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv")
new_lhos <- read_tsv("ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv")
new_lsin <- read_tsv("ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv")

## Find differences

## New
print("PUBLICATIONS")

old_pubs <- c(old_senv$project_name, old_shos$project_name, old_ssin$project_name) %>% unique
new_pubs <- c(new_senv$project_name, new_shos$project_name, new_ssin$project_name) %>% unique

## DOESN'T REPORT REMOVED!
print(paste("New:", length(new_pubs), "Old:", length(old_pubs), "Gain:", length(new_pubs) - length(old_pubs)))

print("SAMPLES")
for ( i in c("senv", "shos", "ssin")) {
  old_res <- paste0("old_", i)
  new_res <- paste0("new_", i)
  
  old_n <- nrow(eval(as.name(old_res)))
  new_n <-  nrow(eval(as.name(new_res)))
  
  new_diff <- new_n - old_n
  
  print(paste(old_res,":", old_n))
  print(paste(new_res,":", new_n))
  print(paste(i, "change:", new_diff))
}

print("LIBRARIES")
for ( i in c("lenv", "lhos", "lsin")) {
  #old_res <- paste0("old_", i)
  new_res <- paste0("new_", i)
  
  #old_n <- nrow(eval(as.name(old_res)))
  new_n <-  nrow(eval(as.name(new_res)))
  
  #new_diff <- new_n - old_n
  
  #print(paste(old_res,":", old_n))
  print(paste(new_res,":", new_n))
  #print(paste("change:", new_diff))
}

### MESSAGE

##Release v22.09 includes 7 new publications, representing XXX new ancient host-associated metagenome samples, XX new ancient microbial genomes, and XX new ancient environmental samples.

##It adds XXX new new ancient host-associated metagenome libraries, XX new ancient microbial genome libraries, and XX new ancient environmental libraries.


##This brings the repository to a total of 132 publications, 1038 new ancient host-associated metagenome samples, 368 ancient microbial genomes, and 375 new ancient environmental samples.


## Load latest release

## Compare and print stats test
