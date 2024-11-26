## Introduction

This document describes the release procedure for AncientMetagenomeDir. Releases are made periodically (~every three months) on the first day of a given month. Names of releases are derived from [this wiki page](https://github.com/SPAAM-workshop/AncientMetagenomeDir/wiki/Release-Name-List).

> [!WARNING]
> this release procedure currently requires knowledge of command-line git and admin privileges, however this maybe made automatic using Github Actions in the future.

## Preparation

Clone (or pull, if already cloned) the 'data-frozen' master (typically when a given release [milestone](https://github.com/SPAAM-workshop/AncientMetagenomeDir/milestones) is at 100%).

```bash
git clone https://github.com/SPAAM-workshop/AncientMetagenomeDir.git 
```

Change into the pulled directory

```bash
cd AncientMetagenomeDir
```

> [!WARNING]
> if you are pulling (rather than cloning), make sure you're on the `master` branch.

Run through the pre-release checks by running the following script

```bash
Rscript assets/analysis/prerelease-validation-crosstable.R  ancientsinglegenome-hostassociated/samples/ancientsinglegenome-hostassociated_samples.tsv ancientsinglegenome-hostassociated/libraries/ancientsinglegenome-hostassociated_libraries.tsv ancientsinglegenome-hostassociated/conflicts.csv
Rscript assets/analysis/prerelease-validation-crosstable.R  ancientmetagenome-hostassociated/samples/ancientmetagenome-hostassociated_samples.tsv ancientmetagenome-hostassociated/libraries/ancientmetagenome-hostassociated_libraries.tsv ancientmetagenome-hostassociated/conflicts.csv
Rscript assets/analysis/prerelease-validation-crosstable.R  ancientmetagenome-environmental/samples/ancientmetagenome-environmental_samples.tsv ancientmetagenome-environmental/libraries/ancientmetagenome-environmental_libraries.tsv ancientmetagenome-environmental/conflicts.csv
```

Check for any rows that have unexpected numbers of `NA`s that indicate a bad joining (tip: normally filtering for NA on the `publication_doi` column will find anything that is dodgy; in most cases it's because the `sample_name` columns between samples and libraries are not exactly the same). 

Once checked and fix, you can clean up with

```bash
rm -r ancient*/conflicts*
```

Next we do another check by opening the following file and runnning each step manually in R, and running through each line step by step.

Make sure to read through the comments for certain exceptions.

```txt
code assets/analysis/prerelease-validation-withintable.R
````
(Or open in Rstudio, or whatever R IDE is to your taste)

> [!NOTE]
> this has not been automated as often trying to work out why errors occur requires manual curation.

Once no errors are found, you can run the following script to get the release statement.

> [!WARNING]
> make sure to update the version tags at the top of the R script before running!

```bash
Rscript assets/analysis/release-stats-statement-generator.R
```

I would suggest double checking the numbers, but they should make sense. Also note this script also prints some social media release announcement text (see last section).

## Release Preparation

Update the `Latest Release` badge on ~line 6 of the `README` file, e.g.

```markdown
[![latest_release](https://img.shields.io/badge/Latest%20Release-v20.09-yellow)](https://github.com/SPAAM-workshop/AncientMetagenomeDir/releases)
```

to

```markdown
[![latest_release](https://img.shields.io/badge/Latest%20Release-v20.12-yellow)](https://github.com/SPAAM-workshop/AncientMetagenomeDir/releases)
```

Also remove the `[Unreleased]` tag in the CHANGELOG.md next to the corresponding release, on ~line 6. e.g.

```
## Release v20.12: Ancient City of Nessebar [Unreleased]
```

to

```
## Release v20.12: Ancient City of Nessebar
```

> [!TIP]
> Note that the UNESCO release 'name' does not have to be the full name of the UNESCO entry, it can be shortened for aesthetic/pronouncability reasons (some can be very long)

Push these changes to master

```bash
git add README.md CHANGELOG.md assets/analysis/release-stats-statement-generator.R
git commit -m "Update versions for release"
git push
```

Once pushed, **monitor the GitHub repository for the GitHub Actions check on master until it goes green** against the latest commit from 'actions-user' - this is to ensure you have the final stats images from the auto-updater. 

Once you get the tick, pull the repository one last time:

```bash
git pull
```

Run the following command to make a `.zip` archive containing just the table directories (and contents, changelog, final images, and README(s)).

```bash
VERSION=23.03.0
zip -r AncientMetagenomeDir_v"$VERSION".zip ancient*/ CHANGELOG.md README.md assets/images/figures/* assets/documentation/*
``` 
> [!WARNING]
> make sure to update the version in the ZIP name!

## Make Release

1. Go to the [GitHub releases page](https://github.com/SPAAM-workshop/AncientMetagenomeDir/releases), press 'Draft New Release'.

    It can also be useful to have open in a separate tab the [AncientMetagenomeDir Releases](https://github.com/SPAAM-community/AncientMetagenomeDir/releases) page open, so you can see the layout/structure of previous releases.

2. Fill in the release information as in this example:

    **Tag**: v20.09.0

    **Release Title**: v20.09: Ancient Ksour of Ouadane

    **Describe this release**: 

    The text should include:

    - a release description with some basic stats (number of new publications, new samples, and sample totals - take from 'RELEASE ANNOUNCEMENT' section of the `release-stats-statement-generator.R`), 
    - the full changelog of **this release**, 
        - make sure in the include the github handles of all the people who made PRs, and also ideally who reviewed them if they've not made their own PR (open each closed PR included this release, to get both lists of people).
    - and also the description for the corresponding [UNESCO information page](https://whc.unesco.org/en/list/) of the corresponding release name (see other releases as examples). 

> [!TIP]
> You can use the script `assets/utility/release_stats_statement_generator.R` to generate the statistics statement for you.


3. **IMPORTANT** upload the ZIP file in the 'Attach binaries' section.

4. Then press publish release!

## Clean up

1. Go to the [Zenodo release](https://doi.org/10.5281/zenodo.3980833), press the DOI badge of the latest release (above the 'Versions' panel on the right-hand side bar), and copy the 'Markdown' code.
2. Go back to the the releases page, and edit the release to add the markdown DOI code at the top of the description and press update.
3. Back on in your cloned repository, delete the ZIP file.

    ```bash
    rm Ancient*.zip
    ```

4. Now re-edit the CHANGELOG to add the next release from the release list _above_ the just made release, and add `[Unreleased]`, including all the subheadings (new publications, corrects etc.). E.g.

    ```
    # Changelog

    All notable changes to this project will be documented in this file.
    
    The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
    and this project follows to [Calendar Versioning](https://calver.org/).
    
    ## v21.03: Torn of Provins [Unreleased]
    
    ### Added
    
    #### Ancient Metagenome: Host Associated
    
    #### Ancient Single Genome: Host Associated
    
    #### Ancient Metagenome: Environmental
    
    ### Changed
    
    ### Removed
    
    ## v20.12: Ancient City of Nessebar
    <...>
    ```
5. Push changes

    ```bash
    git add CHANGELOG.md
    git commit -m "Update post-release info"
    git push
    ```

## Announcements

You can then send to the SPAAM committee's social media team the social media announcment stuff from `release-stats-statement-generator.R` script. 

Make sure to update the release name and list of contributors before sending to the committee!
