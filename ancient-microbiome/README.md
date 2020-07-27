# AncientMetagenomeDir - Ancient Microbiome

This page describes columns definitions for the Ancient Microbiome list.

Spaces should be replaced with underscores. Optional fields (e.g. Sample Age),
can be filled with `NA` to indicate 'no reported value'.

All column with 'defined categories' should be validated against
`standards.tsv`. This is to ensure data consistency, e.g. alll Calculus samples
are listed as `calculus` (as defined in `standards.tsv`), and not Calculus or
CaLcUlUs etc.

If you wish to a new category, please consult with the [SPAAM
community](spaam-workshop.github.io), and then add it to `standards.tsv`.

Sample columns are as follows:

## Publication

- Format: surnameYEAR

## Publication_Year

- YYYY format

## Publication_DOI

- Publication DOI
- Or library permalink 
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## Site_Name

- As reported in publication
- Spaces replaced with underscores
- Accents are allowed

## Latitude

- Decimal format
- Maximum three decimals
- From Google Maps is recommended
- Can be searched in wider literature, rough location is acceptable but use
  fewer decimals

## Longitude

- Decimal format
- Maximal three decimals
- From Google Maps
- Can be searched in wider literature, rough location is acceptable but use
  fewer decimals

## Country

- Based on modern day definitions

> :warning: Must follow categories specified in `standards.tsv`

## Cultural_Era

- These are *approximate* chrono-cultural categories, following broad/general
  definitions
  - Therefore no arguing please. In most cases report as in publication, or
    closest equivalent
- Used to assist in grouping samples for timelines when no direct C14/historical
  record date

:warning: Must follow categories specified in `standards.tsv`

## Sample_name

- In most cases this should be the name of the host *individual*

## Sample_Host

- Latin, spaces replaced with underscores (`_`)
- If in doubt, follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/)

> :warning: Must follow categories specified in `standards.tsv`

# Sample_Age

- Single year without unit
- Of _Individual_ - not proxy dates
- Can be obtained from other publications
- In BP format!
- Calibrated radiocarbon date in preferred (take middle if range). 
  - When in doubt: https://nikhausmann.shinyapps.io/BP_to_BC_and_more/
- Infinite 14C can be kept at 49,999
- Historical dating also allowed (e.g. via coin or historial records)

## Sample Age DOI

- DOI of publication with e.g. radiocarbon date
- Can be duplicate of Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## Microbiome Type

- e.g. oral, gut

> :warning: Must follow categories specified in `standards.tsv`

## Microbiome Source

- e.g. calculus, palaeofaeces, intestinal, chewing gum

> :warning: Must follow categories specified in `standards.tsv`

## Archive

- e.g. [ENA](https://www.ebi.ac.uk/ena), [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> :warning: Must follow categories specified in `standards.tsv`

## Archive_Accession

- Of *sample*, where possible
- e.g. ERS, SRS
- If non-NCBI/ENA, use as close to Sample as possible
- Multiple can be separated with commas 
  - e.g. when different extracts of one sample incorrectly uploaded as samples
