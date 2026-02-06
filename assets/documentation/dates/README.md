# AncientMetagenomeDir - Dates Column Specifications

![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)

This page describes the column definitions for the list of dated samples. Currently  it only applies to:

- 🦠: host-associated ancient single genomes

Numeric fields (e.g. `delta_13c`), can be filled with `NA` to indicate 'no reported value'. Free text and non-numeric fields (e.g. `calibration_software`) can be indicated with `NR` for not reported, or `DNE` (does not exist) when not applicable.

All columns with 'defined categories' should be validated against `assets/enums/<column>.json`. This is to ensure data consistency, e.g. if the material used for dating is Bone, they all are listed as `bone` (as defined in `assets/enums/<column>.json`).

If you wish to add a new category, please consult with the SPAAM community, and then add it to `assets/enums/<column>.json`.

Dates columns are as follows:

## project_name

- Format: `SurnameYYYY` (YYYY in numeric format)
- Due to restrictions in regex (used for validation checks), **punctuation (e.g.
  hyphens or spaces) or characters with accents cannot be used**.
  - Use the non-accented version (e.g. ã or ä become a).
  - If the first author has multiple or hyphenated surnames, write them all
    together capitalising each surname.
    - e.g. AndradesValtuena2022, instead of Andrades Valtueña2022 or Andrades-Valtueña2022 
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


## publication_doi

- Publication DOI
- Or library permalink
  - e.g., [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr), etc.

> ⚠️ Mandatory value


## sample_name

- Unique identifier for that sample as used in publication
  - In most cases this should be the name of the host _individual_ (for host-associated samples)
  - If samples are referred to by multiple names, use the most informative
  - Must **not** be confused with _archive_project_ or _archive_sample_accession_
  
> ⚠️ Mandatory value

## sample_host

> 🧫 host-associated metagenome only!

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

> ⚠️ Mandatory value

## singlegenome_species

> 🦠 host-associated single genome only!

- Linnean latin name
- Follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/) where possible

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`

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


## date_information_present

- Whether there is precise dating information. These can be in the form of archaeological or historical dates, as well as radiocarbon dates.
- It can either be `TRUE` or `FALSE`.
- If `FALSE`, all the other columns must be filled with the corresponding missing value for the columns.

> ⚠️ Mandatory value


## date_is_radiocarbon

- Whether the precise date reported in the paper is a radiocarbon date.
- Set `NR` if not reported 
- Accepted values for this column are: `TRUE`, `FALSE`, or `NR`.

> ⚠️ Mandatory value


## archaeological_historical_date

- Specify the range or singular date reported in the paper that corresponds to an archaeological or a historical date.
- The date must be reported in years Before Present (BP), understanding present as 1950. E.g. if a burial has a grave dated to 1600 AD, the date should be entered as **350** (350 years BP).
- Where dates are given as a period range they should be converted to BP. eg. ‘6th-5th millennium BC’ should be entered as **7950-5950**.
- When both archaeological dates and radiocarbon dates are reported, enter each date into the relevant field. (Though * *uncalibrated radiocarbon dates* * are the priority.) 
- When there is only a radiocarbon date reported specify `DNE`.
- Missing value: `DNE`


## multiple_dates

- Whether multiple radiocarbon dates are reported from the same sample ( `TRUE` / `FALSE`).
- If this is the case, please create multiple rows for that sample with all of the radiocarbon dates reported.
- Missing value: `DNE`


## reference_location 

- The location or first place where the precise radiocarbon date was recorded in the primary citation publication (i.e, the publication in AncientMetagenomeDir):
  - Main text.
  - Supplement text.
  - Supplement table.
- Missing value: `DNE`


## reference_citation_depth

- Where was the initial report of the sample dating?
  - `1`: radiocarbon date was published in the ancient metagenomics study.
  - `2`: radiocarbon date was published in an earlier study.
  - `3`: radiocarbon date was published in a different publication from the secondary citation.
  - `unknown`: when it is unclear where the date was published.
  - `DNE`: for samples where no radiocarbon dating information is available.
- Missing value: `unknown` or `DNE`.


## primary_secondary_reference_citation_doi

- Digital Object Identifier (DOI) of the publication where the precise uncalibrated radiocarbon date was published.
- Or library permalink. e.g. [worldcat](https://www.worldcat.org/), [HAL](hal.archives-ouvertes.fr), etc.
- Specify:
  - `Unknown` when `reference_citation_depth` is set to `Unknown`.
  - `DNE` for samples were not dating information is available.
- Missing value: `Unknown` or `DNE`


## direct_dating_individual 

- Whether the radiocarbon date used for the ancient metagenomics study was derived from the individual. E.g. The sample used for the C14 dating is a rib or bone which was not used for the metagenomic analysis, but is from the same individual.
- Values for the column are:
  - `TRUE`
  - `FALSE`
  - `NR` if not reported
  - `DNE` if not a radiocarbon date


## direct_dating_element

- Whether the radiocarbon date used for the ancient metagenomics study was derived from the same element. E.g. the tooth used for the metagenomic analysis was also radiocarbon dated. 
- Values for the column are:
  - `TRUE`
  - `FALSE`
  - `NR` if not reported
  - `DNE` if not a radiocarbon date


## radiocarbon_lab_code

- Code for the radiocarbon lab where the sample was dated.
- The lab codes were extracted from https://radiocarbon.webhost.uits.arizona.edu/sites/default/files/2025-01/Labs-2025_01_16.pdf
  - e.g `MAMS`, `BRAMS`, `Poz`, `UCIAMS`, `KIA`
- set `NR` if not reported 
- set `DNE` if not a radiocarbon date

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`.
> If the radiocarbon lab where the data was produced is not in this list, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## radiocarbon_lab_sample_id

