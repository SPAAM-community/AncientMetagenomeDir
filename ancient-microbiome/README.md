# AncientMetagenomeDir - Ancient Microbiome

This page describes columns definitions for the Ancient Microbiome list.

All fields must be lower case (except sample name). Spaces should be replaced with underscores. Optional fields (e.g. Sample Age), can be filled with `NA` to indicate 'no reported value'.

Sample columns are as follows:

- Publication
  - Format: surnameYEAR
- Publication year
- Publication DOI
- Site Name
- Latitude
  - Decimal format
  - Maximum three decimals
  - From Google Maps
- Longitude
  - Decimal format
  - Maximal three decimals
  - From Google Maps
- Country
  - Based on modern day definitions
- Approximate cultural era (regional)
- Sample Host
  - Latin, spaces replaced with underscores (`_`)
- Sample Age
  - Calibrated radiocarbon date in BP. Values in BCE can add 2000.
  - Of direct individual
  - Historical dating (e.g. via coin or historial records)
- Sample Age DOI
  - DOI of publication with e.g. radiocarbon date
  - Can be duplicate of Publication DOI
- Sample name
- Microbiome Type
  - e.g. oral, gut
- Microbiome Source
  - e.g. calculus, palaeofaeces, intestinal, chewing gum
- Archive
  - e.g. ENA, SRA, OAGR
- Sample Accession ID
  - e.g. ERS, SRS
  - Multiple can be separated with commas (e.g. when different extracts of one sample incorrectly uploaded as samples)

All defined categories should be validated against `standards.tsv`. This is to
ensure data consistency, e.g. so all Calculus samples are listed as `calculus`
(as defined in `standards.tsv`), and not Calculus or CaLcUlUs etc.

If you wish to a new category, please consult with the [SPAAM
community](spaam-workshop.github.io), and then add it to `standards.tsv`.