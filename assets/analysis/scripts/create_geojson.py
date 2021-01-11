import geopandas
import pandas as pd
import click

@click.command()
@click.option("--anthropogenic",
              type=click.Path(exists=True),
              default='ancientmetagenome-anthropogenic.tsv',
              show_default=True,
              help='ancientmetagenome-anthropogenic TSV file')
@click.option("--environmental",
              type=click.Path(exists=True),
              default='ancientmetagenome-environmental.tsv',
              show_default=True,
              help='ancientmetagenome-environmental TSV file')
@click.option("--meta_host",
              type=click.Path(exists=True),
              default='ancientmetagenome-hostassociated.tsv',
              show_default=True,
              help='ancientmetagenome-hostassociated TSV file')
@click.option("--single_host",
              type=click.Path(exists=True),
              default='ancientsinglegenome-hostassociated.tsv',
              show_default=True,
              help='ancientsinglegenome-hostassociated TSV file')
@click.option(
    "--geojson",
    type=click.Path(writable=True, dir_okay=False),
    default="map.geo.json",
    show_default=True,
    help="Output geo.json file",
)
def convert(anthropogenic, environmental, meta_host, single_host, geojson):
    """\b
    Converts csv file to geojson file
    Author: Maxime Borry
    Contact: <borry[at]shh.mpg.de>

    CSV: path to CSV containing Latitude/Longitude columns
    """
    # try:
    anthro = pd.read_csv(anthropogenic, sep='\t', decimal=".")
    anthro['dir_type'] = ['Ancient Metagenome - Anthropogenic']*anthro.shape[0]
    envi = pd.read_csv(environmental, sep='\t', decimal=".")
    envi['dir_type'] = ['Ancient Metagenome - Environmental']*envi.shape[0]
    meta_h = pd.read_csv(meta_host, sep='\t', decimal=".")
    meta_h['dir_type'] = ['Ancient Metagenome - Host-associated']*meta_h.shape[0]
    single_h = pd.read_csv(single_host, sep='\t', decimal=".")
    single_h['dir_type'] = ['Ancient Single-genome - Host-associated']*single_h.shape[0]

    df = pd.concat([anthro, envi, meta_h, single_h])
    print(df)
    colors = pd.DataFrame(['Ancient Metagenome - Anthropogenic',
                            'Ancient Metagenome - Environmental',
                            'Ancient Metagenome - Host-associated',
                            'Ancient Single-genome - Host-associated'],
                            ['#E7D400',
                            '#C22026',
                            '#009C54',
                            '#25BCF6'],
                            columns = ['dir_type']).reset_index().rename(columns={'index':'marker-color'})
    print(colors)
    df = df.merge(colors, left_on='dir_type', right_on='dir_type')
    print(df)
    gdf = geopandas.GeoDataFrame(df, geometry=geopandas.points_from_xy(df.longitude, df.latitude))
    gdf.to_file(geojson, driver='GeoJSON')
    # except ValueError as e:
    #     print(e)
    #     pass

if __name__ == '__main__':
    convert()