- Alphanumeric identifier from the radiocarbon dating lab that corresponds to the sample sent for radiocarbon dating. Each sample has a unique identifier assigned by the radiocarbon laboratory. E.g. `29816`, `1304`, `61584`.
- `-99999`: when no sample identifier from the radiocarbon lab has been reported.
- set `DNE` if not a radiocarbon date


## spectrometry_type

- The spectrometry  method used to measure the isotope ratios in a sample:
  - `IRMS`:Isotope Ratio Mass Spectrometer.
  - `AMS`: Accelerated Mass Spectrometer.
- Specify:
  -`NR` when this is not reported.
  -`DNE` when the sample has no radiocarbon date.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if the type of spectrometry used is not in this list, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## pretreatment_reported

- Whether sample pretreatment was applied/reported.
- Valid values:
  - `TRUE`: pretreatment applied and reported
  - `NR`: pretreatment not reported / unclear 
  - Set `DNE` if not a radiocarbon date


## pretreatment_type

- Which pretreatment was applied.
- Additional pretreatments are applied when contamination is suspected, eg. from glues.
- The pretreatment is dependent on the type of material used for radiocarbon dating. Common pretreatments based on the material used are:
  - Tooth/ Bone:
    - Acid only
    - Acid-base-acid (ABA or AAA)
    - Collagen; extraction with gelatinisation
    - Collagen (ultrafiltered); extraction with gelatinisation followed by ultrafiltration
    - Hydroxyproline
    - Bioapatite
  - Charcoal
    - Acid only
    - Acid-base-acid (ABA or AAA)
    - Acid-base-oxidation-stepped combustion (ABOx-SC)
  - Wood
    - Acid only
    - Acid-base-acid (ABA or AAA)
    - Holocellulose
    - Alphacellulose
- Missing value: `unknown` / `NR`
- Set `DNE` if not a radiocarbon date


## sample_material

- Sample element type that was radiocarbon dated
  - e.g. dental calculus, palaeofaeces, intestinal, chewing gum
  - e.g. permafrost, lake sediment, peat soil, bone
  - e.g. tooth, bone, dental calculus
- Set `unknown` for samples that have not been radiocarbon dated.

