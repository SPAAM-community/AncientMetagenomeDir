# Local validation


## Preparation

1. Install AMDirT (see [installation instructions here](https://amdirt.readthedocs.io/en/master/README.html#install))
2. Change to root directory of cloned AncientMetagenomeDir repository

<p class="note">
<em>NOTE</em>&nbsp; You can find the <a href='https://amdirt.readthedocs.io/en/master/'>full documentation for AMDirT here
</a></p>

## Quick Checks

To quickly check across multiple tables, you can use a bash command + variable combination. For example:

```sh
TABLE=ancientsinglegenome-hostassociated
LEVEL=samples
amdirt validate -d -s -c "$TABLE"/"$LEVEL"/"$TABLE"_"$LEVEL".tsv "$TABLE"/"$LEVEL"/"$TABLE"_"$LEVEL"_schema.json
```