# Pull Request

This PR is for a

- [ ] [New Publication(s)](#new-publication)
- [ ] [Correction](#correction)

For the following list(s):

- [ ] ancientmetagenome-environmental ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientmetagenome-environmental))
- [ ] ancientmetagenome-hostassociated ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientmetagenome-hostassociated))
- [ ] ancientsinglegenome-hostassociated ([README](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/ancientsinglegenome-hostassociated))

This is to close <!-- REPLACE this comment (including the < > symbols) with a hashtag and the corresponding issue number here, e.g. #10 -->

### PR Workflow

1. Open this PR with sample metadata on the samples metadata sheet (:tada: you're already here!)
2. Wait for checks for sample metdata to pass
3. (If checks fail) make corrections, and push changes to this branch (no need to open a new PR!)
4. (Once passed) comment on this PR `@spaam-bot please autofill <table_name> <project_id>` to get a half-filled template! (may take a minute or so to get the comment with the file)
5. Fill in the template, and **verify** autofilled data correct!
6. Once filled in, append(!) the new rows from the TEMPLATE file to the end of the corresponding library metadata file, and update this PR
7. Wait for checks for library metadata to pass
8. Only for ancientsinglegenome-hostassociated: fill the dates table
9. Request review!

### Pre-review checklist (new publications)

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
- [ ] For ancientsinglegenome-hostassociated: fill the dates table!
- [ ] Changelog is updated to include the publication under 'Added'?
