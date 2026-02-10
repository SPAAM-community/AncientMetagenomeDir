# Adding samples to AncientMetagenomeDir

Originally written by Eleanor Green (@eg715), with contributions from the SPAAM Community.

---

<!-- TOC -->

- [Adding samples to AncientMetagenomeDir](#adding-samples-to-ancientmetagenomedir)
  - [Introduction](#introduction)
  - [Selecting and assigning publications](#selecting-and-assigning-publications)
  - [Preparation](#preparation)
    - [Making a new branch](#making-a-new-branch)
    - [Excel/Spreadsheet set up](#excelspreadsheet-set-up)
  - [Collect metadata](#collect-metadata)
    - [Some tips](#some-tips)
  - [Upload metadata](#upload-metadata)
    - [Commit changes](#commit-changes)
    - [Update Change log](#update-change-log)
    - [Update enumns](#update-enumns)
  - [Making a pull request](#making-a-pull-request)
    - [Pull request automatic checks](#pull-request-automatic-checks)
    - [Identifying problems and fixing failed checks](#identifying-problems-and-fixing-failed-checks)
  - [Add library metadata](#add-library-metadata)
    - [Preparation](#preparation-1)
    - [Semi-Automated](#semi-automated)
    - [Manual](#manual)
  - [Additional Metadata](#additional-metadata)
  - [Submitting the library table](#submitting-the-library-table)
  - [Request reviewers](#request-reviewers)
    - [Making reviewer requested changes](#making-reviewer-requested-changes)
  - [Adding dates metadata](#adding-dates-metadata)
    - [Preparation](#preparation-2)
    - [Collect date metadata](#collect-date-metadata)
    - [Helpful tips](#helpful-tips)
  - [Submitting the dates table](#submitting-the-dates-table)

<!-- /TOC -->

## Introduction

The AncientMetagenomeDir is a project led by the [SPAAM community](https://spaam-workshop.github.io/#/). The Directory is accessed via [Github](https://github.com/SPAAM-workshop/AncientMetagenomeDir). This document is to serve as a guide to contributing new publications to the Directory. To follow these instructions you will need:

- To have a Github account
- To be logged into that Github account
- Be a member of the SPAAM-workshop organization
  - Contact any of the maintainers on the SPAAM [element](https://matrix.to/#/#ancientmetagenomedir:matrix.org).

## Selecting and assigning publications

Samples to be added to the AncientMetagenomeDir must be from published studies, and entries should only include sample level information. Preprints often have not made data available and we make the assumption that peer-review has correctly evaluated any submitted metagenome as valid. Samples must also be accessible on public databases (e.g. EBI ENA or NCBI SRA).
If would like to contribute already published work by others, rather than your own papers, there is a list of published works which are yet to be added to the AncientMetagenomeDir under the [Issues tab](https://github.com/SPAAM-workshop/AncientMetagenomeDir/issues). If the publication is not yet there (either under open or close issues), feel free to make an issue, so the community can evaluate if the publication is valid for inclusion.

Once a publication is approved, and you've selected a publication you would like to add, you can select papers and assign it to your account (so others know you're working on it!):

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/1.png" width=75%>
</p>

---

## Preparation

### Making a new branch

To begin the process, make a branch that is identical to the `master branch`, which you will edit without impacting the `master branch` (for an explanation of branches, see the slides linked above). To make a new branch go to the [<> Code tab](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master). Click on the `master` button and type in the `Find or create a branch…` bar. Here you can check the paper doesn’t already have a branch (if it does, you need to contact the assignee and check they are happy to collaborate with you), and create a new one for the paper. For example, below I am creating a branch called `Ferrari_2018`, where I will add the metadata from [Ferrari et al. 2018](https://www.mdpi.com/2073-4425/9/9/436):

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/2.png" width=75%>
</p>

### Excel/Spreadsheet set up

Now you have made the branch make sure you are in it by checking what is written in the grey box at the top of the page.

Within the branch you have created, navigate to the subdirectory the paper has been assigned to. This will be one of the following:

- ancientmetagenome-environmental
- ancientmetagenome-hostassociated
- ancientsinglegenome-hostassociated

If you’re not sure you can check this by looking at the labels assigned on the Issues tab.

When in the correct directory, select the `.tsv` file for this category. Below you can see that I am in the `Ziesemer-2015` branch and I am looking at the `.tsv` file for the ancientmetagenome-hostassociated category:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/4.png" width=75%>
</p>

Click the little pencil icon at the top of the `.tsv`, when you hover over the right icon it will say `Edit this file`:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/5.png" width=75%"
</p>

This will open up the `.tsv` table in its raw form, copy the first line (make sure you copy all of the first line - scroll right!).

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/6.png" width=75%"
</p>

Paste this line into your preferred spreadsheet tool (Microsoft Excel, LibreOffice Calc, Google Sheets, etc.) , this is where we will record all the information for easier copying. In most spreadsheet tools you can then resize the columns and freeze the top row etc. - Whatever makes it easier to work. Then start adding the data entries.

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/7.png" width=75%"
</p>

---

## Collect metadata

If you haven’t already, go to the publication you are working on and have a quick read through, pull up the supplementary data etc.
When filling in the data, each sample from the publication will get a new row.

For guidance on what information to add to each column see the `README.md` for a handy guide (each list, e.g. ancientmetagenome-hostassociated has its own `README.md`, so make sure you’re checking the right one).

### Some tips

- Do not add spaces at the beginning or end of data entries, for example the "geo_loc_name" column is checked against a predetermined list of countries, so if you type “Netherlands ” rather than just “Netherlands” they’ll be an issue as it won’t match.
  - To check the columns that must match a predetermined list see [AncientMetagenomeDir/assets/enums/](https://github.com/SPAAM-workshop/AncientMetagenomeDir/tree/master/assets/enums)

- Recording the site latitude and longitude can be a bit tricky if not recorded in the paper. Here’s what you should do if this is the case:
  - If there is a map of the site in the paper, try and approximate on Google maps (latitude, longitude):

    <p align=center>
    <img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/8.png" width=50%>
    </p>

  - If the site name is a local town, or the described site location is near a local town click in the middle of that area and only record the latitude and longitude to 2 decimal places (we usually ask for 3 decimal places when location is well described). If only a very rough location is described or indicated on a map (e.g. a region), put the midpoint and use 2 decimal places

  - If just a Country is listed as the sample location with no further information, input the coordinates of the middle of that particular Country but with no decimal places

- All dates included will be the uncalibrated radiocarbon dates recorded to the nearest 100 years BP.
  - To help you with date conversions from those recorded in different formats, you can use this [Date Conversion tool](https://nikhausmann.shinyapps.io/BP_to_BC_and_more/) by [Nik Hausmann](https://twitter.com/NiklasHausmann). With this tool you can easily convert BC (or BCE) and AD (or CE) dates to BP. It's brilliant!

  - When there is a date range given, I have been calculating the midpoint, and inputting that date into the tool linked above. For example, if the range is 1028 - 1172 CE, the mid point is 1100 CE. This is inputted into the Date Conversion tool under the AD to BP tab which comes out as 850 BP. This would be rounded up to 900BP for the database.

  - For samples more recent than 1850, the age should be assigned as 100BP, e.g. something dating to 1944 would be assigned as 100BP

  - If the sample age is not reported, this sample should **not** be included. This is particularly relevant to sediment studies - taking a midpoint between two dated layers is not sufficient due to bioturbation

- Be sure to record the correct `archive_accession`. Check out the `.README` where you’ll see a screenshot of where to find the secondary sample accession IDs within different databases. These normally should be ‘SRA sample’ IDs (i.e. ERS or SRS for the ENA and NCBI SRA respectively), however please ask on [Element](https://matrix.to/#/#ancientmetagenomedir:matrix.org) if you are in doubt or have a different archive. **Careful:** You may have multiple ERS/SRS codes per sample as some people upload each library as a different ‘sample’. If this is the case be sure to include all the sample accessions comma separated list: ERRXXXX,ERRXXXXX,ERRXXXX. Always go with the sample accession rather than the run accession.

- If you have more than one sample (e.g. a tooth and bone, tooth and calculus, two teeth) taken from the _same_ individual, this counts as _two data entries_ on two separate rows - just make sure you have got the `sample_name` down accurately.

_Some time later..._

Now all your data is added, your sheet should look something like this:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/10.png" wdith=75%>
</p>

---

## Upload metadata

Upload the data you have recorded to Github by navigating to correct `.tsv` in the branch you created. Here, click the `edit` icon (as above) and simply copy the rows from your Excel and paste into the `.tsv` (don't copy the header row!). Here I have added Ziesemer2015 entries to the bottom of the `ancientmetagenome-hostassociated.tsv`:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/11.png" width=75%>
</p>

### Commit changes

You then need to commit your changes, to do this use the commit box at the bottom of the edited `.tsv`, add some kind of title to the top smaller box (the lead author and date is probably the most sensible choice), you can also add additional comments if you want to. For example, maybe you are only committing half the samples at this point. Below I had encountered duplicated samples which I have flagged in this comments box:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/12.png" width=75%>
</p>

Click the green `Commit changes` button. You will then appear as a contributor at the top of the page (mini yay :tada: )

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/13.png" width=40%>
</p>

### Update Change log

To keep track of which publications are included in particular releases of AncientMetagenomeDir. we are keeping a change log. To update the `CHANGELOG.md`, navigate back to your branch (not the master branch!) and click on the `CHANGELOG.md`:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/14.png" width=75%>
</p>

As before, click the little pencil to `edit` this file:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/15.png" width=75%>
<p>

Add the details of the publication you are working on to the bottom of the row of the given list, following the same format as above. You need to include the first author surname, date and the DOI:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/16a.png" width=75%>
</p>

Commit this change just as you did above:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/17.png" width=75%>
</p>

### Update enumns

If you are recording a species, or material that has not been recorded before, you will need to add it to the predetermined list. To do this you will need to create a new branch just for the additional enums. As before, create a new branch from the Master branch, navigate to `AncientMetagenomeDir/assets/enums` and add to the necessary list (see a list's README for specifications). Edit the list in the same way that you edited the `CHANGELOG.md` with the name of the new “thing” (species, material, etc.).

If you're not sure whether you need to update a list, don't worry - you will be informed during validation checks (see [below](#identifying-problems-and-fixing-failed-checks)!).

---

## Making a pull request

So that your additions can be reviewed and merged with the main `.tsv` file, you need to make a pull request (sometimes called PR). If you have just committed, when you go to the `pull requests` tab you will see a banner detailing your branch, click `Compare & pull request`. You also need make a pull request for the branch you made to update the enums (if applicable).

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/18.png" width=75%>
</p>

Then you will need to fill out a short form saying what you have done and summarising what information you are adding. Just put an x in between the correct square brackets (make sure there is no space: [x] and not [x ], or you can also tick the boxes by clicking after opening).

Also look out for markdown comments that ask you to replace comments with some information e.g. to post the number of the proposed publication issue ID. Markdown comments look like this `<!-- SOME COMMENT -->`.

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/19a.png" width=75%>
</p>

Only fill the boxes _before/until_ the `Correction` header, this bit is only if you're making a correction to a previously submitted and merged publication.

In the checklist, there will also be the option to tell the reviewer you need new enums adding. Tick the box for `"(If applicable) Made a separate PR to add new categories to controlled lists (stored under /assets/enums, e.g. material or archive)? If so the corresponding PR is here:"` and add pull request ID you created for the enums addition. See [below](#identifying-problems-and-fixing-failed-checks), if you're still unsure if you need to make a enum PR. (You can always edit your PR comment after making the PR!).

Click `Create pull request`

### Pull request automatic checks

When you have made the pull request, automatic checks take place against `AncientMetagenomeDir/assets/enums/`, you can see the results of these checks at the bottom of your given PR page or you can go back to the `Pull requests` tab to check on their status.

Here’s the bottom of the pull request:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/20.png" width=75%>
<p>

Here’s the `Pull requests` tab:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/21.png" width=75%>
<p>

You can see in the screenshot above that Ziesemer 2015 has a little red cross by its side. This means the checks have failed. Duggan2016 below, has a little green tick - the tests have passed.

### Identifying problems and fixing failed checks

So what do you do when you have a little red cross?

To view the error (and then hopefully fix it) click on your branch under the `Pull request` tab. Scroll down to under the PR form you filled in, here you will see comments from the `github-actions` bot detailing your error:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/22a.png" width=75%>
</p>

Here you can see the specific line the error appears on and what is wrong. In the example above ‘skull‘ and 'Rattus rattus' are not recognised terms. This is because they are not listed in AncientMetagenomeDir/assets/enums/. When my enums branch is merged this won't be a problem. See [above](#update-enumns) for instructions on how to update the enum.

Another common mistake made in the main TSV is leaving a space at the end of a controlled field, e.g. in the country name. To fix this, we need to go back to the `.tsv` and delete that extra space with a new commit. When this is done **do not make another pull request**, instead go back to the `Pull request` tab where the checks will be automatically run again (i.e. github assumes anything on your branch is a part of the PR, so changes after opening of the PR are automatically updated).
If you have an orange dot, it means the checks are running:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/25.png" width=75%>
</p>

After the checks, if you get another red cross, repeat the steps listed in `"Identifying problems and fixing failed checks”` , until you get a green tick to say you have passed all the checks:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/26.png" width=75%>
</p>

Ask on the SPAAM slack #ancientmetagenomedir channel if you have any difficulties.

---

## Add library metadata

Once you have passing tests for sample metadata, it's time to add metadata for library-level type of data.

The good news, is this is normally much more straight forward than getting archaeological information, but also the SPAAM community provides additional tooling to make this is a much nicer experience.

### Preparation

During this tutorial we will be modifying a library-level metadata table. This is stored in the `library` folder of the corresponding AncientMetagenomeDir section (i.e., microbiomes, microbial genomes, or environmental DNA). Have this table open, and copy and paste the **entire** table into your preferred spreadsheet tool (as with the sample metadata instructions).

In addition, we recommend to have open (if not already):

- Publication itself
- Publication supplementary information
- The [ENA](https://www.ebi.ac.uk/ena/browser) or [SRA](https://www.ncbi.nlm.nih.gov/Traces/study/) run browsers, already with the corresponding project/study accession number added
- The corresponding README for the library metadata table

### Semi-Automated

Once your sample-level metadata is validated, you can request a semi-pre-filled file that has most of the library metadata you need already prepared for you!

You can request this by leaving a comment on the pull request with the following comment:

> @spaam-bot please autofill <AncientMetagenomeDir Table of project> <project key>

For example:

> @spaam-bot please autofill ancientmetagenome-hostassociated Fiorin2024

After a few seconds, you will see a :eyes: emoji posted on your comment, to let you know the automated data scraping has began,

![image](https://github.com/SPAAM-community/AncientMetagenomeDir/assets/17950287/00433ebd-cf5b-4a77-9866-39100aa5f3ec)

And a minute or so later a new comment will be posted with a link you can press to download a ZIP file that will contain a file starting with `TEMPLATE_<...>`

![image](https://github.com/SPAAM-community/AncientMetagenomeDir/assets/17950287/4fe0e11e-8bf8-45d2-bf0c-8d2fa81517b4)

<p class="note">
<em>NOTE</em>&nbsp; If an error occurs, you'll get another message with instructions on what to do
</p>

This file includes relevant library metadata from the ENA (and SRA) databases, that are already available alongside the FASTQ file files themselves.

Open the `TEMPLATE_` file in your preferred spreadsheet manager, and start filling it in (but note the instructions below about [additional metadata](@#additional-metadata)!) - just as you have down with the sample metadata sheet above! There are dedicated README file with column descriptions for the library metadata tables too :).

⚠️ _IMPORTANT_ It is also critical to **verify** that the pre-filled columns are _also_ correct! In some cases the information on the ENA will be _incorrect_ (e.g. very often the Instrument Platform column!)

### Manual

In some cases, the semi-automated library level table metadata scraping will fail, in this case we need to pull the metadata of the libraries and sequencing files ourselves.

- If the publication you're adding has SRA/ENA sample accession codes (i.e., starting with `ERS`/`SRS`)
  - Look for the project accession code (beginning e.g., with `PRJNA` or `PRJNB`)
  - Search the accession code [ENA](https://www.ebi.ac.uk/ena/browser) or [SRA](https://www.ncbi.nlm.nih.gov/Traces/study/) run browsers
  - Download the table in TSV or CSV format (whatever you prefer) and open in your favourite spreadsheet manager
    - Make sure to select all relevant columns with the `Show Column Selection` menu before downloading
- If your publication has some other accession codes (i.e., from other databases), sorry but we can't automate that yet 😢.
  - You will have to extract the information manually from the paper itself, like for sample metadata information (open the library metadata table, copy the header in a separate file, fill in the rows, copy the new rows back to the metadata table etc.)
  - However, just like with sample metadata, we use the READMEs and JSON enums files to define specifications, so follow these for guidance

## Additional Metadata

In the AncientMetagenomeDir library-level table, there are columns that do not exist in the auto-generated table.

Some of these columns can be _inferred_ from columns in the auto-generated table. For example, finding whether a library had a UDG (USER-) enzyme treatment to (fully, or partially) remove damage MAY be described in the auto-generated table columns `library_construction_protocol
` or `library_design_description`.

In other cases, such as for finding information about `strand_type` or `library_polymerase`, you will have most likely search in the original publication method's section for this information.

In both cases, make sure to check the guidelines in the README and, if applicable, the corresponding column's [`enum`](https://github.com/SPAAM-community/AncientMetagenomeDir/tree/master/assets/enums) file.

## Submitting the library table

Once your library metadata is ready, go to your PR, open the corresponding file on your branch.

Append your new metadata to the end of the library metadata, and make a commit (just as with the sample metadata).

Once again your Pull Request will go through automated checks, and leave you comment if there is something wrong. Once you've got all green ticks, if you’re working on the ancientsinglegenome-hostassociated list you should [enter the dates information](#adding-dates-metadata-ancientsinglegenome-hostassociated-only) as a last step. If you're working on another sample type, it’s time to move onto human review!

## Request reviewers

The final step is to request reviewers, click on your pull request and then click the little cog next to `Reviewers` on the right hand banner. To find reviewers, post a message in the slack group and find a willing volunteer! To add reviewers simply click their names in the drop down box shown below. If in doubt, ask on the SPAAM slack #ancientmetagenomedir channel.

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/27.png" width=75%>
</p>

### Making reviewer requested changes

The reviewers will cross-reference the data is correct, will make comments on your data and add suggestions for changes if needed, you can see how this looks here:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/28.png" width=75%>
</p>

Edit the `.tsv` file and commit the requested changes.

When these changes have been approved, and checks have passed for a final time, you can merge the pull request! To do this scroll down to the bottom of the `Pull request` tab and click `Merge pull request`.

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/29.png" width=75%>
</p>

Confirm the merge:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/30.png" width=75%>
</p>

When prompted then you can delete the branch you have been working on as all the information has been added nicely to the `master branch`.

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-workshop/AncientMetagenomeDir/master/assets/tutorials/step_by_step/31.png" width=75%>
</p>

Annndddd that's it! You made it!!! :tada: :star_struck: :star:

---

## Adding dates metadata

Once you have passing tests for the sample and library tables, it's time to add metadata regarding the precise dating of each sample if you are working on either the `ancientsinglegenome-hostassociated` or `ancientmetagenome-hostassociated` tables.

### Preparation

During this tutorial we will be updating the dating information metadata table. This is stored in the dates folder of the AncientMetagenomeDir `ancientsinglegenome-hostassociated` and `ancientmetagenome-hostassociated` sections. As with the sample and library metadata tables, open this table and copy and paste the entire table into your preferred spreadsheet tool (as with the sample metadata instructions).

As some columns are shared between the sample and dates tables you should first copy and paste the row data from the following columns from the sample metadata table into the into the dates table: `project_name, publication_year, data_publication_doi, sample_name, singlegenome_species, archive_project, archive_sample_accession`

So it should like something like this:

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/assets/tutorials/step_by_step/32-dates_example_table.png" width=75%>
</p>

Now you’re ready to start entering the dating information 👌

### Collect date metadata

Go to the publication you’re working on and have another quick read through, scanning for mention of how the samples were dated; pull up the supplementary data etc.

For guidance on what information to add to each column see the [dates column specifications](docs/reference/dates-specifications.md) (each list, e.g. ancientmetagenome-hostassociated has its own specifications, so make sure you’re checking the right one)

### Helpful tips

Some samples are dated using exclusively historic or archaeological methods. These include samples dated by their archaeological context (e.g. associated ceramic typologies), stratigraphic dating, or historical methods much as museum samples and marked graves. These dates are sometimes given in addition to more precise radiocarbon dates. To allow these dates to be consistent across the table you must convert them to BP - note, for samples which are more recent than 1950 enter them as a negative (e.g 1970 would be -20). This [Date Conversion](https://nikhausmann.shinyapps.io/BP_to_BC_and_more/) tool is very useful for converting dates to BP!

Although it is perhaps the most important data to enter accurately in our table, sometimes finding the uncalibrated radiocarbon date can be difficult. Ideally this should be provided in the main text or a supplementary table, but sometimes we may need to interpret a radiocarbon calibration graph to extract this data (alongside other metadata we need!). We’ve provided an example plot below - more information about interpreting them can be found [here](https://c14.arch.ox.ac.uk/calibration.html) 📉🕰️

<p align=center>
<img src="https://raw.githubusercontent.com/SPAAM-community/AncientMetagenomeDir/master/assets/tutorials/step_by_step/33-dates_graph.png" width=75%>
</p>

Sometimes multiple radiocarbon dates are generated and reported for the same sample - if this is the case enter each date as a separate row.
The value you must enter to indicate ‘no value’ varies by column across this table (e.g. ‘DNE’ or ‘NA’), so double check the [dates column specifications](docs/reference/dates-specifications.md) for exactly what to enter, as this may cause it to fail the automated checks following your commit (next step).

## Submitting the dates table

Once your dating information metadata is ready, go to your PR, and open the corresponding file on your GitHub branch.
Append your new metadata to the end of the dates metadata by copying it over from your sheet, and make a commit (as with the sample and library metadata).

Once again your Pull Request will go through automated checks, and leave you a comment if there is something wrong.
Once you have all green ticks, it’s time for [human review](#request-reviewers)!
