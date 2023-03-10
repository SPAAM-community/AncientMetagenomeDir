# AncientMetagenomeDir - Libraries Column Specifications

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for all library-level lists. Icons indicate columns that are specific to specific columns.

- 🏞: environmental ancient metagenomes
- 🧫: host-associated ancient metagenomes
- 🦠: host-associated ancient single genomes

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
  - If the first author has multiple or hyphenated surnames, write them all
    together capitalising each surname.
- If a same author/year combination already exists, please append a single lower
  case character (b,c,d etc.) to the key.
  - The already existing key does not need to be updated. `b` indicates the
    'second' key added.
  - e.g. Muhlemann2018 (original), Muhlemann2018b (first duplicate),
    Muhlemann2018c (second duplicate) etc.

> ⚠️ [MIxS v5](https://gensc.org/mixs/) compliant field

> ⚠️ Mandatory value

## publication_year

- Must correspond to the `publication_year` of the publication in the
  corresponding sample metadata table!
- YYYY format.

> ⚠️ Mandatory value

## data_publication_doi

- Must correspond to the `publication_doi` of the publication in the
  corresponding sample metadata table!
- Publication DOI.
- Or library permalink:
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> ⚠️ Mandatory value

## sample_name

- Must correspond to the `sample_name` of the publication in the corresponding
  sample metadata table.
- Unique identifier for that sample as used in publication.
  - In most cases this should be the name of the host _individual_.

> ⚠️ Mandatory value

## archive

- In most cases should correspond to the `archive` of the publication in the
  corresponding sample metadata table!
- The archive the library's data is stored on.
  - Should be an established long-term stable archive.
  - Generally set up academic institutions e.g. EBI or Universities (rather than
    companies, e.g. GitHub).
- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/).
- In some cases this will vary, for example if there IS an ERS code, however
  only consensus sequences are uploaded

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

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

- Missing value: `Unknown`

## archive_sample_accession

- Must correspond to the sample `archive_accession` of the publication in the
  corresponding sample metadata table!
- Should be a single accession ID.
- For ENA/SRA: These should be **secondary** accession IDs to keep as close to
  data as possible (e.g. SRS, ERS, not SAMEA - see below).
- If non-NCBI/ENA, use as close to sample-level as possible.
  - e.g. when different extracts of one sample incorrectly uploaded as samples.
  - For GenBank consensus sequences: if the ENA/SRA sample accession ID does
    not exist, reuse the GenBank sequence ID for both sample and run accessions.
    However always where possible prefer ENA/SRA secondary accession IDs.
  - For for Dryad/Figshare, use the numeric ID after 'file_steam' in the per-file download URL

> ⚠️ Mandatory value

## library_name

- In most cases this should be the name of the sequencing lab's library as listed on the
  corresponding ENA or SRA table.
- Should be the lab ID used at sequencing as referred to in the publication (in
  cases when these differ, list both separated with a `/`).
- Can be sometimes inferred from the `Submitted Files` column of the ENA/SRA table
- If no library name is reported on the ENA/SRA, list as `unspecified`.
- Replace any spaces with underscores.
- ⚠️ in some cases sequencing centers will assign different library_ids
  for libraries sequenced multiple times (e.g. across different machines).
  - Check a publication's methods and/or supplementary information for whether
    you should use the common part of two sequence runs as the library id.
  - For example: KNP001.A0101 and KNP001.A0101.161208, or PES001.B0101 and PES001.B0103.SG1.1,
    are both

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

> ⚠️ Must follow categories specified in `assets/enums/strand_type.json`

> ⚠️ If unknown and cannot be inferred from the publication, specify `unknown`

> ⚠️ Mandatory value

## library_polymerase

- Name of the polymerase used for indexing amplification
  - I.e., only report polymerases used **after** adapter fill in, and during the
    (initial) indexing PCR amplification
- The name of the polymerase (as in the enum) should be as listed on the
  manufacturers website
