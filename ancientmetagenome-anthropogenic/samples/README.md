# AncientMetagenomeDir - Anthropogenic Metagenome

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for the anthropogenic metagenome list.

This list covers human created or highly-modified metagenomes like:

- artefacts (from pot crusts, parchment etc.)
- non-host associated microbiome samples (e.g. decomposition communities of
  museum or herbarium samples)
- storage environments of samples
- building environment metagenomes

Numeric fields (e.g. latitude), can be filled with `NA` to indicate 'no
reported value'. Free text fields (e.g. `geo_loc_name`) can be indicated with
`Unknown`, and restricted cateogory columns sometimes will have an `unknown` 
option.

All column with 'defined categories' should be validated against
`assets/enums/<column>.json`. This is to ensure data consistency, e.g. all Lake
Sediment samples are listed as `lake sediment` (as defined in
`assets/enums/<column>.json`). This is to ensure data consistency.

If you wish to a new category, please consult with the [SPAAM
community](spaam-community.github.io), and then add it to
`assets/enums/<column>.json`.

Sample columns are as follows:

## project_name

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
- Mandatory value

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field  

> :warning: Must follow categories specified in `assets/enums/<column>.json`  

> :warning: Mandatory value

## sample_name

- Unique identifier for that sample as used in publication

> :warning: Mandatory value

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


> :warning: Mandatory value

## sample_age_doi

- DOI of publication the sample_age date is derived from
- In most cases, please duplicate the DOI of the publication under submission,
  even if the date is from an older publication (we assume the original citation
  can be found by looking at submitted article). _However_:
  - If a more recent and accurate date has been published this can be used!
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> :warning: Mandatory value

## material

- Description of sediment.
  - e.g. pot crust, parchment, herbarium sample

> :warning: Partly [MIxS v5](https://gensc.org/mixs/) compliant field, i.e. term
> from an [ontology](https://www.ebi.ac.uk/ols/index), and ideally either
> [UBERON](https://www.ebi.ac.uk/ols/ontologies/uberon) (anatomy) or
> [ENVO](https://www.ebi.ac.uk/ols/ontologies/envo) (everything else). If you
> can't find something close enough, please ping
> @spaam-community/ancientmetagenomedir-coreteam

> :warning: Must follow categories specified in `assets/enums/<column>.json`

> :warning: Mandatory value  

## sampling_date

- Year of sampling of (sub-)sample for DNA analysis in YYYY format
  - e.g. not the year blood was drawn from a patient, but rather the year the
    aliquot was taken for DNA extraction from the sample in the museum
    collection, for the current study.
- Missing value: `NA`

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## archive

- e.g. [ENA](https://www.ebi.ac.uk/ena),
  [SRA](https://www.ncbi.nlm.nih.gov/sra), [OAGR](https://www.oagr.org/)

> :warning: Must follow categories specified in `assets/enums/<column>.json`  

> :warning: Mandatory value

## archive_project

- A project level accession code under which all samples of a project are assigned to
- Specific examples:
  - Archive: ENA/SRA/DDBJ: should be _primary_ accession code beginning with `PRJ`. [Example](https://www.ebi.ac.uk/ena/browser/view/PRJNA438985).
  - Archive: MG-RAST: should be accession code beginning with `mgp`. [Example](https://www.mg-rast.org/mgmain.html?mgpage=project&project=mgp13354).

- Missing value: `NA`

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
