import geopandas
import pandas as pd
import click
import numpy as np


@click.command()
@click.option(
    "--environmental",
    type=click.Path(exists=True),
    default="ancientmetagenome-environmental_samples.tsv",
    show_default=True,
    help="ancientmetagenome-environmental TSV file",
)
@click.option(
    "--meta_host",
    type=click.Path(exists=True),
    default="ancientmetagenome-hostassociated_samples.tsv",
    show_default=True,
    help="ancientmetagenome-hostassociated TSV file",
)
@click.option(
    "--single_host",
    type=click.Path(exists=True),
    default="ancientsinglegenome-hostassociated_samples.tsv",
    show_default=True,
    help="ancientsinglegenome-hostassociated TSV file",
)
@click.option(
    "--geojson",
    type=click.Path(writable=True, dir_okay=False),
    default="map.geojson",
    show_default=True,
    help="Output geojson file",
)
def convert(environmental, meta_host, single_host, geojson):
    """\b
    Converts csv file to geojson file
    Author: Maxime Borry
    Contact: <borry[at]shh.mpg.de>

    CSV: path to CSV containing Latitude/Longitude columns
    """
    sigma = 0.0001
    envi = pd.read_csv(environmental, sep="\t", decimal=".")
    envi["dir_type"] = ["Ancient Metagenome - Environmental"] * envi.shape[0]
    meta_h = pd.read_csv(meta_host, sep="\t", decimal=".")
    meta_h["dir_type"] = ["Ancient Metagenome - Host-associated"] * meta_h.shape[0]
    single_h = pd.read_csv(single_host, sep="\t", decimal=".")
    single_h["dir_type"] = ["Ancient Single-genome - Host-associated"] * single_h.shape[
        0
    ]

    df = pd.concat([envi, meta_h, single_h])
    df = df.drop_duplicates(df.columns.difference(["dir_type"]))
    df["plot_latitude"] = df["latitude"].apply(lambda x: np.random.normal(x, sigma))
    df["plot_longitude"] = df["longitude"].apply(lambda x: np.random.normal(x, sigma))
    colors = (
        pd.DataFrame(
            [
                "Ancient Metagenome - Environmental",
                "Ancient Metagenome - Host-associated",
                "Ancient Single-genome - Host-associated",
            ],
            ["#4AAE72", "#8AD5F7", "#D3498E"],
            columns=["dir_type"],
        )
        .reset_index()
        .rename(columns={"index": "marker-color"})
    )
    df = df.merge(colors, left_on="dir_type", right_on="dir_type")
    gdf = geopandas.GeoDataFrame(
        df, geometry=geopandas.points_from_xy(df.plot_longitude, df.plot_latitude)
    )
    gdf.to_file(geojson, driver="GeoJSON")


if __name__ == "__main__":
    convert()
