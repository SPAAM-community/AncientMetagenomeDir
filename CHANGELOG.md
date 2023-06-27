# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project follows to [Calendar Versioning](https://calver.org/).

## v23.06: Aachen Cathedral [unreleased]

### Added

#### Ancient Metagenome: Host Associated

- Kimsis 2023 10.1111/1758-2229.13157 (added by @maxibor)
- Honap 2023 10.1002/ajpa.24735 (added by @schummax/ @tomrichtermeier/ @Frederik-Lutz)

#### Ancient Single Genome: Host Associated

- Swali 2023 10.1038/s41467-023-38393-w (added by @DianaSpurite)

#### Ancient Metagenome: Environmental

- Rigou 2022 10.1093/femsml/uqac003 (added by @schummax, @tomrichtermeier, @Frederik-Lutz, and @alexhbnr)
- Armbrecht 2021, 10.1038/s43705-021-00070-8 (added by @ktozdogan)

### Changed

### Removed

## v23.03.0: Rocky Necropolis of Pantalica

### Added

#### Ancient Metagenome: Host Associated

- Moraitou 2022 10.1093/molbev/msac263 (added by @alexhbnr)
- Quagliariello 2022 10.1038/s41467-022-34416-0 (added by @alexhbnr)
- Sarhan 2023 10.1186/s12915-022-01509-7 (added by @msabrysarhan)

#### Ancient Single Genome: Host Associated

- Braun 2020 10.3390/microorganisms8020298 (added by @jfy133)
- Quagliariello 2022 10.1038/s41467-022-34416-0 (added by @DianaSpurite)
- Bonczarowska 2022 10.1186/s13059-022-02806-8 (added by @DianaSpurite)
- Eaton 2023 10.1016/j.cub.2023.01.064 (added by @DianaSpurite)
- Rifkin 2023 10.1038/s42003-023-04582-y (added by @mibr30)
- Sarhan 2023 10.1186/s12915-022-01509-7 (added by @msabrysarhan)

#### Ancient Metagenome: Environmental

- Kjaer 2022 10.1038/s41586-022-05453-y (added by @ktozdogan)
- Nwosu 2023,10.1038/s42003-023-04430-z (added by @ktozdogan)

### Changed

- Fixed md5sum hash error of a Ozga2019 sample
- Fixed md5sum hash error of a Granehall2021 sample
- Replace URLs of Velsko2022 with the ones from the column "fastq_ftp" instead of the column "submitted_ftp" from ENA

### Removed

## v22.12: Joya de Cerén

### Added

#### Ancient Metagenome: Host Associated

- Modi 2021 10.1016/j.quaint.2021.12.003 (added by @jfy133)
- Scorrano 2022 10.1038/s42003-022-04190-2 (added by @ktozdogan)
- Fagernäs 2022 10.1093/femsmc/xtac006 (added by @jfy133)
- Velsko 2022 10.1093/pnasnexus/pgac148 (added by @bbartholdy)

#### Ancient Single Genome: Host Associated

- Jäger 2022 10.1016/j.tube.2022.102181 (added by @DianaSpurite)
- Rieux 2021 10.1038/s41598-021-00518-w (added by @DianaSpurite)
- Guellil 2021 10.1038/s41598- 021- 98214-2 (added by @DianaSpurite)
- Guellil 2022 10.1186/s13059-021-02580-z (added by @DianaSpurite)
- Spyrou 2022 10.1038/s41586-022-04800-3 (added by @DianaSpurite)
- Neumann 2022 10.1016/j.cub.2022.06.094 (added by @DianaSpurite)
- Vågene 2022 10.1038/s41467-022-28562-8 (added by @DianaSpurite)
- Austin 2022 10.1038/s42003-022-03890-z (added by @DianaSpurite)
- Guellil 2022 10.1126/sciadv.abo4435 (added by @DianaSpurite)
- Long 2022 10.1038/s42003-022-03527-1 (added by @jfy133 )

#### Ancient Metagenome: Environmental

- Armbrecht 2022 10.1038/s41467-022-33494-4 (added by @ilight1542)
- Courtin 2022 10.1002/edn3.336 (added by @ktozdogan)
- Iwańska 2022 10.1038/s41598-022-12761-w (added by @ktozdogan)
- Gelabert 2021 10.1016/j.cub.2021.06.023 (added by @ktozdogan)
- Moore 2020 10.1002/ece3.6082 (added by @ktozdogan)
- Perez 2022 10.3390/microorganisms10081623 (added by @Darcy220606)

