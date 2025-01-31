# AncientMetagenomeDir - Radiocarbon Dates Column Specifications

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes columns definitions for the radiocarbon dating list. Right now it only applies to: 

- 🦠: host-associated ancient single genomes

Numeric fields (e.g. `delta_13c`), can be filled with `NA` to indicate 'no
reported value'. Free text fields (e.g. `calibration_software`) can be indicated with `NR` for not reported or `NA` when not applicable.

All column with 'defined categories' should be validated against
`assets/enums/<column>.json`. This is to ensure data consistency, e.g. if the material use for dating is Bone that they all are listed as `bone` (as defined in
`assets/enums/<column>.json`).

If you wish to a new category, please consult with the [SPAAM
community](spaam-community.github.io), and then add it to
`assets/enums/<column>.json`.

Radio carbon dates columns are as follows:

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
- If the authors re-used data from previously published studies that have not
  been added to AncientMetagenomeDir, please use the project name of the current
  study where metagenomics or microbial genomic analysis has been performed for
  all samples.

> ⚠️ [MIxS v5](https://gensc.org/mixs/) compliant field

> ⚠️ Mandatory value

## publication_year

- YYYY format

> ⚠️ Mandatory value

## data_publication_doi

- Publication DOI
- Or library permalink
  - e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr)
    etc.

> ⚠️ Mandatory value

## sample_name

- Unique identifier for that sample as used in publication
  - In most cases this should be the name of the host _individual_ (for host-associated samples)
  - If samples are referred to by multiple names, use the most informative
  - For environmental samples: if samples cannot be **directly** linked to data files by any names in the publication, generate names in the format e.g. [sequence]\_[depth]\_[original_name]

> ⚠️ Mandatory value


## archive_project

