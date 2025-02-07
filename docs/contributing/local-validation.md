# Local validation

!> _WARNING_ This documentation may be out-of-date. Please see the documentation for [AMDirT](https://amdirt.readthedocs.io/en/master/).

## Preparation

1. Install ancientMetagenomeDirCheck / AMDirT
2. Change to root directory of cloned AncientMetagenomeDir repository

## Quick Checks

To quickly check across multiple tables, can use this bash command + variable combination:

```
$ TABLE=<of choice, e.g. ancientsinglegenome-hostassciated>
$ LEVEL=<of choice, i.e. samples or libraries>
$ ancientMetagenomeDirCheck -v -d -m "$TABLE"/"$LEVEL"/"$TABLE"_"$LEVEL".tsv "$TABLE"/"$LEVEL"/"$TABLE"_"$LEVEL"_schema.json
```