### Changed

- Synchronised site location name of PattersonRoss2018 with Long2022

### Removed

## v22.09.2: Pyu Ancient Cities

Correction: Correct release ZIP upload

## v22.09: Pyu Ancient Cities

### Added

- Extended repository to include library level metadata for all existing samples

#### Ancient Metagenome: Host Associated

- Granehäll 2021 10.1186/s40168-021-01132-8
- Maixner 2021 10.1016/j.cub.2021.09.031
- Kazarina 2021b 10.1016/j.jasrep.2021.103213

#### Ancient Single Genome: Host Associated

- Granehäll 2021 10.1186/s40168-021-01132-8
- Pfrengle 2021 10.1186/s12915-021-01120-2
- Kocher 2021 10.1126/science.abi5658
- Andrades Valtueña 2022 10.1073/pnas.2116722119

#### Ancient Metagenome: Environmental

#### Ancient Metagenome: Anthropogenic

- Due to the lack of community interest, this table has now been deprecated and will not be included in future releases of AncientMetagenomeDir. However it will be reinstated in the future if interest returns.

### Misc

- Added library metadata for FASTQ and BAM level data
- Changed the missing value from `NA` to `Unknown` for archive_project for the samples tsv
- Removed 'sampling date' columns from host-associated metagenome and single-genome sample tables as this is almost never reported

### Changed

- Changed archive_project from NA to Unknown for Taubenberger2005, PattersonRoss2018, Worobey2016
- Fixed Susat2021 DOIs (excel dragging error)
- Fixed Kazarina2021 Project/Sample accessions (column flip error)
- Fixed Morozova2020 DOIs (excel dragging error)
- Fixed Bieker2020 DOIs (paper partly reused previous data for new purpose and earlier had the other publication DOI. Now made all DOIs and dates consistent for the publication where metagenomics was performed)
- Fixed Bieker2020 sample USNH-39 into two separate 'artifical samples' due to upload of two libraries to two difference archives.
- Fixed Bieker2020 missing sample accession codes (due to later re-sequencing and non-reused SRS/ERS code)
- Fixed Muhlemann2018 Project ID (now available)
- Fixed FellowsYates2021 corrected typo in longitude 85.53 > -85.53
- Fixed Velsko2018 project name to Velsko2019 (wrong publication year)
- Fixed Schuenemann2011 Put the accession ID of the full plasmid sequence not partial
- Fixed Martin2013 corrected archive name (incorrectly reported in publication)
- Fixed Seersholm2016 archive ENA (from incorrectly specified as SRA)
- Fixed Eisenhofer2020 date rounding error (originally added 230 rather than 200)
- Fixed BravoLopez2020 typo in site name (Inmaculate -> Immaculate)
- Fixed Willmann2018 project_name (originally missing the second 'n')
- Fixed DeDios2020, DeDios2019, DeDios2021 project_names (originally had lowercase leading d)
- Fixed DeDios2020 sample_name from Jean-Paul Marat to Marat to make it consistent with the libraries uploaded in the ENA
- Fixed Campos2021 sample accession column had run accession
- Fixed Philips2017 fixed incorrect DOI (from later publication that reused same data)
- Fixed Wagner2014 incorrect archive in the samples tsv
- Fixed Eerkens2018 sample name from an individual name to the specific calculus sample name
- Fixed Zhou2018 by switching sample name to a clearer one based on the file name rather than just the project_archive ID
- Fixed Zhou2018 in ancientsinglegenome-hostassociated archive_project and archive_accession to be more explicit as of which files have been use to reconstruct the genome
- Fixed Campos2021 sample_name to HERB_1937 to make it consistent with the libraries uploaded in the ENA
- Fixed Borry2020 sample_name to match archaeological ID from paper (as opposed to laboratory ID which was in sample.tsv table)
- Fixed Velsko2019 accidental inclusion of old sample accessions to keep 'correct' sample accession of correct data
- Fixed Liang2021 sample names to be more specific to allow association with library names
- Fixed GuzmanSolis2021 archive_project and archive_accession to include the Dryad doi and the specific ids from the download links
- Fixed Ardelean2020 sample_name incorrect in samples tsv, replaced with sample_name from libraries tsv
- Fixed Morozova2020 typo in - Azov37 -> Axov38
- Fixed Morozova2020 accidental ERS code duplication across two samples

### Removed

