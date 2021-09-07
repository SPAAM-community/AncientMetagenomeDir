
################# FUNCTIONS

find_project <- function(accession) {
  sample_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  secondary_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", secondary_proj_id, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  return(secondary_res$STUDY_SET$STUDY$IDENTIFIERS$SECONDARY_ID[[1]])
}

find_experiment_from_sample <- function(accession) {
  init_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  secondary_exp_id <- init_res$SAMPLE_SET$SAMPLE$SAMPLE_LINKS[[2]]$XREF_LINK$ID[[1]]
  return(secondary_exp_id)
}

find_run_from_experiment <- function(accession) {
  run_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  secondary_run_id <- run_res$RUN_SET$RUN$RUN_LINKS[[3]]$XREF_LINK$ID[[1]]
  return(secondary_run_id)
}

find_multiple_project <- function(archive, accession_list) {
  print(accession_list)
  
  if (archive %in% c("SRA", "ENA")) {
    acc_vec <- str_split(accession_list, ",") %>% unlist()
    proj_res <- map(acc_vec, find_project) %>%
      unlist() %>%
      unique()
    return(paste0(proj_res, collapse = ","))
  } else {
    return("NOT_INDSC")
  }
}

ancient_metagenome <- read_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv")

# ancient_metagenome <- mutate(ancient_metagenome, archive_project = map2(archive, archive_accession, find_multiple_project)) %>%
# relocate(archive_project, archive_accession, .after = last_col()) %>%
# mutate(archive_project = unlist(archive_project)) %>%
# write_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv")

# ancient_metagenome

get_ena_metadata <- function(x) {
  init_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", x, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  return(init_res)
}

parse_ena_metadata <- function(x) {
  result_tab <- x %>%
    pluck(names(.), 1) %>%
    enframe()
  
  result_tab_long <- run_tab %>%
    unnest_longer(value) %>%
    pull(value) %>%
    unlist() %>%
    enframe() %>%
    filter(!grepl("XREF_LINK", name))
  
  return(result_tab_long)
}

## REMAING STEP:
## - ERS to ERX/ERR
## - link output wiht "ena_run_fields" extraction

get_ena_metadata("ERX3729405") %>% parse_ena_metadata()



############# VERSION THREE

## MISSING: SAMPLE TO EXP -> EXP TO RUN (makure sure get leading ID into output table of reach)

get_ena_accession <- function(x) {
  init_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", x, "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content() %>%
    as_list()
  return(init_res)
}
