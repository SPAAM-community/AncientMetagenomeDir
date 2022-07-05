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

# Combine data
dat_hist <- stats_age_timeline(raw_hostmetagenome,
                              raw_hostsinglegenome,
                              raw_environmental) #%>%
#filter(sample_age < 50000)

# Plot the histograms - generating eachone separately as each need their own 
## custom binning mechanism to ensure readable plots
nclass <- "FD"
p1 <- plot_figure_age_timeline(dat_hist, dataset = "Host Associated Metagenome", nclass = nclass, log = TRUE, group_order = names(dir_colours))
p2 <- plot_figure_age_timeline(dat_hist, dataset = "Host Associated Single Genome", nclass = nclass, log = TRUE, group_order = names(dir_colours))
p3 <- plot_figure_age_timeline(dat_hist, dataset = "Environmental Metagenome", nclass = nclass, log = TRUE, group_order = names(dir_colours))

# Combine the histograms
figure_age_timeline <- ggplot() +
  geom_bar(stat = "identity", data = p1$data, aes(breaks, counts, fill = List),width = unique(p1$data$width), position = position_nudge(x = unique(p1$data$nudge))) +
  geom_bar(stat = "identity", data = p2$data, aes(breaks, counts, fill = List), width = unique(p2$data$width), position = position_nudge(x = unique(p2$data$nudge))) +
  geom_bar(stat = "identity", data = p3$data, aes(breaks, counts, fill = List), width = unique(p3$data$width), position = position_nudge(x = unique(p3$data$nudge))) +
  # scale_x_reverse() +
  scale_y_sqrt() +
  scale_x_reverse(breaks = c(2,3,4,5), labels = scales::comma(c(10^2, 10^3, 10^4, 10^5)), limits = c(5, 2)) +
  theme_classic() +
  scale_fill_manual(values = dir_colours, guide = guide_legend(ncol = 1, title = ""), breaks = names(dir_colours)) +
  labs(fill = NULL) +
  theme(legend.position = "none") +
  labs(x = "Samples (n)",
       y = "Years before present",
       title = "Age distribution of samples", 
       subtitle = paste("Updated:", Sys.Date()),
       caption =  expression(paste(bold("License: "), "CC-BY 4.0. ", bold("Source: "), "AncientMetagenomeDir"))) +
  facet_wrap(~factor(List, levels = names(dir_colours)), ncol = 1)

ggsave("AncientMetagenomeDir-Sample_AgeTimeline.svg",
       plot = figure_age_timeline,
       path = out_dir,
       device = "svg",
       units = "in",
       width = 5,
       height = 6,
       scale = 0.8
)
