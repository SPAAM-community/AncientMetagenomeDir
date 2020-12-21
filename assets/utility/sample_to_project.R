library(tidyverse)
library(jsonlite)
library(httr)
library(xml2)

path2 <- "https://www.ebi.ac.uk/ena/browser/api/xml/SRS4625244?download=false&gzip=false"

r <- GET(url = path2)

res <- str(content(r))

output <- as_list(content(r))

secondary_proj <- output$SAMPLE_SET$SAMPLE$SAMPLE_LINKS$SAMPLE_LINK$XREF_LINK$ID[[1]]

secondary_proj_rest <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", secondary_proj, "?download=false&gzip=false") %>% GET(url = .) %>% content %>% as_list

secondary_proj_rest$STUDY_SET$STUDY$IDENTIFIERS$SECONDARY_ID[[1]]
