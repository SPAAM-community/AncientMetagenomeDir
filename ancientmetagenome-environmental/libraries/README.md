# AncientMetagenomeDir - Environmental Metagenome

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for the environmental ancient
metagenome library metadata list.

This covers libraries generated from metagenomes such as

- soil
- sediments
- ice cores

Numeric fields (e.g. `read_count`), can be filled with `NA` to indicate 'no
reported value'. Free text fields (e.g. `library_name`) can be indicated with
`Unknown`, and restricted category columns sometimes will have an `unknown`
option.

All column with 'defined categories' should be validated against
`assets/enums/<column>.json`. This is to ensure data consistency. E.g., all
libraries sequenced on Illumina NextSeq 500s are listed as `NextSeq 500` (as
defined in `assets/enums/instrument_models.json`). This is to ensure data
consistency.

If you wish to a new category, please make a separate pull-request with your
modification in the corresponding `assets/enums/<column>.json` file.

Library columns are as follows:

## project_name

- Must correspond to a `project_name` in the corresponding sample metadata
  table!  
- Format: surnameYYYY (YYYY in numeric format)
- Due to restrictions in regex (used for validation checks), **punctuation (e.g.
  hyphens or spaces) or characters with accents cannot be used**.
  - Use the non-accented version.
  - If the first author has multiple or hyphenated surnames,  write them all
    together capitalising each surname.
- If a same author/year combination already exists, please append a single lower
  case character (b,c,d etc.) to the key.
  - The already existing key does not need to be updated. `b` indicates the
    'second' key added.
  - e.g. Muhlemann2018 (original), Muhlemann2018b (first duplicate),
    Muhlemann2018c (second duplicate) etc.

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field  

> :warning: Mandatory value  

## publication_year

- Must correspond to the `publication_year` of the publication in the
  corresponding sample metadata table!  
- YYYY format.

> :warning: Mandatory value  

## publication_doi

- Must correspond to the `publication_doi` of the publication in the
  corresponding sample metadata table!  
- Publication DOI.
- Or library permalink:
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> :warning: Mandatory value

## sample_name

- Should correspond to the `sample_name` of the publication in the corresponding
  sample metadata table, but CAN be different when mismatches occur (e.g.
  collection ID vs publication ID).
- Unique identifier for that sample as used in publication.
  - In most cases this should be the name of the host *individual*.

> :warning: Mandatory value

## archive

- Must correspond to the `archive` of the publication in the corresponding
  sample metadata table!  
- The archive the library's data is stored on.
  - Should be an established long-term stable archive.
  - Generally set up academic institutions e.g. EBI or Universities (rather than
    companies, e.g. GitHub).
- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/).

> :warning: Must follow categories specified in `assets/enums/<column>.json`

> :warning: Mandatory value  

## archive_project

- Must correspond to the `archive_project` of the publication in the
  corresponding sample metadata table!
- A project level accession code under which all libraries of a project are
  assigned to.
