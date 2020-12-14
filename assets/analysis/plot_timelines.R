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

out_dir = paste0(args[1], "assets/analysis/live", sep="")

raw_hostmetagenome <- load_thedir_data("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv", "Host Associated Metagenome") 
raw_hostsinglegenome <- load_thedir_data("ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv", "Host Associated Single Genome") 
raw_environmental <- load_thedir_data("ancientmetagenome-environmental/ancientmetagenome-environmental.tsv", "Environmental Metagenome") 
#raw_anthropogenic <- load_thedir_data("../../ancientmetagenome-anthropogenic/ancientmetagenome-anthropogenic.tsv", "Anthropogenic Metagenome") 

figure_publication_time <- stats_pub_timeline(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental) %>% plot_pub_timeline()

figure_cumulative_samples <- stats_cumulative_timeline(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental) %>% plot_cumulative_timeline()

print(getwd())

# ggsave("AncientMetagenomeDir-Publication_Timeline.pdf",
#        path = out_dir,
#        figure_publication_time,
#        device = cairo_pdf(),
#        units = "in",
#        width = 3.5,
#        height = 4,
#        scale = 2
# )

ggsave("AncientMetagenomeDir-Publication_Timeline.png",
       path = out_dir,
       figure_publication_time,
       device = "png",
       units = "in",
       width = 3.5,
       height = 4,
       scale = 2
)

# ggsave("AncientMetagenomeDir-Sample_Timeline.pdf",
#        path = out_dir,
#        figure_cumulative_samples,
#        device = cairo_pdf(),
#        units = "in",
#        width = 3.5,
#        height = 4,
#        scale = 2
# )

ggsave("AncientMetagenomeDir-Sample_Timeline.png",
       path = out_dir,
       figure_cumulative_samples,
       device = "png",
       units = "in",
       width = 3.5,
       height = 4,
       scale = 2
)