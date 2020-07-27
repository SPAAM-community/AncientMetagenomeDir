# AncientMetagenomeDir - Ancient Microbiome

This page describes columns definitions for the Ancient Microbiome list.

Optional fields (e.g. Sample Age), can be filled with `NA` to indicate 'no
reported value'.

All column with 'defined categories' should be validated against
`standards.tsv`. This is to ensure data consistency, e.g. alll Calculus samples
are listed as `calculus` (as defined in `standards.tsv`), and not Calculus or
CaLcUlUs etc.

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

> :warning: Must follow categories specified in `standards.tsv`

## cultural_era

- These are *approximate* chrono-cultural categories, following broad/general
  definitions
  - Therefore no arguing please. In most cases report as in publication, or
    closest equivalent
- Used to assist in grouping samples for timelines when no direct C14/historical
  record date

> :warning: Must follow categories specified in `standards.tsv`

# sample_age

- Single year without unit
- Of _Individual_ - not proxy dates
- Can be obtained from other publications
- In BP format!
- Calibrated radiocarbon date in preferred (take middle if range). 
  - When in doubt: https://nikhausmann.shinyapps.io/BP_to_BC_and_more/
- Infinite 14C can be kept at 49,999
- Historical dating also allowed (e.g. via coin or historial records)

## sample_age_doi

- DOI of publication with e.g. radiocarbon date
- Can be duplicate of Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## microbiome_type

- e.g. oral, gut

> :warning: Must follow categories specified in `standards.tsv`

## material

- Sample type DNA was extracted from
  - e.g. denta lcalculus, palaeofaeces, intestinal, chewing gum

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
