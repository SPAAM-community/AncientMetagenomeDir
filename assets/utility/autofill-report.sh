#!/usr/bin/env bash

## Copyright 2024 James A. Fellows Yates on behalf of SPAAM-Community
## Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
## The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
## THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

##
## AMDirT autofill report script for github actions comment
##
## A log file and a run ID,
##
## 0. Check the specified table is valid name
## 1. filter the specified sample table for the given project name.
## 2. collect collect the sample accession IDs of that project
## 3. give error if there is no output (i.e., 0 accessions)
## 4. run AMDirT autofill with the collected accessions and the specified table name
##
##
## Copyright 2024 James Fellows Yates on behalf of the SPAAM community under MIT license
usage() {
    echo "Usage: $0 [-l <autofill log file> -u <github actions run ID>" 1>&2
    exit 1
}

while getopts l:u:i:v flag; do
    case "${flag}" in
    l) log=${OPTARG} ;;
    i) run_id=${OPTARG} ;;
    u) artefact_url=${OPTARG} ;;
    h | *)
        usage
        exit 0
        ;;
    esac
done

if grep -q 'Writing libraries metadata' $log; then
    echo "Autofill writing string present, writing sucessful log: autofill-report.md"
    cat <<-ENDMESSAGE >autofill-report.md
<h1>
    <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/SPAAM-community/AMDirT/blob/master/assets/logo_rectangular_dark.png?raw=true">
    <img width=30% alt="nf-core/taxprofiler" src="https://github.com/SPAAM-community/AMDirT/blob/master/assets/logo_rectangular.png?raw=true">
    </picture>
</h1>

### Autofill success! 🎉

Autofill log:


$(cat $log | sed 's/^/>/g;s/�\[32m//g;s/�\[0m//g')


Download the attempted autofilled library file by pressing [this link]($(echo $artefact_url)).

You can now fill in the remainder of the columns, and append to the end of the corresponding library file.
Please remember this service attempts to pull relevant metadata from the ENA, but metadata is not always correct!

> [!WARNING]
> Always check accuracy of pre-filled columns before adding to the library table!
ENDMESSAGE
else
    echo "Autofill no writing string present, writing error log: autofill-report.md"
    cat <<-ENDERRORMESSAGE >autofill-report.md
### Something went wrong 😢

Please check your previous request (correct table, project ID etc.).

Autofill log:

$(cat $log | sed 's/^/>/g;s/�\[32m//g;s/�\[0m//g')

Note request should be in format:
\`@spaam-bot please autofill <table> <project_id>\`

Where table corresponds to an AncientMetagenomeDir, and project_id corresponds to the project_id you have added in your samples table (requires exact match!)

If error isn't self explandatory please report on the #ancientmetagenomedir channel on the SPAAM slack.
Include the following URL: https://github.com/SPAAM-community/AncientMetagenomeDir/actions/runs/$(echo $run_id)
ENDERRORMESSAGE
fi
