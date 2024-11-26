# Reviewing a Pull Request

## Introduction

The AncientMetagenomeDir is a project led by the [SPAAM community](https://spaam-workshop.github.io/#/).

As a part of the quality control steps to ensure the information added to the repository are as accurate as possible, in addition to automated consistency checks, each submission undergoes peer-review by other members of the AncientMetagenomeDir project.

This walkthrough serves as a guide on how to peer-review submissions of sample (and in the future, library) metadata submissions.

The directory is accessed via Github. To follow these instructions you will need:

* To have a GitHub account.
* To be logged into that Github account.
* Be a member of the SPAAM-workshop organization
  * Contact any of the coreteam (@spaamworkshop/ancientmetagenomedir-coreteam) or James Fellows Yates (jfy133@gmail.com) to be added.

## Finding open pull requests for review

Each submission of metadata is 'proposed' by a GitHub **pull request** (also known as PRs). On the repository, open the [Pull requests tab](https://github.com/SPAAM-community/AncientMetagenomeDir/pulls).

![GitHub Pull Request tab and page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/01-pr_page.png)

If there are any open PRs, these will be listed here, and will have the basic publication information in the title of the pull request, e.g. `Guellil2020` or `Add Ottoni 2021`.

Click on a corresponding PR that **does not** have the `approved` label below the PR title that you wish to review (as these have already been reviewed 😉).

![Already reviewed and approved PR](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/02-approved_example.png)

## Preparation or review

Within a given PR page, you will find a variety of information that should help you get ready.

![Contents of a PR](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/03-example_pr_age.png)

1. The tick boxes in the main description should tell you whether this is a `New Publication` or a `Correction` to an already existing sample metadata entry.
2. The tick boxes will also indicate which AncientMetagenomeDir category the publication is for.
3. The main description will also normally have the URL or DOI to the publication.
   * If only the DOI is present, just append [`https://doi.org/`](https://doi.org/) to the beginning, e.g., `10.1371/journal.ppat.1009886` becomes [`https://doi.org/10.1371/journal.ppat.1009886`](https://doi.org/10.1371/journal.ppat.1009886).
   * If you use Chrome, you can use extensions such as `DOI Resolver` to make the link for you.
   * Sometimes links to the SRA/ENA project may also be posted.
4. The main description or the right-hand side bar will normally have the corresponding GitHub Issue.
   * This is where the paper was originally recommended for inclusion.
   * It may include extra information or discussions that may be relevant.

In addition, we suggest opening the following web pages (either as tabs or windows) before you start:

1. The page of the journal article itself.
2. Any potential supplementary information (either PDF or tables) that you think may have any relevant information.
3. The project page of data of the given raw data repository (e.g., the ENA or SRA sequence read archives).
   * You may have to get the project accession ID from the journal article itself, or the pull request `archive_project_accession` column (see below).
   * For the ENA you can load the project's metadata table by searching for the project accession ID [here](https://www.ebi.ac.uk/ena/browser/). You may need to customise the columns to get all the necessary information (check an AncientMetagenomeDir list's README to see relevant columns).
   * For the SRA you can load the proejct's metadata page by searching the project accession ID [here](https://www.ncbi.nlm.nih.gov/sra).
4. The README guidelines of the corresponding AncientMetagenomeDir list.
   * This can be opened from the `README` links in the tick boxes of the main PR description.

## Carrying out a review

### Checking the automated tests passed

The first step before reviewing is checking whether the submission has passed the automated consistency checks that occur when the PR is first opened.

You can normally see this on the main PR tab of the whole repository (where all PRs are listed), as each PR should have either a ✅ (green tick/check mark, passed), 🟡 (yellow circle, tests running), or ❌ (red cross, tests failed).

You can also check the discussion thread of a given PR itself. You should scroll to the bottom of the page, and see if there either the `All checks have passed` message in the `Review Required` box, or check the last comment from the `github-actions` bot. 

A successfully passing check should have `All is good, no errors were found !`, for all three lists (Metagenome Host Associated, Single Genome Host Associated, Metagenome Environmental).

* If you see **errors** reported for any of the lists:
  * follow up with the person who opened the PR whether the PR is ready yet or if they have any problems
  * Message them by either leaving a comment or messaging them on the [SPAAM slack](https://spaam-community.github.io/#/home)
* If you see a **truncated** set of messages:
  * e.g. just a `All is good` message for only one of the lists and not all three
  * Message James on Slack or leave a comment pinging `@jfy133` to investigate
* If **`All is good!`** for all three, you can start reviewing!

_Example of automated check errors_

![Errored automated check](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/04-check_errors.png)

_Example of automated check passing_

![Passed automated check](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/05-check_allgood.png)


## Finding the submission entries

To see the submission files itself, scroll to the top of the PR page, and click on the `Files changed` tab (next to Conversation, Checks etc.).

![Files changed tab of PR page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/06-pr_changed.png)

Here, you should normally see only two files changed.

These should be the `CHANGELOG` file and a TSV file of the corresponding list.

## General GitHub pull request review procedure

To review a PR, there are different ways of making feedback.

1. Firstly, press the green `Review changes` button in the top right.
2. When scrolling through the page, you can press the `files viewed` tick box (top right) for each file to keep track what you've already read.
3. (Optional) Make comments or suggestions of specific lines (you can make as many or as few as you wish).
    1. Hover your cursor on the corresponding line.
    2. You should see a blue button with a white cross in it (➕) on the left hand side.

        ![Files changed tab of PR page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/07-singleedit_bluebutton.png)

    3. When you press the button, or click the button and across drag multiple lines, it gives you a comment box.

        ![Files changed tab of PR page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/09-multilineedit.png)

    4. Post questions or comments about a line the comment box.
    5. To make a suggestion question, press the 'Suggestion' icon on the toolbar (file icon with + and - inside it).
    6. This will open a markdown code block which you can edit, and thus propose the change to the PR submitter.

        ![Files changed tab of PR page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/08-example_single_edit.png)

    7. Press `Start a review`/`Add review comment` (if already started) to save the specific comment.
4. To make general comments, e.g. for repeated or broad suggestions, press the green `Review changes` button in the top right.
   * Any comments written in the box are saved until you complete the review.
   * You can repeatedly open the general comment box as many times as you want throughout the review until you are finished and press `Submit review`.

        ![Files changed tab of PR page](https://github.com/SPAAM-community/AncientMetagenomeDir/raw/master/assets/tutorials/step_by_step_review/10-general_comments.png)

5. To complete the review press the green `Review changes` button, leave any final general comments, select approval/request changes as necessary and press `Submit review`.
   * All specific line changes will also be saved in the review.

## AncientMetagenomeDir specific procedures

### Checking the CHANGELOG

Here you should check the following

1. Check the new publication is added to the latest release
    * This should be the release at the top of the page
    * The release version should refer to the next quarter of the year, e.g. if you're reviewing in August 2021, the next release should be 21.09, i.e., 2021 September
2. The new publication is under the header of the corresponding list
    * e.g., samples added to the `ancientmetagenome-hostassociated.tsv` file should be under the `Ancient Metagenome Hosted Associated` header of the `CHANGELOG` file.
    * In some cases some publications may update two lists (e.g. microbial genomes from microbiome samples, therefore adding the samples to both the `Ancient Metagenome Hosted Associated` and `Ancient Single Genome Hosted Associated` lists).
3. The new publication should be in the format of `<First Author Surname> <YYYY> <doi>`
   * e.g.  `Wu 2021 10.1371/journal.ppat.1009886`

## Checking the metadata file

The review can be considered to consist of two stages, however both can be combined into a single review.

### Consistency Check

The first step for reviewing the metadata entries is to go through each column and check that each entry matches the criteria in the columns guidelines on corresponding README.

For example:

* Does the [project name](https://github.com/SPAAM-community/AncientMetagenomeDir/tree/master/ancientmetagenome-hostassociated#project_name)  match the format of `surnameYYY`, without punctuation nor accents?
* Do the [latitude and longitude](https://github.com/SPAAM-community/AncientMetagenomeDir/tree/master/ancientmetagenome-hostassociated#latitude) columns extend no more than 4 decimals?
* Does the site name already (partially) exist in the database, and is consistent with previous publications? 
* Are all the DOIs the same across all newly added lines (i.e., has an excel drag-down error converted them to incremented numbers)?

For small typo fixes we generally recommend making the suggestion using procedure described above with the blue button, however if there are systematic errors leave this in the general review box instead. 

We ask you to please complete the consistency check (i.e. all columns/samples) so all feedback is there for the submitter to correct, however if there are many systematic errors do not proceed to the _accuracy_ check step until these have been resolved (It is OK to combine consistency feedback and accuracy feedback if there are only a few minor consistency issues).

### Accuracy Check

Once the consistency check is completed, you then need to go through and check the accuracy of each column's new entries against what is actually reported in the paper, paper SI, or data repository.

Examples of things to check (but not limited to!):

1. Does the DOI take you to the correct paper?
2. Does searching the latitude/longitude values on Google Maps take you to the correct (approximate) location described in the paper?
3. Is the site name correct, or is it consistent with samples already in the list from the same site?
4. Do sample names match both reported in the paper and the sequencing data repository metadata table?
5. Is the sample age correct (but rounded to the closest century)? Are there any modern samples that should be removed?
7. Is the material type the same as reported in the publication?
8. Do the sample accession IDs in the AncientMetagenomeDir list match those reported on the ENA/SRA table?

## Once review completed

### Changes to be made

If there are changes to be made, when pressing `Submit review` press either `comment` or `request changes` to complete the review

Ideally also let the submitter know (on slack) you've finished so you can discuss if anything is unclear.

the reviewer can re-request you to review once they've made the changes, and you can check all the changes are as you suggested/requested.

### No more changes

If there are no changes to be requested (or only minor cosmetic suggestions), when pressing `Submit review`, press `Approve`.

Often people leave comments such as LGTM which stands for `Looks good to me!`, however this isn't necessary.

You can then ask the submitter if they want to merge, or you can merge for them (button at the bottom of the conversation).

## Final comments

Thank you very much for helping out! The more volunteers, the stronger the project and more useful it will become 💪.

For any questions (simple or complex!), doubts, help, advice, or suggestions, post a message in the #ancientmetagenomedir channel on the [SPAAM slack](https://spaam-community.github.io/#/home)!
