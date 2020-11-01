# -----------------------------------------------------------------------------#
# Environment
# -----------------------------------------------------------------------------#
# conda:
#   conda create -n ena-metadata python=3.7 requests=2.24.0
#   conda activate ena-metadata
# pip:
#   pip install requests==2.24.0

# -----------------------------------------------------------------------------#
# Packages
# -----------------------------------------------------------------------------#
import argparse  # Command-line argument parsing
import os  # file path searching and creation
import urllib # Catch HTTP Errors
import requests # ENA API

# ------------------------------------------------------------------------------#
# Argument Parsing                                                             #
# ------------------------------------------------------------------------------#

parser = argparse.ArgumentParser(
    description=("Add SRA metadata to AncientMetagenomeDir databases."),
    add_help=True,
)

parser.add_argument(
    "--tsv",
    help="TSV file of AncientMetagenomeDir metadata.",
    action="store",
    dest="tsvPath",
    required=True,
)

parser.add_argument(
    "--output",
    help="Output TSV file of metadata.",
    action="store",
    dest="outPath",
    required=True,
)

parser.add_argument(
    "--fields",
    help="ENA fields to retrieve (csv).",
    action="store",
    dest="fields_list",
    default="run_accession,library_layout,fastq_ftp",
    required=False,
)

args = vars(parser.parse_args())
tsv_path = args["tsvPath"]
fields_csv = args["fields_list"]
fields_list = fields_csv.split(",")
output_path = args["outPath"]

# -----------------------------------------------------------------------------#
# Setup
# -----------------------------------------------------------------------------#

# ENA file will be retrieve with the ENA api
ENA_SAMPLE_URL = "https://www.ebi.ac.uk/ena/portal/api/filereport?accession={}&result=read_run&fields={}"

# -----------------------------------------------------------------------------#
# Processing
# -----------------------------------------------------------------------------#

with open(tsv_path) as file:
    # File is tsv 
    file_data = [line.strip().split("\t") for line in file]
    # Header is the first line
    file_header = file_data[0]
    # figure out which column is the accesion
    accession_index = file_header.index("archive_accession")
    # Exclude header from data
    file_data = file_data[1:]

    # Create the new header
    final_header = file_header
    for col in fields_list:
        final_header += [col]

    # Write the new header to the output
    with open(output_path, "w") as file:
        file.write("\t".join(final_header) + "\n")

    # Iterate through the rows/samples in the tsv file
    for sample_metadata in file_data:
        # Initialize empty values for new metadata
        metadata_dict = {}
        for col in fields_list:
            metadata_dict[col] = []

        # The sample accessions can optionally be a csv list
        sra_acc_list = sample_metadata[accession_index].split(",")

        # Iterate through the sample accessions
        for acc in sra_acc_list:
            # Get the ENA metadata
            result = requests.get(url = ENA_SAMPLE_URL.format(acc, fields_csv))
            # Status code 200 is success
            if result.status_code == 200:
                # The result is multiple lines, exclude header line
                data = result.text.strip().split("\n")[1:]
                split_data = [col.split("\t") for col in data]
                for i in range(0,len(fields_list)):
                    col = fields_list[i]
                    col_csv = ",".join([row[i] for row in split_data])
                    metadata_dict[col] = [col_csv]
                    
        # Combine new metadata with old sample metadata
        final_metadata = sample_metadata
        for col in fields_list:
            final_metadata += metadata_dict[col]

        # Write the new metadata to the output
        with open(output_path, "a") as file:
            file.write("\t".join(final_metadata) + "\n")
