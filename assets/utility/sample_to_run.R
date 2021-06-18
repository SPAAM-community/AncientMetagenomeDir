library(tidyverse)
library(jsonlite)
library(httr)
library(xml2)

########## DATA #######################################

## Copied from completed ENA browser table
ena_run_fields <- c(
  "base_count", "broker_name", "center_name", "cram_index_aspera", "cram_index_ftp", "cram_index_galaxy", "experiment_accession", "experiment_alias",
  "experiment_title", "fastq_aspera", "fastq_bytes", "fastq_ftp", "fastq_galaxy", "fastq_md5", "first_created", "first_public", "instrument_model",
  "instrument_platform", "last_updated", "library_layout", "library_name", "library_selection", "library_source", "library_strategy", "nominal_length",
  "nominal_sdev", "read_count", "run_accession", "run_alias", "sample_accession", "sample_alias", "sample_title", "scientific_name",
  "secondary_sample_accession", "secondary_study_accession", "sra_aspera", "sra_bytes", "sra_ftp", "sra_galaxy", "sra_md5", "study_accession", "study_alias",
  "study_title", "submission_accession", "submitted_aspera", "submitted_bytes", "submitted_format", "submitted_ftp", "submitted_galaxy", "submitted_md5", "tax_id"
) %>%
  paste0(collapse = ",")

## Taken from output of get_experiment_metadata function

# get_experiment_metadata <- function(accession) {
#   exp_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", accession, "?download=false&gzip=false") %>%
#     GET(url = .) %>%
#     content() %>%
#     as_list()
#   filtered_results <- exp_res$EXPERIMENT_SET$EXPERIMENT[!grepl("EXPERIMENT_LINK|EXPERIMENT_ATTRIBUTES", names(exp_res$EXPERIMENT_SET$EXPERIMENT))] %>%
#     unlist() %>%
#     enframe() %>%
#     pivot_wider(names_from = name, values_from = value, values_fn = list)
#   return(filtered_results)
# }
#
# exm_exp_tab <- get_experiment_metadata("ERX3576974")
# names(exm_exp_tab)

## Note study_secondary_accession = "STUDY_REF.IDENTIFIERS.SECONDARY_ID", doesn't exist for SRA?

ena_exp_fields <- c(
  experiment_id = "IDENTIFIERS.PRIMARY_ID",
  submitter_id = "IDENTIFIERS.SUBMITTER_ID",
  experiment_title = "TITLE",
  study_primary_accession = "STUDY_REF.IDENTIFIERS.PRIMARY_ID",
  library_design_description = "DESIGN.DESIGN_DESCRIPTION",
  primary_sample_accession = "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.PRIMARY_ID",
  secondary_sample_id = "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.EXTERNAL_ID",
  library_name = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_NAME",
  library_strategy = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_STRATEGY",
  library_source = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SOURCE",
  library_selection = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SELECTION",
  library_construction_protocol = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_CONSTRUCTION_PROTOCOL",
  sequencing_instrument_model = "PLATFORM.ILLUMINA.INSTRUMENT_MODEL",
  sequencing_instrument_model = "PLATFORM.ION_TORRENT.INSTRUMENT_MODEL"
)


## TODO update-> note platform may vary?
# [1] "IDENTIFIERS.PRIMARY_ID"                                       "IDENTIFIERS.SUBMITTER_ID"                                     "TITLE"
# [4] "STUDY_REF.IDENTIFIERS.PRIMARY_ID"                             "STUDY_REF.IDENTIFIERS.EXTERNAL_ID"                            "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.PRIMARY_ID"
# [7] "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.SUBMITTER_ID"            "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_STRATEGY"                   "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SOURCE"
# [10] "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SELECTION"                  "DESIGN.SPOT_DESCRIPTOR.SPOT_DECODE_SPEC.SPOT_LENGTH"          "DESIGN.SPOT_DESCRIPTOR.SPOT_DECODE_SPEC.READ_SPEC.READ_INDEX"
# [13] "DESIGN.SPOT_DESCRIPTOR.SPOT_DECODE_SPEC.READ_SPEC.READ_CLASS" "DESIGN.SPOT_DESCRIPTOR.SPOT_DECODE_SPEC.READ_SPEC.READ_TYPE"  "DESIGN.SPOT_DESCRIPTOR.SPOT_DECODE_SPEC.READ_SPEC.BASE_COORD"
# [16] "PLATFORM.LS454.INSTRUMENT_MODEL"

