# AncientMetagenomeDir - Samples Column Specifications

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for all sample-level lists. Icons indicate columns
that are specific to specific columns.

- 🏞: environmental ancient metagenomes
- 🧫: host-associated ancient metagenomes
- e🦠: host-associated ancient single genomes

Numeric fields (e.g. latitude), can be filled with `NA` to indicate 'no
reported value'. Free text fields (e.g. `geo_loc_name`) can be indicated with
`Unknown`, and restricted cateogory columns sometimes will have an `unknown`
option.

All column with 'defined categories' should be validated against
`assets/enums/<column>.json`. This is to ensure data consistency, e.g. all
Dental calculus samples are listed as `dental calculus` (as defined in
`assets/enums/<column>.json`). This is to ensure data consistency.

If you wish to a new category, please consult with the [SPAAM
community](spaam-community.github.io), and then add it to
`assets/enums/<column>.json`.

Sample columns are as follows:

## project_name

- Format: `SurnameYYYY` (YYYY in numeric format)
- Due to restrictions in regex (used for validation checks), **punctuation (e.g.
  hyphens or spaces) or characters with accents cannot be used**.
  - Use the non-accented version (e.g. ã or ä become a).
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

- YYYY format

> ⚠️ Mandatory value

## publication_doi

- Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> ⚠️ Mandatory value

## site_name

- As reported in publication
- Accents are allowed
- Missing name: `Unknown`

## latitude

- Decimal format
- Maximum three decimals
- In WGS84 projection (coordinates taken from Google Maps is recommended, range
  90 to -90)
- Can be searched in wider literature, rough location is acceptable but use
  fewer decimals
- Missing value: `NA`

## longitude

- Decimal format
- Maximum three decimals
- In WGS84 projection (coordinates taken from Google Maps is recommended, range
  180 to -180)
- Can be searched in wider literature, rough location is acceptable but use
  fewer decimals
- Missing value: `NA`

## geo_loc_name