> ⚠️ Partly [MIxS v5](https://gensc.org/mixs/) compliant field, i.e. term from an [ontology](https://www.ebi.ac.uk/ols/index), and ideally either
> [UBERON](https://www.ebi.ac.uk/ols/ontologies/uberon) (anatomy) or
> [ENVO](https://www.ebi.ac.uk/ols/ontologies/envo) (everything else).
> If you can't find something close enough, please ping @spaam-community/ancientmetagenomedir-coreteam

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`


## uncalibrated date

- The uncalibrated date in calendar year date Before Present notation ( where ‘present’ = 1950).
- Specify:
  - `-99999` if the date is radiocarbon but the uncalibrated date is not reported.
  - Set `NA` if not a radiocarbon date.


## uncalibrated_uncertainty_plus_minus

- Uncertainty value around uncalibrated date in calendar year date BP, indicated by ± in the C14 lab report.
- Specify:
  - `-99999` if a radiocarbon date is reported but the uncalibrated uncertainty is not reported.
  - Set `NA` if not a radiocarbon date.


## delta_13c

- The δ13C value of the dated sample in ppm (‰).
- Set `-99999` if not reported.
- Set `NA` if not a radiocarbon date.


## carbon_perc

- The percentage of carbon in a non-proteinaceous sample used for dating (such as charcoal), expressed as a percentage (%). Used as a quality control measurement.
- Set `-99999` if not reported.
- Set `NA` if not a radiocarbon date.


## delta_15n

- The δ15N value of the dated sample in ppm (‰).
- When reporting radiocarbon dates derived from collagen a high nitrogen 15 value (<10‰)  can indicate the presence of a reservoir effect (date appearing to be older than it really is).
- Set `-99999` if not reported.
- Set `NA` if not a radiocarbon date.


## carbon_nitrogen_ratio

- Ratio of amount of concentration of carbon to nitrogen.
- Used as a quality control value in proteinaceous samples for radiocarbon dating; C:N ratio should range from 2.9 to 3.6
- Set `-99999` if not reported.
- Set `NA` if not a radiocarbon date.


## calibration_reported

- Whether a calibration for the radiocarbon date is reported.
- Values:
  - `TRUE`
  - `FALSE`
- Set `DNE` if not a radiocarbon date


## calibration_curve

- The calibration curve used.
  - e.g. `IntCal13`, `IntCal20`, `IntCal98`, `SHCal13`, `SHCal20`.
- Set `NR` if the date is not reported.
- Set `DNE` if not a radiocarbon date.

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration curves is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## calibration_software

- Software used for the calibration of the radiocarbon date.
  - e.g. `Calib`, `SwissCal`, `OxCal`.
- Set `NR` if the date is not reported.
- Set `DNE` if not a radiocarbon date.
  
> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration software is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## calibration_software_version

- Specify which version of the calibration software has been used
- Set `NR` if not reported.
- Set `DNE` if not a radiocarbon date.

> ⚠️ Must follow versioning as reported by the software. E.g. `4.3.2` or `4.4.4` for [OxCal](https://c14.arch.ox.ac.uk/oxcal.html), or `8.20` for [Calib](http://calib.org/calib/calib.html) as in their websites.

## calibration_software_settings

- Settings used with the calibration software to calibrate the radiocarbon date.
- Specify default if default parameters where used, and if specific parameters were used report for example `-m 10`
- Set `NR` if not reported.
- Set `DNE` if not a radiocarbon date.


## calibration_software_citation_doi

- Digital Object Identifier (DOI) of the software used to calibrate the date. E.g. for Oxcal cite: 10.1017/S0033822200033865 . For Calib cite: 10.1017/S0033822200013904 
- Specify:
  - `NR` when calibration is reported but no calibration software is mentioned.
  - `DNE` when date is not radiocarbon date or no calibration is reported.


## calibrated_range_lower

- The lower range of the calibrated date (aka. the oldest).
- If calibration has been done but the calibrated lower range is not reported, specify `-99999`
- Set `NA` if not a radiocarbon date or no calibration has been reported. 


## calibrated_range_upper

- The upper range of the calibrated date (aka. youngest date).
- If calibration has been done but the calibrated upper range is not reported, specify `-99999`
- Set `NA` if not a radiocarbon date or no calibration has been reported.


## calibrated_range_median

- The median date of the calibrated date range.
- If calibration has been done but the calibrated median date is not reported, specify `-99999`
- Set `NA` if not a radiocarbon date or no calibration has been reported. 


## calibrated_range_suffix

- The suffix of the calibrated date range, usually reported with calibrated or cal. before the time unit, e.g. `cal BC` or `cal BP`.
- Set `DNE` if not a radiocarbon date or no calibration has been reported. 

> ⚠️ Must follow categories specified in `assets/enums/<column>.json`
> if a different calibration range suffix is used, please ping
> @spaam-community/ancientmetagenomedir-coreteam


## calibrated_range_confidence_interval

- Confidence interval of the reported calibrated age range, either `95.4` or `68.2`.
- Accepted values:
  - `68.2`: corresponds to 68.2%
  - `95.4`: corresponds to 95.4%
  - `-99999`: no confidence interval was reported
- If both confidence intervals have been reported, record the one with the higher confidence interval.
- Set `NA` if not a radiocarbon date or no calibration has been reported. 


## reservoir_offset_mentioned

- Whether a radiocarbon C14 reservoir offset is mentioned in any form in the publication where the radiocarbon date is reported.

- Accepted values:
  - `TRUE`: a reservoir effect is mentioned in any form in the publication.
  - `FALSE`: here corresponds to not recorded (NR)

- Set `DNE` if not a radiocarbon date.


## reservoir_offset_applied

- Whether a reservoir offset was applied to the radiocarbon date.
- Accepted values: `TRUE` or `FALSE`
- Specify `DNE` if: 
  - Date is not a radiocarbon date
  - No reservoir effect was reported/mentioned.


## reservoir_offset_type

- Specify if the reported reservoir effect is of marine or freshwater origin.
- Accepted values:
  - `FRESHWATER`
  - `MARINE`
  - Set `NR` when reservoir effect has been reported but the type is not mentioned.
  - Set `DNE` if not reservoir effect reported/mentioned or if date is not a radiocarbon date.


## reservoir_offset_reported

- The reported reservoir offset.
- If a reservoir effect was reported, but the applied offset is not reported specify `-99999`.
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

- Estimated percentage of 13C corresponding to the aquatic contribution to the reservoir offset value.
- If a reservoir effect was reported but the carbon percentage from aquatic contribution is not reported specify `-99999`.
- Specify `NA` if:
  - Date is not a radiocarbon date
  - No reservoir effect was reported for the specific sample.


## reservoir_aquatic_carbon_perc_sd

- Standard deviation of the estimated percentage of 13C corresponding to the aquatic contribution to the reservoir offset. Should be indicated by ±
- If a reservoir effect was reported but the standard deviation of the carbon percentage from aquatic contribution is not reported specify `-99999`
- Specify `NA` if:
  - Date is not a radiocarbon date
  - No reservoir effect was reported for the specific sample.
