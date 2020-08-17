# AncientMetagenomeDir - Host Associated Metagenome

![check_dataset](https://github.com/spaam-workshop/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for the host-associated ancient
metagenome list.

This covers samples that contain metagenomes such as

- oral microbiome (e.g. from dental calculus, teeth)
- gut microbiome (e.g. from palaeofaeces, intestinal contents of mummies)
- 'skeletal' metagenomes (i.e. metagenomes derived from skeletal elements not representing original 'microbiomes' of a living individual)
- 'soft tissue' metagenomes (i.e. from mummified remains

Included samples should have evidence of the corresponding original host's
microbiome as reported in the given paper (e.g. a tooth should have evidence of
the oral microbiota to be included, otherwise the microbial community should be
considered a part of the natural decomposition and be placed under the
[environmental](../ancientmetagenome-environmental/README.md) list).

Numeric fields (e.g. Sample Age), can be filled with `NA` to indicate 'no
reported value'. Text fields (e.g. `geo_loc_name` can be indicated with
`Unknown`).

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
- Due to restrictions in regex (used for validation checks), **punctuation (e.g. hyphens or spaces) or characters with
  accents cannot be used**.
  - Use the non-accented version.
  - If the first author has multiple or hyphenated surnames,  write them all together capitalising each surname.

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field  

> :warning: Mandatory value  

## publication_year

- YYYY format

> :warning: Mandatory value  

## publication_doi

- Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> :warning: Mandatory value  

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

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field  

> :warning: Must follow categories specified in `assets/enums/<column>.json`  

> :warning: Mandatory value  

## sample_name

- Unique identifier for that sample as used in publication
  - In most cases this should be the name of the host *individual*

> :warning: Mandatory value  

## sample_host

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> :warning: Must follow categories specified in `assets/enums/<column>.json`

## sample_age

- Single date rounded to nearest century (i.e. end in '00')
  - e.g. something only 50 years old would be assigned as 100
- In Before Present (BP) format i.e. since 1950 AD (~2000 AD is also fine)
  - When in doubt:
    [https://nikhausmann.shinyapps.io/BP_to_BC_and_more/](https://nikhausmann.shinyapps.io/BP_to_BC_and_more/)
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

> :warning: Mandatory value  

## sample_age_doi

- DOI of publication with date derived from
- Can be duplicate of Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

## community_type

The type of community from the host's original body the sample is derived from.

- e.g. oral, gut

> :warning: Must follow categories specified in `assets/enums/<column>.json`

## material

- Sample type DNA was extracted from
  - e.g. denta calculus, palaeofaeces, intestinal, chewing gum

> :warning: Partly [MIxS v5](https://gensc.org/mixs/) compliant field, ideally a term from an [ontology](https://www.ebi.ac.uk/ols/index), but not currently mandatory  

> :warning: Must follow categories specified in `assets/enums/<column>.json`

> :warning: Mandatory value  

## collection_date

- Year of sample collection in YYYY format

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

- Missing value: `NA`

## archive

- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> :warning: Must follow categories specified in `assets/enums/<column>.json`  

> :warning: Mandatory value  

## archive_accession

- Of *sample*, where possible
- For ENA/SRA: These should be **secondary** accession IDs to keep as close to
  data as possible (e.g. SRS, ERS, not SAMEA - see below)
- If non-NCBI/ENA, use as close to sample-level as possible
- Multiple can be separated with commas
  - e.g. when different extracts of one sample incorrectly uploaded as samples
  
> :warning: Mandatory value  

<details>
  <summary>Expand to show location of ERS codes on ENA</summary>
  
  ![Location of ERS
  codes](../assets/images/spaam-AncientMetagenomeDir_ena_ers_location.png)
  
  Select the 'secondary_sample_accesion' and 'sample_alias' columns.

</details>
<details>
  <summary>Expand to show location of SRS codes on SRA</summary>

  ![Location of ERS
  codes](../assets/images/spaam-AncientMetagenomeDir_sra_srs_location.png)
  
  The SRS code is to the left of the SAMEA-like code under the **sample:** field

</details>