- Based on modern day definitions
- Must be based on [INDSC Country list](http://www.insdc.org/country.html)
- Missing name: `Unknown`

> ⚠️ [MIxS v5](https://gensc.org/mixs/) compliant field

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## study_primary_focus

> 🏞 environmental ancient metagenome only!

- The primary 'organism' category that the sequences was originally generated for
- These are generalised categories such as 'floral', or 'faunal', 'microbial',
  with a combination of those (in that order) also allowed.

> ⚠️ this does NOT necessarily imply that the data can only be used for
> the same purposes. This column is only to facilitate faster bibliographic
> review for equivalent dataset generation

## sequence_name

> 🏞 environmental ancient metagenome only!

- Sediment cores only
- Identifier for sequence sample was taken from, e.g. core_3, or zone_a19
- Typically cores, or quadrant/square of excavation
- Missing value: `Unknown`

## depth

> 🏞 environmental ancient metagenome only!

- Sediment only
- Depth of sample from top of sequence (cm)
- If reported as a range (e.g. 130-132 cm), take approximate mid-point
- Use NA if not a sequence (e.g. from surface of an open site)

## sample_name

- Unique identifier for that sample as used in publication
  - In most cases this should be the name of the host _individual_ (for host-associated samples)
  - If samples are referred to by multiple names, use the most informative
  - For environmental samples: if samples cannot be **directly** linked to data files by any names in the publication, generate names in the format e.g. [sequence]\_[depth]\_[original_name]

> ⚠️ Mandatory value

## sample_host

> 🧫 host-associated metagenome or 🦠 host-associated single genome only!

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

## sample_age

- In Before Present (BP) format i.e. since 1950 AD

  - When in doubt:
    [https://nikhausmann.shinyapps.io/BP_to_BC_and_more/](https://nikhausmann.shinyapps.io/BP_to_BC_and_more/)

- Radiocarbon dates

  - Uncalibrated dates are preferred, but if only calibrated reported can be
    used

- Single date rounded to nearest century (i.e. end in '00')

  - For samples more recent than 1850, the age should be assigned as 100
  - e.g. something only 50 years old would be assigned as 100
  - Therefore the minimum age possible is 100!

- In most cases, report the date in the publication of the given sample, even if
  the date is from an older publication (we assume the original citation can be
  found by looking at submitted article). _However_:

  - If a more recent and accurate date has been published this can be used!
  - Ensure to also update `sample_age_doi`

- If date _ranges_ reported, take approximate mid-point
- Dates for specific individual preferred.
- Proxy dates are allowed. e.g.

  - from other individuals in stratum/burial
  - period of occupation of site
  - via coin or historical records

- For environmental metagenomes (sediment only):
  - If a layer is not directly dated, 'inferred' ages are allowed if there are at least two direct dates in the relevant sequence

> ⚠️ Mandatory value

## sample_age_doi

- DOI of publication that the sample_age is derived from
- In most cases, please duplicate the DOI of the publication under submission,
  even if the date is from an older publication (we assume the original citation
  can be found by looking at submitted article). _However_:
  - If a more recent and accurate date has been published this can be used!
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## feature

> 🏞 environmental ancient metagenome only!

- Description of the object, site, or immediate environment the sample was obtained from, following [Environment
  Ontology](https://www.ebi.ac.uk/ols/ontologies/envo)
  - e.g. midden, cave, ocean, lake, archeological site

> ⚠️ partly [MIxS v5](https://gensc.org/mixs/) compliant field, following
> [Environment Ontology](http://www.environmentontology.org/Browse-EnvO)

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## community_type

> 🧫 host-associated metagenome only!

- The type of community from the host's original body the sample is derived from.
  - e.g. oral, gut

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

## pathogen_domain

> 🦠 host-associated single genome only!

- Which domain of life (or equivalent) the species comes from: bacteria, archea,
  virus, eukaryota

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

## pathogen_species

> 🦠 host-associated single genome only!

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## material

- Sample type DNA was extracted from

  - e.g. dental calculus, palaeofaeces, intestinal, chewing gum
  - e.g. permafrost, lake sediment, peat soil, bone
  - e.g. tooth, bone, dental calculus

- For host-associated single genome list only:
  - If genome is derived from multiple tissue types from the same individual (e.g. bone and soft tissue) then the entry should simply be listed as 'tissue'

> ⚠️ Partly [MIxS v5](https://gensc.org/mixs/) compliant field, i.e. term
> from an [ontology](https://www.ebi.ac.uk/ols/index), and ideally either
> [UBERON](https://www.ebi.ac.uk/ols/ontologies/uberon) (anatomy) or
> [ENVO](https://www.ebi.ac.uk/ols/ontologies/envo) (everything else). If you
> can't find something close enough, please ping
> @spaam-community/ancientmetagenomedir-coreteam

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## genome_type

> 🦠 host-associated single genome only!

- We are primarily interested in listing reconstructed whole genomes of
  microbes, however in some cases researchers may only be able to analyse
  smaller cell components.
- Specify one of two levels of genome reconstruction
  - `organelle`: if the study has only published a microbial mitochondrial
    genome (e.g. for _Plasmodium_ sp.) or a bacterial plasmid sequence
  - `chromosome`: if the study a published the complete genome (chromosome and
    plasmid) or just the chromosome
- In both cases the aim of the study must have been to attempt to reconstruct
  the _complete_ genome sequence, not gene or single amplicon sequences.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## sampling_date

> 🏞 environmental metagenome only!

- Year of sampling of (sub-)sample for DNA analysis in YYYY format
- Missing value: `NA`

> ⚠️ [MIxS v5](https://gensc.org/mixs/) compliant field

## archive

- The archive the sample's data is stored on.
  - Should be an established long-term stable archive
  - Generally set up academic institutions e.g. EBI or Universities (rather than companies, e.g. GitHub)
- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## data_type

> 🦠 host-associated single genome only!

- The type of data available under sample accession
  - In some cases researchers are unable to upload raw data, or upload a
    combination of types
  - This field indicates what type of data are available by the uploaded
    accession
  - Can include combinations (in comma separated list), but use single
    upper-level accessions where possible (e.g. ERS/SRS codes, which can be used
    when searching on the ENA to direct you to both raw files and genbank
    entries)
  - If only lower down accession are available, this is acceptable (e.g. NCBI
    GenBank accessions for consensus)

> ⚠️ Must follow categories specific in `assets/enums/<column>.json`

Definitions of possible categories are as follows:

- `raw`: shotgun or whole-genome-enrichment data in FASTQ format without any
  type of depletion or computational manipulation of read/data composition, with
  exception of adapters being trimmed (as per ENA submission specifications).
- `assembly`: anything that is derived of a de-novo assembly process,
  independent of the completeness.
- `binned_mag`: a single-taxon assembly (derived from above) based on one or
  more binned metagenomes that meet certain quality requirements, and can be
  assumed to represent contigs from one bin of a metagenome.
- `binned_cag`: reads recruited by ancient co-abundant genes.
- `reference_aligned:` target reads derived from alignment (mapping) of
  metagenomic data to a reference sequence. Typically uploaded in BAM format
  without unmapped reads.
- `consensus`: Any sequence derived from a consensus calling algorithm applied
  to `reference_aligned` data (typically a FASTA style file, as can be found on
  e.g. NCBI GenBank).

For example, if only a consensus is available from GenBank, this can be given
the archive_accesion as: `MG585269.1`

## archive_project

- A project level accession code under which all samples of a project are assigned to
- Specific examples:

  - Archive: ENA/SRA/DDBJ: should be _primary_ accession code beginning with `PRJ`. [Example](https://www.ebi.ac.uk/ena/browser/view/PRJNA438985).
  - Archive: MG-RAST: should be accession code beginning with `mgp`. [Example](https://www.mg-rast.org/mgmain.html?mgpage=project&project=mgp13354).

- Missing value: `NA`

## archive_accession

- Of _sample_, where possible
- For ENA/SRA: These should be **secondary** accession IDs to keep as close to
  data as possible (e.g. SRS, ERS, not SAMEA - see below)
- If non-NCBI/ENA, use as close to sample-level as possible
- Multiple can be separated with commas
  - e.g. when different extracts of one sample incorrectly uploaded as samples

> ⚠️ Mandatory value

<details>
  <summary>Expand to show location of ERS codes on ENA</summary>
  
  ![Location of ERS
  codes](../images/tutorials/spaam-AncientMetagenomeDir_ena_ers_location.png)
  
  Select the 'secondary_sample_accesion' and 'sample_alias' columns.

</details>
<details>
  <summary>Expand to show location of SRS codes on SRA</summary>

![Location of ERS
  codes](../images/tutorials/spaam-AncientMetagenomeDir_sra_srs_location.png)

The SRS code is to the left of the SAMEA-like code under the **sample:** field

</details>
