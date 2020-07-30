# AncientMetagenomeDir - Ancient Sediment

This page describes columns definitions for the Ancient Sediment list.

All column with 'defined categories' should be validated against
`standards.tsv`. This is to ensure data consistency.

If you wish to a new category, please consult with the [SPAAM
community](spaam-workshop.github.io), and then add it to `standards.tsv`.

Sample columns are as follows:

## project_name

- Format: surnameYEAR

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## publication_year

- YYYY format

## publication_doi

- Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

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

- In most cases this should be the name as reported in publication

## sample_age

- Approximate single date rounded to nearest century (i.e. end in '00')
  - e.g. something only 50 years old would be assigned as 100
- In Before Present (BP) format i.e. since 1950 AD (~2000 AD is also fine)
  - When in doubt: [https://nikhausmann.shinyapps.io/BP_to_BC_and_more/](https://nikhausmann.shinyapps.io/BP_to_BC_and_more/)
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

## material

- Sample type DNA was extracted from

> :warning: partly [MIxS v5](https://gensc.org/mixs/) compliant field, following
> [Environment Ontology](http://www.environmentontology.org/Browse-EnvO)
> :warning: Must follow categories specified in `standards.tsv`

## collection_date

- Year of sample collection in YYYY format

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## archive

- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> :warning: Must follow categories specified in `standards.tsv`

## archive_accession

- Of *sample*, where possible
- e.g. ERS, SRS
- If non-NCBI/ENA, use as close to Sample as possible
- Multiple can be separated with commas
  - e.g. when different extracts of one sample incorrectly uploaded as samples
