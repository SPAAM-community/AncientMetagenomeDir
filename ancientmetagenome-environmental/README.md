# AncientMetagenomeDir - Environmental

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for the Environmental metagenome list.

This list covers metagenomes like:

- soil
- sediments
- ice cores

Numeric fields (e.g. latitude), can be filled with NA to indicate 'no reported value'. Free text fields (e.g. geo_loc_name) can be indicated with Unknown, and restricted category columns sometimes will have an unknown option.

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
- Missing name: `Unknown`

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field  

> :warning: Must follow categories specified in `assets/enums/<column>.json`  

> :warning: Mandatory value

## study_primary_focus

- The primary 'organism' category that the sequences was originally generated for
- These are generalised categories such as 'floral', or 'faunal', 'microbial',
  with a combination of those (in that order) also allowed.

> :warning: this does NOT necessarily imply that the data can only be used for
> the same purposes. This column is only to facilitate faster bibliographic
> review for equivalent dataset generation

## sequence_name

- Sediment only
- Identifier for sequence sample was taken from, e.g. core_3, or zone_a19
- Typically cores, or quadrant/square of excavation
- Missing value: `Unknown`

## depth

- Sediment only
- Depth of sample from top of sequence (cm)
- If reported as a range (e.g. 130-132 cm), take approximate mid-point
- Use NA if not a sequence (e.g. from surface of an open site)

## sample_name

- Unique identifier for that sample as used in the publication
- If samples are referred to by multiple names, use the most informative
- If samples cannot be **directly** linked to data files by any names in the publication, generate names in the format e.g. [sequence]\_[depth]\_[original name]

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

- In most cases, report the date in the publication of the given sample, even if the date is from an older publication (we assume the original citation can be found by looking at submitted article). _However_:
  - If a more recent and accurate date has been published this can be used!
  - Ensure to also update `sample_age_doi`

- If date _ranges_ reported, take approximate mid-point
- Dates for specific individual preferred.
- Proxy dates are allowed. e.g.
  - from other individuals in stratum/burial
  - period of occupation of site
  - via coin or historical records

- Sediment only:
  - If a layer is not directly dated, 'inferred' ages are allowed if there are at least two direct dates in the relevant sequence

> :warning: Mandatory value

## sample_age_doi

- DOI of publication with date derived from
- In most cases, please duplicate the DOI of the publication under submission,
  even if the date is from an older publication (we assume the original citation
  can be found by looking at submitted article). _However_:
  - If a more recent and accurate date has been published this can be used!
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> :warning: Mandatory value

## feature

- Description of the object, site, or immediate environment the sample was obtained from, following [Environment
  Ontology](https://www.ebi.ac.uk/ols/ontologies/envo)
  - e.g. midden, cave, ocean, lake, archeological site

> :warning: partly [MIxS v5](https://gensc.org/mixs/) compliant field, following
> [Environment Ontology](http://www.environmentontology.org/Browse-EnvO)  

> :warning: Must follow categories specified in `assets/enums/<column>.json`

> :warning: Mandatory value  

## material

- Description of sediment following [Environment
  Ontology](https://www.ebi.ac.uk/ols/ontologies/envo
  - e.g. permafrost, lake sediment, peat soil, bone

> :warning: partly [MIxS v5](https://gensc.org/mixs/) compliant field, following
> [Environment Ontology](http://www.environmentontology.org/Browse-EnvO)  

> :warning: Must follow categories specified in `assets/enums/<column>.json`

> :warning: Mandatory value  

## collection_date

- Year of collection of (sub-)sample for DNA analysis in YYYY format
  - e.g. not the year blood was drawn from a patient, but rather the year the
    aliquot was taken for DNA extraction from the sample in the museum
    collection, for the current study.
- If sample is from a sediment core, may be later than year of core collection
- Missing value: `NA`

> :warning: [MIxS v5](https://gensc.org/mixs/) compliant field

## archive_project

- A project level accession code under which all samples of a project are assigned to
- Specific examples:
  - Archive: ENA/SRA/DDBJ: should be _primary_ accession code beginning with `PRJ`. [Example](https://www.ebi.ac.uk/ena/browser/view/PRJNA438985).
  - Archive: MG-RAST: should be accession code beginning with `mgp`. [Example](https://www.mg-rast.org/mgmain.html?mgpage=project&project=mgp13354).

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
