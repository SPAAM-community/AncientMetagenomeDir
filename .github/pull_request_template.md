# Pull Request

This PR is for a

- [ ] [New Publication(s)](#new-publication)
- [ ] [Correction](#correction)

For the following list(s):

- [ ] ancientmetagenome-environmental ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientmetagenome-environmental))
- [ ] ancientmetagenome-hostassociated ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientmetagenome-hostassociated))
- [ ] ancientsinglegenome-hostassociated ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientsinglegenome-hostassociated))

This is to close <!-- REPLACE this comment (including the < > symbols) with a hashtag and the corresponding issue number here, e.g. #10 -->

### Checklist (New publications)

- [ ] Publication is published
  - Preprints currently not accepted?
- [ ] Checked the publication is not already in the database?
- [ ] Checked samples in this publication are not previously published _data_?
  - Newly re-sequenced metagenomes are OK!
- [ ] Samples are shotgun metagenomes and not amplicon data
  - Note: hostassociated-singlegenome may also contain whole-genome enriched data
- [ ] Checked the list follows conventions as described in the corresponding sample type's README file (e.g. using ERS/SRS accession codes for ENA/SRA)?
- [ ] **Once sample table validation completed** Library metadata has been added
  - Use `@spaam-bot please autofill <table_name> <project_id>` to get a half-filled template! May take a minute or so to get the comment with the file
  - Fill in template, and **verify** autofill data correct!
  - Once filled in, append(!) the new rows to the end of the corresponding library metadata file
- [ ] Changelog is updated to include the publication under 'Added'?