- Removed Mendum2014 sample SK27 due to TreeBASE repository not being accessible any more
- Removed SantiagoRodriguez2016 and SantiagoRodridguez2016 samples as raw data is no longer publicly accessible on MG-RAST
- Removed Braadbaart2020 as uploaded data was not shotgun data as required for inclusion in environmental table
- Removed Worobey2016 samples SF74 and SF73 as not in final consensus sequences
- Removed Schulte2021 sample accessions of targeted capture libraries (which were different from the shotgun libraries)
- Removed Schuenemann2018 libraries (Jørgen\_\*) that were originally published in tandem with and already included in KrauseKyora2018b

## v21.09: Taputapuātea

### Added

#### Ancient Metagenome: Host Associated

- Ottoni 2021 10.1073/pnas.2102116118
- Rampelli 2021b 10.1016/j.isci.2021.102816
- Brealey 2021 10.1016/j.cub.2021.08.010

#### Ancient Single Genome: Host Associated

- Susat 2021 10.1016/j.celrep.2021.109278
- De Dios 2021 10.1016/j.isci.2021.103021
- Campos 2021 10.1371/journal.ppat.1009714
- Guzmán-Solis 2021 10.7554/eLife.68612
- Wu 2021 10.1371/journal.ppat.1009886

#### Ancient Metagenome: Environmental

#### Ancient Metagenome: Environmental

- Moguel 2021 10.1038/s41598-021-92981-8

#### Ancient Metagenome: Anthropogenic

#### Misc

### Changed

- Corrected _H. pylori_ having taxonomic domain to bacteria from virus
- Ferrari2020: Corrected typo in accession ERS3935829
- BravoLopez2020: Corrected typo in site name Inmaculate Conception > Immaculate Conception

### Removed

## v21.06: Côa Valley and Siega Verde

### Added

#### Ancient Metagenome: Host Associated

- Wibowo 2021 10.1038/s41586-021-03532-0
- Fellows Yates 2021 10.1073/pnas.2021655118
- Farrer 2021 10.1038/s41598-021-86100-w

#### Ancient Single Genome: Host Associated

- Seguin-Orlando 2021 10.1016/j.isci.2021.102383
- Haller 2021 10.1016/j.isci.2021.102419
- Guellil 2020 10.1073/pnas.2009677117
- Danneels 2021 10.1016/j.cub.2021.03.049
- Kocher 2021 10.1126/science.abi5658

#### Ancient Metagenome: Environmental

- Wibowo 2021 10.1038/s41586-021-03532-0
- Schulte 2021 10.1111/1755-0998.13311
- Lammers 2021 10.1038/s42003-021-01710-4
- Liang 2021 10.1186/s40168-021-01057-2

#### Ancient Metagenome: Anthropogenic

#### Misc

### Changed

- Changed `collection_date` column to `sampling_date` to clarify this is when drilling, or sub-sampling for DNA analysis was performed
- Corrected date for GLZ001 from Yu et al. (2020) from 4400 to 4600 based on the re-calibrated reported date in the paper (doi: 10.1016/j.cell.2020.04.037)

### Removed

## v21.03: Town of Provins

### Added

