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

## Taken from example ENA experiment file
ena_exp_fields <- c(
  experiment_id = "IDENTIFIERS.PRIMARY_ID",
  submitter_id = "IDENTIFIERS.SUBMITTER_ID",
  #experiment_title = "TITLE",
  study_primary_accession = "STUDY_REF.IDENTIFIERS.PRIMARY_ID",
  library_design_description = "DESIGN.DESIGN_DESCRIPTION",
  primary_sample_accession = "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.PRIMARY_ID",
  secondary_sample_id = "DESIGN.SAMPLE_DESCRIPTOR.IDENTIFIERS.EXTERNAL_ID",
  #library_name = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_NAME",
  #library_strategy = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_STRATEGY",
  #library_source = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SOURCE",
  #library_selection = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_SELECTION",
  library_construction_protocol = "DESIGN.LIBRARY_DESCRIPTOR.LIBRARY_CONSTRUCTION_PROTOCOL",
  sequencing_instrument_model = "PLATFORM.ILLUMINA.INSTRUMENT_MODEL",
  sequencing_instrument_model = "PLATFORM.ION_TORRENT.INSTRUMENT_MODEL"
)

## Note study_secondary_accession = "STUDY_REF.IDENTIFIERS.SECONDARY_ID", doesn't exist for SRA?
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
  "project_name",
  "publication_doi",
  "secondary_sample_accession",
  "study_accession",
  # "study_title"
  "sample_alias",
  "sample_title",
  # "scientific_name",
  "experiment_accession",
  "experiment_title",
  "center_name",
  "instrument_platform",
  "instrument_model",
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
