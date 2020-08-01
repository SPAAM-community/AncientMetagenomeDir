![check_dataset](https://github.com/spaam-workshop/AncientMetagenomeDir/workflows/check_dataset/badge.svg) ![check_dataset](https://github.com/spaam-workshop/AncientMetagenomeDir/workflows/check_dataset/badge.svg)


# AncientMetagenomeDir - Ancient Pathogen

This page describes columns definitions for the Ancient Pathogen list.

Optional fields (e.g. Sample Age), can be filled with `NA` to indicate 'no
reported value'.

All column with 'defined categories' should be validated against
`assets/enums/<column>.json`. This is to ensure data consistency, e.g. all
Dental calculus samples are listed as `dental calculus` (as defined in
`assets/enums/<column>.json`. This is to ensure data consistency.

If you wish to a new category, please consult with the [SPAAM
community](spaam-workshop.github.io), and then add it to
`assets/enums/<column>.json`.

Sample columns are as follows:

## project_name

- Format: surnameYYYY (YYYY in numeric format)
- Due to restrictions in regex (used for validation checks), characters with
  accents cannot be used. In these cases use the non-accented version.

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## publication_year

- YYYY format

## publication_doi

- Publication DOI
- Or library permalink 
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## site_name

- As reported in publication
- Accents are allowed

## lat_lon

- Separated by a space: e.g. 27.987 86.925
- Decimal format
- Maximum three decimals
- In WGS84 project (coordinates taken from Google Maps is recommended)
- Can be searched in wider literature, rough location is acceptable but use
  fewer decimals

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## geo_loc_name

- Based on modern day definitions
- Must be based on [INDSC Country list](http://www.insdc.org/country.html)

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## sample_name

- In most cases this should be the name of the host *individual*

## sample_host

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> :warning: Must follow categories specified in `assets/enums/<column>.json`

# sample_age

- Single date rounded to nearest century (i.e. end in '00')
  - e.g. something only 50 years old would be assigned as 100
- In Before Present (BP) format i.e. since 1950 AD (~2000 AD is also fine)
  - When in doubt: https://nikhausmann.shinyapps.io/BP_to_BC_and_more/
- Can be obtained from other publications if known (see `sample_age_doi`)

- If date _ranges_ reported, take approximate mid-point
- Dates for specific individual preferred.
- Proxy dates are allowed. e.g.
  - from other individuals in stratum/burial
  - period of occupation of site
  - via coin or historical records
- Radiocarbon dates
  - Uncalibrated dates are preferred, but if only calibrated reported can be
    used

## sample_age_doi

- DOI of publication with date derived from
- Can be duplicate of Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## pathogen_species

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> :warning: Must follow categories specified in `assets/enums/<column>.json`

## material

- Sample type DNA was extracted from
  - e.g. denta lcalculus, palaeofaeces, intestinal, chewing gum

> :warning: partly [MIxS v5](https://gensc.org/mixs/) compliant field, following
> [Environment Ontology](http://www.environmentontology.org/Browse-EnvO)

> :warning: Must follow categories specified in `assets/enums/<column>.json`

## collection_date

- Year of sample collection in YYYY format

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## archive

- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> :warning: Must follow categories specified in `assets/enums/<column>.json`

## archive_accession

- Of *sample*, where possible
- e.g. ERS, SRS
- If non-NCBI/ENA, use as close to Sample as possible
- Multiple can be separated with commas 
  - e.g. when different extracts of one sample incorrectly uploaded as samples