## TODO update ->  maybe depends on age of samples?
# [1] "IDENTIFIERS.PRIMARY_ID"                            "IDENTIFIERS.SUBMITTER_ID"                          "TITLE"
# [4] "STUDY_REF.IDENTIFIERS.PRIMARY_ID"                  "STUDY_REF.IDENTIFIERS.EXTERNAL_ID"                 "DESIGN.DESIGN_DESCRIPTION"
# [7] "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.PRIMARY_ID"   "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.SUBMITTER_ID" "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_NAME"
# [10] "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_STRATEGY"        "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SOURCE"          "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SELECTION"
# [13] "PLATFORM.ILLUMINA.INSTRUMENT_MODEL"

sra_exp_fields <- c(
  experiment_id = "IDENTIFIERS.PRIMARY_ID",
  submitter_id = "IDENTIFIERS.SUBMITTER_ID",
  experiment_title = "TITLE",
  study_primary_accession = "STUDY_REF.IDENTIFIERS.PRIMARY_ID",
  library_design_description = "DESIGN.DESIGN_DESCRIPTION",
  primary_sample_accession = "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.PRIMARY_ID",
  library_name = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_NAME",
  library_strategy = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_STRATEGY",
  library_source = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SOURCE",
  library_selection = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SELECTION",
  sequencing_instrument_model = "PLATFORM.ILLUMINA.INSTRUMENT_MODEL",
  sequencing_instrument_model = "PLATFORM.ION_TORRENT.INSTRUMENT_MODEL"
)

cols_of_interest <- c(
  "secondary_sample_accession",
  "study_accession",
  "study_title",
  "sample_alias",
  "sample_title",
  "scientific_name",
  "experiment_accession",
  "experiment_title",
  "center_name",
  "instrument_model",
  "instrument_platform",
  "library_name",
  "library_construction_protocol",
  "library_design_description",
  "library_source",
  "library_selection",
  "library_strategy",
  "library_layout",
  "nominal_length",
  "run_accession",
  "read_count",
  "fastq_ftp",
  "fastq_aspera",
  "fastq_md5",
  "fastq_bytes"
)

#### FUNCTIONS ###############################################################

call_ena_home <- function(url, v = FALSE) {
  if (v == T) {
    print(paste0("[DEBUG] call_ena_home() - querying URL:", url, collapse = ": "))
  }
  url %>%
    GET(url = .) %>%
    content(encoding = "UTF-8") # %>% read_tsv
}

## Go SAMPLE_ACC -> RUN_TAB -> EXPERIMENT

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

  ## takes ENA*/SRA* accession code (any level) and gets entir RUNe table
  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - generating all URLs")
  }
  acc_urls <- paste0("https://www.ebi.ac.uk/ena/portal/api/filereport?accession=", all_accs, "&result=read_run&fields=", ena_run_fields)

  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - querying ENA...")
  }
  query_res <- map(acc_urls, ~ call_ena_home(.x, v = v))

  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - converting to table...")
  }
  final_tab <- map(query_res, ~ read_tsv(.x) %>% mutate(across(everything(), as.character))) %>% bind_rows()

  return(final_tab)
}

