#!/usr/bin/env bash

##
## AMDirT autofill wrapper for github actions
##
## Given a specified table and a project name, this script will
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
    echo "Usage: $0 [-t <ancientmetagenome-hostassociated|ancientmetagenome-environmental|ancientsinglegenome-hostassociated>] [-p <project_name>]" 1>&2
    exit 1
}

/workspace/AncientMetagenomeDir//samples/ancientmetagenome-hostassociated_samples.tsv

valid_tables=("ancientmetagenome-hostassociated" "ancientmetagenome-environmental" "ancientsinglegenome-hostassociated")
verbose=false

while getopts t:p:v flag; do
    case "${flag}" in
    v) verbose='true' ;;
    t) table_name=${OPTARG} ;;
    p) project_name=${OPTARG} ;;
    h | *)
        usage
        exit 0
        ;;
    esac
done

echo $verbose


if ! [[ "${valid_tables[*]}" =~ $table_name ]]; then
    echo "ERROR: $table_name not valid! Please check input to -t"
    exit 1
fi

if ${verbose}; then
    echo [LOG] RUNNING: grep "$project_name" "$table_name"/samples/"$table_name"_samples.tsv "| rev | cut -f 1 | rev | tr '\n' ' '"
    echo ""
fi

hits=$(grep "$project_name" "$table_name"/samples/"$table_name"_samples.tsv | rev | cut -f 1 | rev | tr '\n' ' ')

if ${verbose}; then
    echo "[LOG]" RUNNING: ${#hits} -eq 0
    echo ""
fi

if [ ${#hits} -eq 0 ]; then
    echo "ERROR: Project name or sample accessions were not found in table. Please check project name input (-p)."
    exit 1
fi

if ${verbose}; then
    echo "[LOG]" RUNNING: AMDirT autofill -n "$table_name" "$hits" -l TEMPLATE_"$project_name"_"$table_name"_libraries.tsv
    echo ""
fi

AMDirT autofill -n "$table_name" "$hits" -l TEMPLATE_"$project_name"_"$table_name"_libraries.tsv
