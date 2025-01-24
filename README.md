<p align="center">
<img src="assets/images/logos/spaam-AncientMetagenomeDir_socialmedia.png" width=50% >
<p/>

---

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-orange.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Cite us!](https://img.shields.io/badge/Published-Scientific%20Data-green)](https://doi.org/10.1038%2Fs41597-021-00816-y)
[![Release DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3980833.svg)](https://doi.org/10.5281/zenodo.3980833)
![check_dataset](https://github.com/spaam-community/AncientMetagenomeDir/workflows/check_dataset/badge.svg)
[![Joins us on Slack](https://img.shields.io/badge/slack-ancientmetagenomedir-blueviolet)](https://spaam-community.slack.com/channels/ancientmetagenomedir)
[![latest_release](https://img.shields.io/badge/Latest%20Release-v24.12.0-yellow)](https://github.com/spaam-community/AncientMetagenomeDir/releases)

AncientMetagenomeDir is a community curated resource of lists of all published
**shotgun**-sequenced ancient metagenome or microbial genome-level enriched samples and libraries.

It is primarily meant to act
as a reference guide to help point researchers toward any relevant public data
for comparative analysis. It is hoped it will help researchers track growth and
development of the field of ancient metagenomics over time.

<!-- TOC -->

- [Description](#description)
- [Usage](#usage)
- [Citation](#citation)
- [Current Status](#current-status)
  - [Samples](#samples)
  - [Libraries](#libraries)
  - [Interactive samples map](#interactive-samples-map)
- [Contributing](#contributing)
  - [Contributing your own Publications](#contributing-your-own-publications)
  - [Contributing previously published publications](#contributing-previously-published-publications)
  - [Guidelines and Conventions](#guidelines-and-conventions)
- [Core Team](#core-team)

<!-- /TOC -->

## Description

These lists contain information of ancient metagenomic samples such as publication, sample name, sample type,
geographic location, dates and DOIs and other accession numbers to raw data
in establised sequencing data databases.

We define here 'metagenome' in a broad sense, primarily focusing any data where the whole DNA content is analysed and
explored. Examples for this are (but not limited to) ancient microbiomes (host associated metagenome),
ancient sedimentary DNA (environmental) and also samples used for ancient pathogen
screening (single genomes).

The lists also contain metadata about all sequencing libraries generated from the corresponding samples.

See the README of each list for more detailed
descriptions of the contents of each list. Further modification and expansion of
these categories can be proposed to the [SPAAM community](https://spaam-community.github.io)
for further consideration.

The purpose of this repository is _not_ meant to be a comprehensive set of all
metadata about every ancient metagenome, but the aim is to have a lightweight
set of minimal information but with sufficient links to original sources of
detailed information. Keeping the repository simple and lightweight will promote
continual updating of the lists over a long period of time. That said, we will
design lists as far as possible to follow larger database metadata
specifications e.g.
[MIxS](https://www.ebi.ac.uk/ena/submit/mixs-checklists#MIxS_shared) for
compatibility.

Finally, we aim to make releases of this at regular intervals, and assign each
release a citeable DOI. Each release will also include a changelog to record all
additions and any corrections or modifications. Therefore researchers are free
to use the information in their own publications, as per the CC-BY 4.0 licence.

> ℹ️ A table for ancient anthropogenic metagenomes was
> included up until release v21.09 (Taputapuātea). However this was dropped in release
> "Pyu Cities" due to lack of interest from the community. It may be reinstated in
> the future.

## Usage

To download the latest _stable_ release of an AncientMetagenomeDir sample list:

1. Go to the AncientMetagenomeDir [Zenodo repository](https://doi.org/10.5281/zenodo.3980833)
2. Scroll down the page to the 'Files' section
3. Press the 'Download' button next to the `.zip` button
4. Once downloaded, unzip the archive by right-clicking and pressing e.g. decompress or extract
5. In the extracted folder, change into the sample list of interest, and open the `.tsv` file in a spreadsheet program (e.g. LibreOffice Calc, Microsoft Excel) or your programming language of choice (e.g. R)

To download the _bleeding edge_ AncientMetagenomeDir sample list:

1. Right click on one of the following URLs:
   - Ancient single genome - host associated: [samples](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv)
   - Ancient metagenome - host associated: [samples](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv)
   - Ancient metagenome - environmental [samples](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv)
   - Ancient single genome - host associated: [libraries](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv)
   - Ancient metagenome - host associated: [libraries](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv)
   - Ancient metagenome - environmental [libraries](https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv)
2. Press 'Save Link as' and save. The file name should end in `.tsv`.
3. Open the resulting `.tsv` file in a spreadsheet program (e.g. LibreOffice Calc, Microsoft Excel) or your programming language of choice (e.g. R).

⚠️ these TSV files in the repository represent the cutting-edge version, and are subject to change, please use the files in the 'releases' section or Zenodo archive for when using for reproducible science!

✅ For some spreadsheet software copy>paste of the raw format directly into a spreadsheet of the \_contents\* of the links above can work, if not, follow instructions above.

## Citation

📖 For **general** use of the project, please use the publication citation below.

For a specific _release_ citation (e.g. the version used for analysis), go to [Releases](https://github.com/SPAAM-community/AncientMetagenomeDir/releases) and use the DOI in the badge of the given release's description, or check the corresponding [Zenodo entry](https://doi.org/10.5281/zenodo.3980833)

Alongside the Zenodo ID of the release version, please also cite:

Fellows Yates, J. A., Andrades Valtueña, A., Vågene, Å. J., Cribdon, B., Velsko, I. M., Borry, M., Bravo-Lopez, M. J., Fernandez-Guerra, A., Green, E. J., Ramachandran, S. L., Heintzman, P. D., Spyrou, M. A., Hübner, A., Gancz, A. S., Hider, J., Allshouse, A. F., Zaro, V., & Warinner, C. (2021). Community-curated and standardised metadata of published ancient metagenomic samples with AncientMetagenomeDir. Scientific Data, 8(1), 31. DOI: [10.1038/s41597-021-00816-y](https://doi.org/10.1038/s41597-021-00816-y)

⚠️ You must also cite each paper you use data from, citing AncientMetagenomeDir is not sufficient on it's own!

> ℹ️ The AncientMetagenomeDir community curates this data on a voluntary basis, and therefore
> provides no warranty or completeness or accuracy of the data. If in doubt, refer
> to the original publication of a given sample. Corrections are accepted, and thus later
> versions may have different values.

## Current Status

### Samples

<p float="center">
  <img src="assets/images/figures/AncientMetagenomeDir-Sample_Timeline.svg" width="48%" height = "48%">
  <img src="assets/images/figures/AncientMetagenomeDir-Publication_Timeline.svg" width="48%" height = "48%">
  <img src="assets/images/figures/AncientMetagenomeDir-Sample_AgeTimeline.svg" width="48%" height = "48%">
  <img src="assets/images/figures/AncientMetagenomeDir-Sample_Map.svg" width="48%" height = "48%">
</p>

### Libraries

<p float="center">
  <img src="assets/images/figures/AncientMetagenomeDir-Library_Timeline_Libraries.svg" width="48%" height = "48%">
  <img src="assets/images/figures/AncientMetagenomeDir-Library_Timeline_Reads.svg" width="48%" height = "48%">
</p>

Vector (`.svg`) versions of all images and interactive map (`.geojson`) are available under [`assets/images/figures`](assets/images/figures). R code for all plots are freely available for modification in this repository under `assets/analysis/`

### Interactive samples map

[AncientMetagenomeDir](https://viewscreen.githubusercontent.com/view/geojson?url=https%3a%2f%2fraw.githubusercontent.com%2fSPAAM-community%2fAncientMetagenomeDir%2fmaster%2fassets%2fimages%2ffigures%2fancientmetagenomedir.geojson ":include :type=iframe width=100% height=400px")

(Viewable on the [AncientMetagenomeDir Website](https://spaam-community.github.io/AncientMetagenomeDir/#/) or [here](https://viewscreen.githubusercontent.com/view/geojson?url=https%3a%2f%2fraw.githubusercontent.com%2fSPAAM-community%2fAncientMetagenomeDir%2fmaster%2fassets%2fimages%2ffigures%2fancientmetagenomedir.geojson))

**Legend:**
Green: Environmental Metagenome,
Light Blue: Host Associated Metagenome,
Pink: Host Associated Single Genome

## Contributing

<p align="center">
<img src="assets/images/documentation/spaam-AncientMetagenomeDir_workflow.png" width=50% >
<p/>

If you are not familiar with Git(Hub), quick start step-by-step guides can be found in
the following (note these may be out of date):

- [Adding samples and libraries via pull request](https://github.com/SPAAM-community/AncientMetagenomeDir/wiki/Adding-metadata:-step-by-step-guide)
- Performing a pull request _review_ [here](https://hackmd.io/@jfy133/B156Z2mfP) or in PDF format [here](https://github.com/spaam-community/AncientMetagenomeDir/raw/master/assets/intro_to_ancientmetagenomedir_github_pull_request_review.pdf)

Samples must be from _published_ studies, and should only include _sample_ level
information. Preprints often have not made data avaliable at this point, and we make
the **assumption** that peer-review has correctly evaluated any submitted metagenome is
valid. Included papers should generally have uploaded their own data, however in certain
cases may see exceptions (such as retrieval of bacterial genomes from off-target reads from
human population studies). If unsure, please consult the AncientMetagenomeDir community on [slack](https://spaam-community.slack.com/channels/ancientmetagenomedir).

Samples must also have been accessible on public databases (e.g. [EBI
ENA](https://www.ebi.ac.uk/ena) or [NCBI
SRA](https://www.ncbi.nlm.nih.gov/sra)).

> Important: we do not currently record _sequencing data_ information, due to
> different uploading strategies by different groups.

### Contributing your own Publications

Contributing a new publication's sample information consists of the following:

- check under the
  [issues](https://github.com/spaam-community/AncientMetagenomeDir/issues) tab if
  the paper is already listed (if not, make one!)
  - check whether the issue has already been
    [closed](https://github.com/spaam-community/AncientMetagenomeDir/issues?q=is%3Aissue+is%3Aclosed)
  - if it listed, check to see if there is already a [pull
    request](https://github.com/spaam-community/AncientMetagenomeDir/pulls)
    linked to it
- assign yourself to the issue
- check if site/samples have been published before (i.e. to ensure the same
  names are used for any new samples)
- making your own fork or branch of the repository
- update the given list (e.g. in spreadsheet program, R etc.)
  - generally you will be copying direct from a publication's supplementary
    information
  - some columns have standard pre-defined categories, check a lists's README if
    in doubt!
  - if you need to add a category please request one by mentioning
    @ancientmetagenomedir-coreteam in your PR, or update the enums in JSON files
    under `assets/enums` yourself
- making a pull-request
- receive a review to check your additions follow current conventions
- have your PR merged
- close the issue

All contributions are attributed through Git's in-built recording of the author
of each commit and pull request. These will be displayed publically in the
future.

### Contributing previously published publications

In addition to researchers adding their own publications, we will also maintain
lists of published but not-yet-added studies using github issues.

Therefore researchers who wish to contribute who do not yet have their own
publications, can 'assign' themselves to specific 'issues' (papers), and reduce
the risk of duplicates.

Contribution of these publications follow as [above](#own-publications).

### Guidelines and Conventions

To ensure efficient and consistent searching, we include guidelines on how to
record and format information. Adherence to these guidelines is enforced by
'pull request' review by members of the SPAAM community and other contributors.
Furthermore, each category of metagenome will have their own 'special' fields,
which will be defined in each specific context.

## Core Team
The Core Team of AncientMetagenomeDir is responsible for the mantainance of the repository,
the organisation of training and hackathons events, as well as lead initiatives to improve 
AncientMetagenomeDir.
The current members of the Core Team are: 
- Alex Hübner ([@alexhbnr](https://github.com/alexhbnr))
- James Fellows Yates ([@jfy133](https://github.com/jfy133))
- Diana Spurite ([@DianaSpurite](https://github.com/DianaSpurite))
- Yuejiao Huang ([@YuejiaoHuang](https://github.com/YuejiaoHuang))
- Bianca Maria Bonucci ([@biancamariabonucci](https://github.com/biancamariabonucci))
- Piotr Rozwalak ([@rozwalak](https://github.com/rozwalak))
- Bjørn Peare Bartholdy ([@bbartholdy](https://github.com/bbartholdy))
- Aida Andrades Valtueña ([@aidaanva](https://github.com/aidaanva))


[![License: CC BY
4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)
