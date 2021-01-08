import geopandas
import pandas as pd
import click

@click.command()
@click.argument("csv", type=click.Path(exists=True))
@click.option(
    "--geojson",
    type=click.Path(writable=True, dir_okay=False),
    default="map.geo.json",
    show_default=True,
    help="Output geo.json file",
)
def convert(csv, geojson):
    """\b
    Converts csv file to geojson file
    Author: Maxime Borry
    Contact: <borry[at]shh.mpg.de>

    CSV: path to CSV containing Latitude/Longitude columns
    """
    try:
        df = pd.read_csv(csv, sep='\t', decimal=".")

        gdf = geopandas.GeoDataFrame(df, geometry=geopandas.points_from_xy(df.longitude, df.latitude))
        gdf.to_file(geojson, driver='GeoJSON')
    except ValueError as e:
        print(e)
        pass

if __name__ == '__main__':
    convert()