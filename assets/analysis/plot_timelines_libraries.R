#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(maps)
library(scales)
library(tibble)
library(paletteer)

source("assets/analysis/functions.R")
source("assets/analysis/design_assets.R")

out_dir <- "assets/images/figures"

raw_hostmetagenome   <- load_thedir_data("ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv", "Host Associated Metagenome")
raw_hostsinglegenome <- load_thedir_data("ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv", "Host Associated Single Genome")
raw_environmental    <- load_thedir_data("ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv", "Environmental Metagenome")

figure_cumu_timeline_libs  <- stats_cumulative_timeline_libs(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental) %>% plot_cumulative_timeline_libreads("libraries")
figure_cumu_timeline_reads <- stats_cumulative_timeline_reads(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental) %>% plot_cumulative_timeline_libreads("reads")

figure_cumu_timeline_libs_model     <- stats_cumulative_timeline_libs_grouped(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental, group = instrument_model, unspecified = "unspecified") %>% plot_cumulative_timeline_libs_grouped("libraries", "instrument model")
figure_cumu_timeline_libs_libtreat  <- stats_cumulative_timeline_libs_grouped(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental, group = library_treatment, unspecified = "unknown") %>% plot_cumulative_timeline_libs_grouped("libraries", "library treatment")
figure_cumu_timeline_libs_liblayout <- stats_cumulative_timeline_libs_grouped(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental, group = library_layout, unspecified = NA) %>% plot_cumulative_timeline_libs_grouped("libraries", "library layout")
figure_cumu_timeline_libs_strand    <- stats_cumulative_timeline_libs_grouped(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental, group = strand_type, unspecified = "unknown") %>% plot_cumulative_timeline_libs_grouped("libraries", "library strandedness")

save_figure("AncientMetagenomeDir-Library_Timeline_Libraries.svg", outdir = out_dir, figure_cumu_timeline_libs)
save_figure("AncientMetagenomeDir-Library_Timeline_Reads.svg"    , outdir = out_dir, figure_cumu_timeline_reads)

save_figure_wide("AncientMetagenomeDir-Library_Timeline_Libraries_InstrumentModel.svg" , outdir = out_dir, figure_cumu_timeline_libs_model)
save_figure_wide("AncientMetagenomeDir-Library_Timeline_Libraries_LibraryTreatment.svg", outdir = out_dir, figure_cumu_timeline_libs_libtreat)
save_figure_wide("AncientMetagenomeDir-Library_Timeline_Libraries_LibraryLayout.svg"   , outdir = out_dir, figure_cumu_timeline_libs_liblayout)
save_figure_wide("AncientMetagenomeDir-Library_Timeline_Libraries_StrandType.svg"      , outdir = out_dir, figure_cumu_timeline_libs_strand)