- [#348](https://github.com/SPAAM-community/AncientMetagenomeDir/pull/348): Interactive GeoJSON maps rendered with GitHub
- [#349](https://github.com/SPAAM-community/AncientMetagenomeDir/issues/349): No spaces allowed in `archive_accession` column.

#### Ancient Metagenome: Host Associated

- Philips 2017 10.1186/s12864-020-06810-9
- Kazarina 2021 10.3390/genes12020309
- Seguin-Orlando 2021 10.1016/j.cub.2020.12.015
- Rampelli 2021 10.1038/s42003-021-01689-y
- Witt 2021 10.1038/s41598-021-82362-6

#### Ancient Single Genome: Host Associated

- Philips 2020 10.1186/s12864-020-06810-9
- Kılınç 2021 10.1126/sciadv.abc4587

#### Ancient Metagenome: Environmental

- Rampelli 2021 10.1038/s42003-021-01689-y

#### Ancient Metagenome: Anthropogenic

#### Misc

- Added project accession column to all tables to help finding other samples from same project

### Changed

- Cutibacterium acnes (DeDios2020, 10.1016/j.meegid.2020.104209) changed from eukaryota to bacteria.
- Corrected publication_doi and sample_age_doi for Jacobson2020 (10.1098/rstb.2019.0586)
- Corrected overwritten new SRA information for Weyrich 2017 (10.1038/nature21674)
- Corrected date DOI spreadsheetdragging error for Armbrecht 2020 (10.1111/1755-0998.13162)

### Removed

## v20.12: Ancient City of Nessebar

### Added

#### Ancient Metagenome: Host Associated

- Modi 2020 10.1007/s12520-019-00983-5
- Appelt 2014 10.1128/AEM.03242-13
- Eisenhofer 2020 10.1098/rstb.2019.0578
- Jacobson 2020 10.1098/rstb.2019.0589
- Sabin 2020 10.1098/rstb.2019.0576
- Williams 2020 10.1128/MRA.00850-20
- Fotakis 2020 10.1098/rstb.2019.0584

#### Ancient Single Genome: Host Associated

- Susat 2020 10.1038/s41598-020-71530-9
- Eisenhofer 2020 10.1098/rstb.2019.0578
- Morozova 2020 10.1098/rstb.2019.0569
- Schuenemann 2018 10.1371/journal.pntd.0006447
- Ferrari 2020 10.1098/rstb.2019.0572
- Williams 2020 10.1128/MRA.00850-20
- Fotakis 2020 10.1098/rstb.2019.0584
- Marciniak 2016 10.1016/j.cub.2016.10.016
- Gelabert 2016 10.1073/pnas.1611017113
- Taubenberger 2005 10.1038/nature04230
- Lugli 2017 10.1186/s40168-016-0221-y
- Bravo Lopez 2020 10.1098/rstb.2019.0580

#### Ancient Metagenome: Environmental

- Added new metadata columns to improve data reconstructions: sequence_name (e.g. core, transect), depth, feature (e.g. cave, lake), study type.
- Braadbaart 2020 10.1016/j.jasrep.2020.102468
- DerSarkissian 2016 10.1111/1755-0998.12679

#### Ancient Metagenome: Anthropogenic

#### Misc

- Added 'live-status' summary images that are displayed on README and updated on every new submission.

### Changed

- Ardelean 2020: Differentiated samples with identical names
- Ahmed 2018: Updated sample_age and sample_age_doi
- Graham 2016: Updated sequence_name
- Wang 2017: Updated sequence_name
- Pedersen 2016: Updated sequence_name and corrected two typos in depth
- Armbrecht 2020: fixed broken DOI due to spreadsheet drag-down error
- de Dios 2019: Standardised coordinates and location name with Gelabert 2016 for accuracy
- van Dorp 2020: Standardised coordinates and location name with Gelabert 2016 for accuracy
- Weyrich 2017: Replaced OAGR codes with newly uploaded SRA accession numbers

## v20.09: Ancient Ksour of Ouadane

### Added

#### Ancient Metagenome: Host Associated

- Warinner 2014 10.1038/ng.2906
- Weyrich 2017 10.1038/nature21674
- Velsko 2018 10.1186/s40168-019-0717-3
- Jensen 2019 10.1038/s41467-019-13549-9
- Fagernäs 2020 10.1016/j.jas.2020.105135
- Mann 2018 10.1038/s41598-018-28091-9
- Brealey 2020 10.1093/molbev/msaa135
- Ozga 2019 10.1038/s41598-019-53802-1
- Ottoni 2019 10.1038/s41598-019-56074-x
- Zhou 2018 10.1016/j.cub.2018.05.058
- Wilman 2018 10.1371/journal.pone.0196482
- Nieves-Colón 2020 10.1093/molbev/msz267
- Ozga 2016 10.1002/ajpa.22960
- Santiago-Rodriguez 2016 10.1093/femsec/fiw182
- Santiago-Rodriguez 2017 10.3390/genes8110310
- Maixner 2016 10.1126/science.aad2545
- Ferrari 2018 10.3390/genes9090436
- McDonough 2018 10.1093/jmammal/gyy080
- Campana 2014 10.1186/1756-0500-7-111
- Bieker 2020 10.1111/1755-0998.13174
  - In addition to new samples, includes re-utilised data from Sánchez-Barreiro 2016 10.1111/1755-0998.12610 and Exposito-Alonso 2018 10.1371/journal.pgen.1007155
- Neukamm 2020 10.1186/s12915-020-00839-8
- Eerkens 2018 10.1016/j.ijpp.2018.05.001

#### Ancient Single Genome: Host Associated

- Warinner 2014 10.1038/ng.2906
- Bos 2014 10.1038/nature13591
- Schuenemann 2013 10.1126/science.1238286
- Schuenemann 2018 10.1371/journal.ppat.1006997
- Devault 2017 10.7554/eLife.20983
- Mühlemann 2018 10.1038/s41586-018-0097-z
- Düx 2020 10.1126/science.aba9411
- Andrades Valtueña 2017 10.1016/j.cub.2017.10.025
- Rasmussen 2015 10.1016/j.cell.2015.10.009
- Spyrou 2018 10.1038/s41467-018-04550-9
- Rascovan 2019 10.1016/j.cell.2018.11.005
- Yu 2020 10.1016/j.cell.2020.04.037
- Guellil 2018 10.1073/pnas.1807266115
- Duggan 2016 10.1016/j.cub.2016.10.061
- de Barros Damgaard 2018 10.1038/s41586-018-0094-2
- Key 2020 10.1038/s41559-020-1106-9
- Barquera 2020 10.1016/j.cub.2020.04.002
- Krause-Kyora 2018 10.7554/eLife.36666
- Giffin 2020 10.1038/s41598-020-66012-x
- Feldman 2016 10.1093/molbev/msw170
- Bar-Gal 2013 10.1002/hep.25852
- Keller 2019 10.1073/pnas.1820447116
- Mühlemann 2018b 10.1073/pnas.1804921115
- Wagner 2014 10.1016/S1473-3099(13)70323-2
- Bos 2011 10.1038/nature10549
- Bos 2016 10.7554/eLife.12994.001
- de-Dios 2020 10.1016/j.meegid.2020.104209
- Patterson Ross 2018 10.1371/journal.ppat.1006750
- Vågene 2018 10.1038/s41559-017-0446-6
- Zhou 2018 10.1016/j.cub.2018.05.058
- Sabin 2020 10.1186/s13059-020-02112-1
- Kay 2014 10.1128/mBio.01337-14
- Devault 2014 10.1056/NEJMoa1308663
- Kay 2015 10.1038/ncomms7717
- van Dorp 2020 10.1093/molbev/msz264
- Worobey 2016 10.1038/nature19827
- Kerudin 2019 10.1016/j.jas.2019.105035
- Schuenemann 2011 10.1073/pnas.1105107108
- DeDios 2019 10.1099/mgen.0.000289
- Duggan 2020 10.1186/s13059-020-02079-z
- Namouchi 2018 10.1073/pnas.1812865115
- Spyrou 2016 10.1016/j.chom.2016.05.012
- Martin 2013 10.1038/ncomms3172
- Spyrou 2019 10.1038/s41467-019-12154-0
- Krause-Kyora 2018b 10.1038/s41467-018-03857-x
- Majander 2020 10.1016/j.cub.2020.07.058
- Yoshida 2013 10.7554/eLife.00731 (KM117502 and KM117507 not included, no data in the ENA PRJEB1877)
- Mühlemann 2020 10.1126/science.aaw8977
- Mendum 2014 10.1186/1471-2164-15-270
- Neukamm 2020 10.1186/s12915-020-00839-8
- Eerkens 2018 10.1016/j.ijpp.2018.05.001

#### Ancient Metagenome: Environmental

- Ahmed 2018 10.1016/j.quascirev.2017.11.037
- Gaffney 2020 10.3390/geosciences10070270
- Slon 2017 10.1126/science.aam9695
- Smith 2015 10.1126/science.1261278
- Ardelean 2020 10.1038/s41586-020-2509-0
- Domain 2020 10.3389/fevo.2020.00218
- Armbrecht 2020 10.1111/1755-0998.13162
- Pedersen 2016 10.1038/nature19085
- Graham 2016 10.1073/pnas.1604903113
- Wang 2017 10.1111/jbi.13010
- Seersholm 2016 10.1038/ncomms13389

#### Ancient Metagenome: Anthropogenic

### Changed

- Fagernäs 2020: Fixed missing sample age DOI
- Ottoni 2019: Fixed duplicate SRA codes
- de-Dios 202: Added sample data
- Schuenemann 2018: dates corrected calculating based on 1950
- Willmann2018: re-list the community_type of tooth samples as skeletal tissue
- Brealey2020: re-list the community_type of tooth samples as skeletal tissue
- Maixner2016: collapsed _H. pylori_ genome samples into one
- Bos2016: Corrected site name
- Bos2011: changed site name for sample ES_6330 (6330) to Abbey St. Mary Graces
  after investigation from Monica Green
- Weyrich 2017: Added missing OAGR accession after consultation with authors
- Maixner2016: corrected singlegenome_domain

### Removed
