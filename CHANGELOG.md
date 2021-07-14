# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project follows to [Calendar Versioning](https://calver.org/).

## v21.09: Taputapuātea [Unreleased]

### Added

#### Ancient Metagenome: Host Associated                                        

#### Ancient Single Genome: Host Associated                                     

#### Ancient Metagenome: Environmental                                          

#### Ancient Metagenome: Anthropogenic                                          

#### Misc

### Changed

- Ferrari2020: Corrected typo in accession ERS3935829 

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

- Cutibacterium acnes (deDios2020, 10.1016/j.meegid.2020.104209) changed from eukaryota to bacteria.
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
- deDios 2019 10.1099/mgen.0.000289
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
- Willman2018: re-list the community_type of tooth samples as skeletal tissue
- Brealey2020: re-list the community_type of tooth samples as skeletal tissue
- Maixner2016: collapsed _H. pylori_ genome samples into one
- Bos2016: Corrected site name
- Bos2011: changed site name for sample ES_6330 (6330) to Abbey St. Mary Graces
  after investigation from Monica Green
- Weyrich 2017: Added missing OAGR accession after consultation with authors
- Maixner2016: corrected singlegenome_domain 

### Removed
