library(tidyverse)
library(maps)

source("assets/analysis/functions.R")
source("assets/analysis/design_assets.R")

raw_hostmetagenome <- load_thedir_data("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv", "Host Associated Metagenome") 
raw_hostsinglegenome <- load_thedir_data("ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv", "Host Associated Single Genome") 
raw_environmental <- load_thedir_data("ancientmetagenome-environmental/ancientmetagenome-environmental.tsv", "Environmental Metagenome") 
#raw_anthropogenic <- load_thedir_data("../../ancientmetagenome-anthropogenic/ancientmetagenome-anthropogenic.tsv", "Anthropogenic Metagenome") 

data_map <- stats_map(raw_hostmetagenome, raw_hostsinglegenome, raw_environmental)

figure_map <- plot_map(data_map)

# ggsave("AncientMetagenomeDir-Sample_Map.pdf",
#        path = "assets/analysis/live/",
#        figure_map,
#        device = cairo_pdf(),
#        units = "in",
#        width = 3.5,
#        height = 7
# )

ggsave("AncientMetagenomeDir-Sample_Map.png",
       path = "assets/analysis/live/",
       figure_map,
       device = "png",
       units = "in",
       width = 3.5,
       height = 7
)