- Polymerase selection will influence whether damage will be visible enough.
  - This is due to differences between proof-reading and non-proofreading (i.e.
    damage tolerant) polymerases, due to proof-reading enzymes stalling on
    uracils. See [Warinner et al. (2014) Nature
    Genetics](https://doi.org/10.1038/ng.2906) SI section 6.2.1 for more
    information.
- If not directly specified in the manuscript, it is OK to take this from a
  primary source protocol if referenced (e.g. if 'libraries prepared as described in Meyer
  and Kircher', use polymerase cited there. If you go down a citation chain,
  'as in X, as in Y, as in Z', specify `Unknown`.

> ⚠️ Must follow categories specified in
> `assets/enums/library_polymerase.json`

> ⚠️ If unknown and cannot be
> inferred from the publication, specify `Unknown`

## library_treatment

- Type of damage-removal treatment that may have been performed on the libraries.
  - When performed, typically via partial- or full- USER or UDG treatment.
  - If no treatment performed, indicate as `none`.
  - If in doubt, or different treated libraries are merged into one FASTQ/BAM file, record as `Unknown`.

> ⚠️ Must follow categories specified in
> `assets/enums/library_treatment.json`

> ⚠️ If unknown and cannot be
> inferred from the publication, specify `Unknown`

> ⚠️ Mandatory value

## library_concentration

> 🧫 host-associated metagenome list only!

- The qPCR value of copies per µl of extract of a given library
  - Be aware of a single library sequenced multiple times. In such cases it is
    OK to duplicate the value for each library.

> ⚠️ If not reported in the paper, specify: `NA`

## instrument_model

- Sequencing machine used for sequencing the library.
- Follows [ENA categories](https://www.ebi.ac.uk/ena/portal/api/controlledVocab?field=instrument_model).
- In most cases for aDNA labs will be some form of Illumina platform.

> ⚠️ If not described in the ENA table, or there is discrepency with the paper, specify: `unspecified`

> ⚠️ Must follow categories specified in
> `assets/enums/instrument_model.json`

## library_layout

- Whether a library was sequenced either `SINGLE`- or `PAIRED`-end.
- Can generally be inferred when there are either one (R1) or two (R2) FASTQ
  files, with otherwise the same file name.

> ⚠️ Must follow categories specified in
> `assets/enums/library_layout.json`

> ⚠️ Mandatory value

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
  amplification. Therefore specify `WGS`.

> ⚠️ Mandatory value

## read_count

- Number of reads or pairs in library, i.e. how deep sequenced, or how many
  reads in FASTQ fils
- For paired end libraries, count pairs (should be same number for both
  directions)
- Use only what is reported on SRA or ENA tables (i.e., what is physically
  in the FASTQ files), else use the missing value.

> ⚠️ If not described in the ENA table, specify: `NA`

## archive_data_accession

- Should be a single `run` or genome-level consensus sequence accession ID for each library.
  - A library may have multiple accessions, in which case specify one line per
    run accession and duplicate metadata accordingly (updating `library_name`
    and other metadata where necessary)
- For ENA/SRA: These should be primary accession IDs to keep as close to
  data as possible (i.e. should start with `ERR` or `SRR`).
- If non-NCBI/ENA, use as close to sequencing run-level as possible.
  - For example, use the unique file name (without file suffix).

> ⚠️ Mandatory value

## file_Type

> 🦠 host-associated single genome only!

- Contents of downloadable file
- Some groups upload only mapped reads to the organism of interest's reference
  genome. This is specified here alongside the file format (e.g. `fastq_all`,
  or `mapped_all`).

> ⚠️ Mandatory value

## download_links

- Download link to raw data files.
- Should start with `ftp`, `https`, or `http`.
- Can be semi-colon separated list for paired-end sequenced runs.
- Link must allow direct download of files via command-line utility e.g. with wget or curl. I.e., the link must send you directly to a file, not a gateway page.

> ⚠️ Mandatory value

## download_md5s

- MD5 checksums of corresponding download files,
- This allows you to check for data integrity of downloaded files by comparing
  the checksum of your file with the one on the server they were downloaded from

  - For Linux or OSX, can be generated with

    ```bash
    md5sum <file>.fastq.gz
    ```

- Can be semi-colon separated list for paired end.

> ⚠️ Mandatory value

## download_sizes_1

- File size of first file (typically R1) in bytes.
- In the case of paired-end, or paired-end plus singleton data, this is the FIRST number in the comma separated list from the ENA
- This can be used to estimated HDD space that will be used after download.
- Can be semi-colon separated list for paired end.

## download_sizes_2

- File sizes of corresponding download files in bytes.
- In the case of paired-end, or paired-end plus singleton data, this is the SECOND number in the comma separated list from the ENA
- This can be used to estimated HDD space that will be used after download.
- Missing value: `NA`

## download_sizes_3

- File sizes of corresponding download files in bytes.
- Rarely used, only in the case of paired-end plus singleton data, this is the THIRD number in the comma separated list from the ENA
- This can be used to estimated HDD space that will be used after download.
- Missing value: `NA`
