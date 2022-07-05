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

source("assets/analysis/functions.R")
source("assets/analysis/design_assets.R")

out_dir = "assets/analysis/live"

raw_hostmetagenome <- load_thedir_data("ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv", "Host Associated Metagenome") 
raw_hostsinglegenome <- load_thedir_data("ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv", "Host Associated Single Genome") 
raw_environmental <- load_thedir_data("ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv", "Environmental Metagenome") 

data_map <- stats_map(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental)

figure_map <- plot_map(data_map)

ggsave("AncientMetagenomeDir-Sample_Map.svg",
       path = out_dir,
       plot = figure_map,
       device = "svg",
       units = "in",
       width = 5,
       height = 6,
       scale = 0.8
)