- Specific examples:
  - Archive: ENA/SRA/DDBJ: should be _primary_ accession code beginning with
    `PRJ`. [Example](https://www.ebi.ac.uk/ena/browser/view/PRJNA438985).
  - Archive: MG-RAST: should be accession code beginning with `mgp`.
    [Example](https://www.mg-rast.org/mgmain.html?mgpage=project&project=mgp13354).

- Missing value: `NA`

## archive_sample_accession

- Must correspond to the sample `archive_accession` of the publication in the
  corresponding sample metadata table!
- Should be a single accession ID.
- For ENA/SRA: These should be **secondary** accession IDs to keep as close to
  data as possible (e.g. SRS, ERS, not SAMEA - see below).
- If non-NCBI/ENA, use as close to sample-level as possible.
  - e.g. when different extracts of one sample incorrectly uploaded as samples.

> :warning: Mandatory value  

## sequencing_center

- Name of the sequencing center of the library.
- Often the institution of the lab is hosted in.
- Check for existing names in `assets/enums/sequencing_center.json`, and reuse
  existing categories when name is only slightly different.

> :warning: Must follow categories specified in
> `assets/enums/sequencing_center.json`

> :warning: If unknown and cannot be inferred from the publication, specify
> `Unknown`

## library_name

- In most cases this should be the name of the sequencing lab's library as listed on the
  corresponding ENA or SRA table.
- Should be the lab ID used at sequencing as referred to in the publication (in
  cases when these differ, list both separated with a `/`).

## strand_type

- Specify the strandedness of the library constructed for sequencing.
- This primarily influence of fragment length and damage patterns
- Typically `double` stranded, but sometimes `single` stranded.
  - Examples of double-stranded library preparation citations:
    - [Meyer and Kircher (2010) Cold Spring Harbour Protocols](https://doi.org/10.1101/pdb.prot5448).
    - [Kircher et al. (2011) Nucleic Acids research](https://doi.org/10.1093/nar/gkr771).
  - Examples of single-stranded library preparation:
    - [Gansauge et al. (2013) Nature Protocols](https://doi.org/10.1038/nprot.2013.038).
    - [Gansauge et al. (2020) Nature protocols](https://doi.org/10.1038/s41596-020-0338-0).
    - [Troll et al. (2019) BMC Genomics (a.k.a. SRSLY)](https://doi.org/10.1186/.s12864-019-6355-0)

> :warning: Must follow categories specified in `assets/enums/strand_type.json`

> :warning: Mandatory value

## library_polymerase

- Name of the polymerase used for library construction.
- Can be comma separated listed if multiple used.
- Polymerase selection will influence whether damage will be visible enough.
  - This is due to differences between proof-reading and non-proofreading (i.e.
    damage tolerant) polymerases, due to proof-reading enzymes stalling on
    uracils. See [Warinner et al. (2014) Nature
    Genetics](https://doi.org/10.1038/ng.2906) SI section 6.2.1 for more
    information.

> :warning: Must follow categories specified in
> `assets/enums/library_polymerase.json`

> :warning: If unknown and cannot be
> inferred from the publication, specify `Unknown`

## library_treatment

- Type of damage-removal treatment that may have been performed on the libraries.
  - By default assume `none`, unless stated.
  - When performed, typically via partial- or full- USER or UDG  treatment.
  
> :warning: Must follow categories specified in
> `assets/enums/library_treatment.json`

> :warning: Mandatory value

## instrument_model

- Sequencing machine used for sequencing the library.
- Follows [ENA categories](https://www.ebi.ac.uk/ena/portal/api/controlledVocab?field=instrument_model).
- In most cases for aDNA labs will be some form of Illumina platform.
- Missing value: `unspecified`

> :warning: Must follow categories specified in
> `assets/enums/instrument_model.json`

## library_layout

- Whether a library was sequenced either `SINGLE`- or `PAIRED`-end.
- Can generally be inferred when there are either one (R1) or two (R2) FASTQ
  files, with otherwise the same file name.

> :warning: Must follow categories specified in
> `assets/enums/library_layout.json`

> :warning: Mandatory value

## sequencing_cycles

- The number of base pairs that the sequencing chemistry consisted of in _one
  direction.
- Often equivalent to the maximum length of unprocessed reads in a FASTQ file.
- For Illumina,
  [typically](https://support.illumina.com/bulletins/2016/10/how-many-cycles-of-sbs-chemistry-are-in-my-kit.html)
  something like: 50, 75, 100, 150, depending on the machine.
- Missing value: `NA`

## library_strategy

- How the library was sequenced, i.e. whether shotgun sequenced or enriched or
  depleted using 'capture' protocols and similar.
  - For most metagenomic samples will be shotgun (`WGS`) sequenced (due to scope of
    AncientMetagenomeDir)
  - For single-genomes, this can sometimes be `Target-Capture` when dealing with whole-genome or whole-plasmid enriched samples.
  - Example of an unspecific modern DNA `depletion` protocol is [Weiß et al.
    (2020) BMC Genomics](https://doi.org/10.1186/s12864-020-06820-7).
- **Important**: check the original publication for the library strategy,
  researchers sometimes incorrectly specify this on data upload. E.g. `WGA`
  refers to a specific protocol using certain primers - not just any form of
  amplification.

> :warning: Mandatory value

## read_count

- Number of reads or pairs in library, i.e. how deep sequenced, or how many
  reads in FASTQ fils
- For paired end libraries, count pairs (should be same number for both
  directions)
- Missing value: `NA`

## archive_run_accession

- Should be a single `run` accession ID for each library.
  - A library may have multiple accessions, in which case specify one line per
    run accession and duplicate metadata accordingly (updating `library_name`
    and other metadata where necessary)
- For ENA/SRA: These should be primary accession IDs to keep as close to
  data as possible (i.e. should start with `ERR` or `SRR`).
- If non-NCBI/ENA, use as close to sequencing run-level as possible.

> :warning: Mandatory value

## download_links

- Download link to raw data files.
- Should start with `ftp`, `https`, or `http`.
- Can be semi-colon separated list for paired-end sequenced runs.
- Link must allow direct download of files via command-line utility e.g. with wget or curl. I.e., the link must send you directly to a file, not a gateway page.

> :warning: Mandatory value

## download_md5s

- MD5 checksums of corresponding download files,
- This allows you to check for data integrity of downloaded files by comparing
  the checksum of your file with the one on the server they were downloaded from
  - For Linux or OSX, can be generated with

      ```bash
      md5sum <file>.fastq.gz
      ```

- Can be semi-colon separated list for paired end.

> :warning: Mandatory value

## download_sizes

- File sizes of corresponding download files in bytes.
- This can be used to estimated HDD space that will be used after downloaded. 
- Can be semi-colon separated list for paired end.
- Missing value: `NA`
