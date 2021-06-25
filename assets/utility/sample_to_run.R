require(tidyverse)
require(jsonlite)
require(httr)
require(xml2)
require(progress)

source("assets/utility/library_pull_data.R")
source("assets/utility/library_pull_functions.R")


hostass_meta <- read_tsv(file = "ancientsinglegenome-hostassociated/ancientsinglegenome-hostassociated.tsv")

pb <- progress_bar$new(
  total = nrow(hostass_meta),
  format = "(:spin) Getting run metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)


####### TO FIX ############

get_run_from_sample_metadata <- function(accession, v = FALSE) {
  if (v == T) {
    print(paste("[DEBUG] get_run_from_sample_metadata() - querying accession", accession))
  }
  
  ## Split anything combined by commas, as api only accepts one at a time
  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - any combined splitting accessions")
  }
  all_accs <- accession %>%
    str_split(",") %>%
    unlist()
  
  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - generating all URLs")
  }
  acc_urls <- paste0("https://www.ebi.ac.uk/ena/portal/api/filereport?accession=", all_accs, "&result=read_run&fields=", ena_run_fields)
  
  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - querying ENA...")
  }
  query_res <- map(acc_urls, ~ call_ena_home(.x, v = v))
  
  if(is.null(query_res[[1]])) {
    print(paste0("[WARN] following accession had no metadata returned from ENA: ", accession, collapse = ""))
    return(NA)
  } 
  
  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - converting to table...")
  }
  final_tab <- map(query_res, ~ read_tsv(.x) %>% mutate(across(everything(), as.character))) %>% bind_rows()
  
  return(final_tab)
}
########################### BUG ONE
get_run_from_sample_metadata("ERS2295393", v = T)
## Problem with: "ERS2295393"

############################ BUG TWO

pb <- progress_bar$new(
  total = nrow(hostass_meta),
  format = "(:spin) Getting run metadata [:bar] :percent eta: :eta",
  clear = FALSE, width = 60
)
hostass_samacc <- hostass_meta %>%
  mutate(run_metadata = if_else(archive %in% c("ENA", "SRA"), map(archive_accession, ~ {
    pb$tick()
    get_run_from_sample_metadata(.x, v = T)
  }), NA)) %>%
  unnest(cols = c(run_metadata))

