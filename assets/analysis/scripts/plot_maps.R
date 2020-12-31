#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(maps)
library(scales)
library(tibble)

source("assets/analysis/scripts/functions.R")
source("assets/analysis/design_assets.R")

out_dir = "assets/analysis/live"

raw_hostmetagenome <- load_thedir_data("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv", "Host Associated Metagenome") 
raw_hostsinglegenome <- load_thedir_data("ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv", "Host Associated Single Genome") 
raw_environmental <- load_thedir_data("ancientmetagenome-environmental/ancientmetagenome-environmental.tsv", "Environmental Metagenome") 
#raw_anthropogenic <- load_thedir_data("../../ancientmetagenome-anthropogenic/ancientmetagenome-anthropogenic.tsv", "Anthropogenic Metagenome") 

data_map <- stats_map(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental)

figure_map <- plot_map(data_map)

ggsave("AncientMetagenomeDir-Sample_Map.pdf",
       path = out_dir,
       plot = figure_map,
       device = "pdf",
       units = "in",
       width = 5,
       height = 6,
       scale = 0.8
)

ggsave("AncientMetagenomeDir-Sample_Map.png",
       path = out_dir,
       plot = figure_map,
       device = "png",
       units = "in",
       width = 5,
       height = 6,
       scale = 0.8
)