- A project level accession code under which all samples of a project are assigned to
- Specific examples:

  - Archive: ENA/SRA/DDBJ: should be _primary_ accession code beginning with `PRJ`. [Example](https://www.ebi.ac.uk/ena/browser/view/PRJNA438985).
  - Archive: MG-RAST: should be accession code beginning with `mgp`. [Example](https://www.mg-rast.org/mgmain.html?mgpage=project&project=mgp13354).
  - Archive: Dryad/FIGSHARE etc.: use the dataset's overall DOI as archive project accession.

- Missing value: `Unknown`

## archive_sample_accession

- Of _sample_, where possible
- For ENA/SRA: These should be **secondary** accession IDs to keep as close to
  data as possible (e.g. SRS, ERS, not SAMEA - see below)
- If non-NCBI/ENA, use as close to sample-level as possible
  - e.g. for Dryad/Figshare, use the numeric ID after 'file_steam' in the per-file download URL
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

## date_information_present

- Whether there is precise dating information.

- It can either be TRUE or FALSE.

- If FALSE, all the other columns must be filled with the corresponding missing value for the columns.

> ⚠️ Mandatory value


## date_is_radiocarbon

- Whether the precise date reported in the paper is a radiocarbon date.

- When not reported please specify `NR` and when not applicable `NA` (e.g. in case no precise dating was reported).

- Accepted values for this column are: `TRUE`, `FALSE`, `NR` or `NA`.

> ⚠️ Mandatory value

## archaeological_historical_date

- Specify the range or singular date reported in the paper that corresponds to archaeological or historical date. 

- The date must be reported in years Before Present (BP), understanding present as 1950. 

- When reported date is radiocarbon date please specify `NA`.

- Missing value: `NA`

## multiple_dates

- Whether multiple radiocarbon dates are reported from the same sample.

- If this is the case, please create multiple rows for that sample with all the radiocarbon dates reported. 

- Missing value: `NA`

## reference_location

- Location or first place where the precise-radiocarbon date was recorded in the primary citation publication (i.e, the publication in ancientMetagenomeDir):
  - Main text.
  - Supplement text.
  - Supplement table.

- Missing value: `NA`

## reference_citation_depth

- Where/when was the sample physically dated? 
  - `1`: radiocarbon date was published in the ancient metagenomics study.
  - `2`: the date was published in an earlier study.
  - `3`: the date was published in a different publication from the secondary citation.
  - `Unknown`: when it is unsure where the date was published. 
  - `NA`: for samples were not dating information is available.

- Missing value: `Unknown` or `NA`.

## primary_secondary_reference_citation_doi

- Digital Object Identifier (DOI) of the publication were the precise-radiocarbon date was published.

- Specify:

  -`Unknown` when `reference_citation_depth` is set to `Unknown`.

  - `NA` for samples were not dating information is available.

- Missing value: `Unknown` or `NA`.

## direct_dating

- Whether the sample in the ancient metagenomic study was directly radiocarbon dated.

- Values for the column are:
  - `TRUE`
  - `FALSE`
  - `NR`: for studies where this is not reported
  - `NA`: for samples where there is not radiocarbon dating.

## radiocarbon_lab_code

- Lab code for the radiocarbon lab where the dating was produced.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if the radiocarbon lab where the data was produced is not in this list, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## radiocarbon_lab_sample_id

- Numerical identifier from the radiocarbon dating lab that corresponds to the sample sent for radiocarbon dating.

- Specify:
  - `-99999`: when no sample identifier from the radiocarbon lab has been reported.
  - `NA`: when date is not a radiocarbon date.

## spectrometry_type

- The spectrophotometry method used to measure the delta carbon-13 value (δ13C or d13C):

  - `IRMS`:Isotope Ratio Mass Spectrometer.

  - `AMS`: Accelerated Mass Spectrometer.

- Specify:

  -`NR` when this is not reported.
  -`NA` when the sample has no radiocarbon date.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if the type of spectrometry used is not in this list, please ping
> @spaam-community/ancientmetagenomedir-coreteam

## pretreatment_reported

- Whether a pretreatment was applied to the sample prior to the radiocarbon measurement.

- Valid values:
  - `TRUE`: pretreatment applied

  - `FALSE`: no pretreatment applied

  - `NR`: pretreatment not reported or unsure whether a pretreatment was applied

  - `NA`: date is not a radiocarbon date


## pretreatment_type

- Which pretreatment was applied before the radiocarbon measurement.

- Missing value: `NA`

## sample_material

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

## uncalibrated date

- The uncalibrated date in calendar year date Before Present notation (aka before 1950s). 

- This is normally the value that the C14 lab will report.

- Specify:
  - `-99999` if a radiocarbon date is reported but the uncalibrated date is not reported

  -`NA` if date is not a radiocarbon date


## uncalibrated_uncertainty_plus_minus

- Uncertainty value around uncalibrated date in calendar year date Before Present notation, typically indicated by ± in the C14 lab report.

- Specify:

  - `-99999` if a radiocarbon date is reported but the uncalibrated uncertainty is not reported

  -`NA` if date is not a radiocarbon date


## delta_13c

- The δ13C value of the dating in ppm (‰). 

- Not reported values should be represented as `-99999`.

- `NA` should be used when date is not radiocarbon date.

## carbon_perc

- The percentage of carbon in a non-proteinaceous sample used for dating (such as charcoal), expressed as a percentage (%). Used as a quality control measurement. 

- Not reported should be represented as `-99999`

- `NA` should be used when date is not radiocarbon date.

## delta_13n

- The δ13N value of the dating in ppm (‰). 

- This value is important when reporting radiocarbon dates derive from collagen to determine whether there is a reservoir effect (date appearing to be older than it really is).

- Not reported should be represented as `-99999`

- `NA` should be used when date is not radiocarbon date.

## carbon_nitrogen_ratio

- Ratio of amount or concentrations of carbon to nitrogen. 

- Used for quality control value in proteinaceous samples for radiocarbon dating.

- Not reported should be represented as `-99999`

- `NA` should be used when date is not radiocarbon date.

## calibration_reported

- Whether a calibration for the radiocarbon date is reported.

- Values:
  - `TRUE`
  - `FALSE`

- `NA` should be used when date is not radiocarbon date.

## calibration_curve

- The tree-ring calibration curve used for calibration.

- `NA` should be used when date is not radiocarbon date.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration curves is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam

## calibration_software

- Software used for the calibration of the uncalibrated radiocarbon date.

- When the calibration software is not reported please specify `NR`.

- `NA` should be used when date is not radiocarbon date.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration software is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam

## calibration_software_version

- Specify which version of the calibration software has been used

- set `NR` if not reported

- `NA` should be used when date is not radiocarbon date.

## calibration_software_settings

- Settings used with the calibration software to calibrate the uncalibrated radiocarbon date.

- Specify `default` if default parameters where used, and if specific parameters were used report for example `-m 10`

- `NR` should if it is not reported.

- `NA` should be used when date is not radiocarbon date.


## calibration_software_citation_doi

- Digital Object Identifier (DOI) of the publication were the calibration of the radiocarbon date was published.


- Specify:
  - `NR` when calibration is reported but no calibration software is mentioned.
  - `NA` when date is not radiocarbon date or no calibration is reported.

## calibrated_range_lower

- The lower range of the calibrated date (aka. the oldest)

- If calibration has been done but the calibrated lower range is not reported, specify `-99999`

- `NA` should be used when date is not radiocarbon date or no calibration has been reported.

## calibrated_range_upper

- The upper range of the calibrated date (aka. youngest date)

- If calibration has been done but the calibrated upper range is not reported, specify `-99999`

- `NA` should be used when date is not radiocarbon date or no calibration has been reported.

## calibrated_range_median

- The median date of the calibrated date range.

- If calibration has been done but the calibrated median date is not reported, specify `-99999`

- `NA` should be used when date is not radiocarbon date or no calibration has been reported.


## calibrated_range_suffix

- The suffix of the calibrated date range, usually reported with calibrated or cal. before the time unit, e.g. cal BC or cal BP.

- `NA` should be used when date is not radiocarbon date or no calibration has been reported.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration range suffix is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## calibrated_range_sigma

- Confidence level of the reported calibrated age range, typically in 2 (95.4%) or 1 (68.2%) levels of significance (sigma).

- Accepted values:
  - `1`: corresponds to 68.2%
  - `2`: corresponds to 95.4%
  - `-99999`: no confidence level was reported

- If both confidence levels have been reported, record the one with the higher confidence interval.

- `NA` should be used when date is not radiocarbon date or no calibration has been reported.


## reservoir_offset_mentioned

- Whether a radiocarbon C14 reservoir offset mentioned in any form in the publication where the radiocarbon date is reported.
- Accepted values:
  - `TRUE`: a reservoir effect is mentioned in any form in the publication.
  - `FALSE`: here corresponds to not recorded (NR)

- Specify `NA` if: 
  - Date is not a radiocarbon date

## reservoir_offset_applied

- Whether a reservoir offset was applied to the radiocarbon date.

- Accepted values: `TRUE` or `FALSE`

- Specify `NA` if: 

  - Date is not a radiocarbon date

  - No reservoir effect was reported/mentioned.


## reservoir_offset_type

- Specify if the reported reservoir effect is of marine or freshwater origin.

- Accepted values:
  - `FRESHWATER`
  - `MARINE`

- Specify:
  - `NR` when reservoir effect has been reported but the type is not mentioned.
  - `NA` if not reservoir effect reported/mentioned or if date is not a radiocarbon date.

## reservoir_offset_reported

- The reported reservoir offset.

- If a reservoir effect was reported but the applied offser is not reported specify `-99999`.

- Specify `NA` if:

  - Date is not a radiocarbon date
  - No reservoir effect was reported.

## reservoir_offset_reported_sd

- Standard deviation of the reported reservoir offset. Should be indicated by ±

- If a reservoir effect was reported but the standard deviation of the actual offset applied is not reported specify `-99999`

- Specify `NA` if:
  - Date is not a radiocarbon date
  - No reservoir effect was reported for the specific sample.

## reservoir_aquatic_carbon_perc

- Percentage of δ13C estimate that corresponds to the fish contribution contributing to the reservoir offset value

- If a reservoir effect was reported but the carbon percentage from aquatic contribution is not reported specify `-99999`

- Specify `NA` if:
  - Date is not a radiocarbon date
  - No reservoir effect was reported for the specific sample.

## reservoir_aquatic_carbon_perc_sd

- Standard deviation of percentage of δ13C estimate that corresponds to the fish contribution contributing to the reservoir offset value. Should be indicated by ±

- If a reservoir effect was reported but the standard deviation of the carbon percentage from aquatic contribution is not reported specify `-99999`

- Specify `NA` if:
  - Date is not a radiocarbon date
  - No reservoir effect was reported for the specific sample.