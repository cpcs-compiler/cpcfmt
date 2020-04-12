# Cpcfmt

Cpcfmt formats CC+ programs.

Cpcfmt is heavily inspired by [gofmt](https://blog.golang.org/gofmt).

### Usage

```
cpcfmt [flags] <path...>
```

The flags are:

```
    -w
        Do not print reformatted sources to standard output.
        If a file's formatting is different from cpcfmt's, overwrite it
        with cpcfmt's version. If an error occured during overwriting, 
        the original file is restored from an automatic backup.

    -r rule
        Apply the rewrite rule to the source before reformatting
```
