## Performs GET on ENA search URL query
call_ena_home <- function(url, v = FALSE) {
  if (v == T) {
    print(paste0("[DEBUG] call_ena_home() - querying URL:", url, collapse = ": "))
  }
  url %>%
    GET(url = .) %>%
    content(encoding = "UTF-8") # %>% read_tsv
}

# Drops certain non-tidy entries in an ENA XML and converts to table
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

column_cleanup <- function(x, fields, v = FALSE) {
  if (v == T) {
    print("[DEBUG] ena_column_cleanup() - Selecting preferred fields")
  }
  x %>% select(all_of(fields))
}

## Get RUN metadata from a given ENA accession ID (e.g. ERS123456)
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

  if (is.null(query_res[[1]])) {
    print(paste0("[WARN] following accession had no metadata returned from archive: ", accession, collapse = ""))
    return(NA)
  }

  if (v == T) {
    print("[DEBUG] get_run_from_sample_metadata() - converting to table...")
  }
  final_tab <- map(query_res, ~ read_tsv(.x) %>% mutate(across(everything(), as.character))) %>% bind_rows()

  return(final_tab)
}

get_experiment_metadata <- function(exp_accession, v = F) {
  if (v == T) {
    print(paste0("[DEBUG] get_experiment_metadata() - searching experiment ID: ", exp_accession, collapse = " "))
  }

  if (is.na(exp_accession)) {
    if (v == T) {
      print(paste0("[ERROR] get_experiment_metadata() - accession is missing:", exp_accession))
    }
    return(exp_template_empty)
  }

  if (!str_sub(1, 3, string = exp_accession) %in% c("ERX", "SRX")) {
    if (v == T) {
      print(paste0("[ERROR] get_experiment_metadata() - accession starts neither with ERX nor SRX:", exp_accession))
    }
    return(exp_template_empty)
  }

  if (v == T) {
    print(paste0("[DEBUG] get_experiment_metadata() - starting accession query for:", exp_accession))
  }
  exp_res <- paste0("https://www.ebi.ac.uk/ena/browser/api/xml/", paste0(exp_accession, collapse = ","), "?download=false&gzip=false") %>%
    GET(url = .) %>%
    content(encoding = "UTF-8") %>%
    as_list() %>%
    pluck("EXPERIMENT_SET", "EXPERIMENT") %>%
    unlist()

  if (v == T) {
    print(paste0("[DEBUG] get_experiment_metadata() - formatting query result for:", exp_accession))
  }

  result_tab <- exp_template %>%
    mutate(result = exp_res[value]) %>%
    select(name, result) %>%
    pivot_wider(names_from = name, values_from = result)

  return(result_tab)
}
