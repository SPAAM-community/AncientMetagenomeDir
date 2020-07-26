# AncientMetagenomeDir - Ancient Microbiome

This page describes columns definitions for the Ancient Microbiome list.

Spaces should be replaced with underscores. Optional fields (e.g. Sample Age), can be filled with `NA` to indicate 'no reported value'.

Sample columns are as follows:

- Publication
  - Format: surnameYEAR
- Publication year
- Publication DOI
  - Or library permalink
- Site Name
- Latitude
  - Decimal format
  - Maximum three decimals
  - From Google Maps is recommended
  - Can be searched in wider literature
- Longitude
  - Decimal format
  - Maximal three decimals
  - From Google Maps
  - Can be searched in wider literature
- Country
  - Based on modern day definitions
- Approximate cultural era (regional)
- Sample name
  - In most cases this is the name of the host individual
- Sample Host
  - Latin, spaces replaced with underscores (`_`)
  - If in doubt, follow [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/Taxonomy/)
- Sample Age
  - Of _Individual_ (not proxy dates)
  - Can be obtained from other publications
  - Calibrated radiocarbon date in BP preferred (take middle if range). Values in BCE can add 2000.
  - Infinite 14C can be kept at 49,999
  - Historical dating also allowed (e.g. via coin or historial records)
- Sample Age DOI
  - DOI of publication with e.g. radiocarbon date
  - Can be duplicate of Publication DOI
  - Or library permalink
- Microbiome Type
  - e.g. oral, gut
- Microbiome Source
  - e.g. calculus, palaeofaeces, intestinal, chewing gum
- Archive
  - e.g. ENA, SRA, OAGR
- Sample Accession ID
  - e.g. ERS, SRS
  - If non-NCBI/ENA, use as close to Sample as possible 
  - Multiple can be separated with commas (e.g. when different extracts of one sample incorrectly uploaded as samples)

All defined categories should be validated against `standards.tsv`. This is to
ensure data consistency, e.g. so all Calculus samples are listed as `calculus`
(as defined in `standards.tsv`), and not Calculus or CaLcUlUs etc.

If you wish to a new category, please consult with the [SPAAM
community](spaam-workshop.github.io), and then add it to `standards.tsv`.