clean_experiment_xml <- function(x, fields, v = F) {
  if (v == T) {
    print("[DEBUG] clean_experiment_xml() - Cleaning XML")
  }

  results_tab <- x %>%
    unlist() %>%
    enframe() %>%
    pivot_wider(names_from = name, values_from = value, values_fn = list)

  avail_fields <- names(results_tab)
  requested_fields <- fields

  ## Get ONLY the correct fields from our database
  final_exp_fields <- avail_fields[avail_fields %in% requested_fields]
  final_req_fields <- requested_fields[requested_fields %in% final_exp_fields]

  results_tab %>%
    select(final_exp_fields) %>%
    rename(!!!final_req_fields)
}


## TODO Needs diff headers depending if SRA vs ENA
##
get_experiment_metadata <- function(accession, v = FALSE) {
  if (v == T) {
    paste0("[DEBUG] get_experiment_metadata() - searching accession:", accession)
  }
  if (str_sub(1, 3, string = accession) == "ERX") {
    fields <- ena_exp_fields
  } else if (str_sub(1, 3, string = accession) == "SRX") {
    fields <- sra_exp_fields
  } else {
    stop(paste0("[ERROR] get_experiment_metadata() - accession starts neither with ERX nor SRX:", accession))
  }

  if (v == TRUE) {
    print(paste0("[DEBUG] get_experiment_metadata() - Pulling experiment XML: ", accession))
  }
  exp_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", paste0(accession, collapse = ","), "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content(encoding = "UTF-8") %>%
    as_list()

  if (v == TRUE) {
    print("[DEBUG] get_experiment_metadata() - Removing nasty experiment attributes")
  }
  filtered_results <- map(exp_res$EXPERIMENT_SET, ~ clean_experiment_xml(.x, fields, v = v)) %>%
    reduce(bind_rows) %>%
    select(-contains("EXPERIMENT_LINK"), -contains("EXPERIMENT_ATTRIBUTE"), ) %>%
    unnest(cols = names(ena_exp_fields))

  return(filtered_results)
}

join_table_run_experiment <- function(run_tab, exp_tab, v = F) {
  if (v == T) {
    print("[DEBUG] join_table_run_experiment() - Joining by 'known' columns")
  }
  left_join(run_tab, exp_tab, by = c(
    "experiment_accession" = "experiment_id",
    "experiment_title" = "experiment_title",
    "library_name" = "library_name",
    "library_source" = "library_source",
    "library_selection" = "library_selection",
    "library_strategy" = "library_strategy"
  ))
}

ena_column_cleanup <- function(x, fields, v = FALSE) {
  if (v == T) {
    print("[DEBUG] ena_column_cleanup() - Selecting preferred fields")
  }
  x %>% select(all_of(fields))
}

### TEST EXECUTE ####################################################################

sam_acc <- "ERS3774422"
sam_multi_acc <- c("ERS3774422", "ERS3774423", "ERS3774424")
exp_acc <- "ERX3576974"
run_acc <- "ERR3579675"

## SINGLE
results_run <- get_run_from_sample_metadata(sam_acc)
results_experiment <- get_ena_experiment_metadata(results_run$experiment_accession)
results_final <- join_table_run_experiment(results_run, results_experiment) %>% ena_column_cleanup(cols_of_interest)

### MULTI v2
hostass_meta <- read_tsv("ancientmetagenome-hostassociated/ancientmetagenome-hostassociated.tsv") %>%
  filter(archive == "ENA" | archive == "SRA") %>%
  slice_tail(n = 200)

hostass_samacc <- hostass_meta %>%
  mutate(run_metadata = map(archive_accession, ~ get_run_from_sample_metadata(.x, v = T))) %>%
  unnest(cols = c(run_metadata))

hostass_expacc <- hostass_samacc %>% mutate(exp_metadata = map(experiment_accession, ~ get_experiment_metadata(.x, v = T)))


#hostass_expacc %>% unnest(cols = c(exp_metadata), names_repair = "universal")



## TODO modify to make following two work on TABLES; and add filter based on the `archive`
## TODO singlegenome hostassociated for genbank: entrez of genbank code to get ID
## TODO clean up code; make github actions; how to add/which additional columns
# get_run_from_sample_metadata(hostass_samacc[[20]], v = T)
