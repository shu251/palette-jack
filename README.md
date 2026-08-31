# Palette Jack

Copy-able hex color palettes for R. A Quarto website with four modes:

- **Werner** -- randomize a capped, classification-filtered set of colors from Werner's Nomenclature of Colours (1814/1821). *Live.*
- **Woods Hole** -- browse all 20 palettes from the [PaletteWoodsHole](https://github.com/shu251/PaletteWoodsHole) R package. *Live.*
- **Wada** -- 2/3/4-color combinations from Sanzo Wada's *Dictionary of Color Combinations*. *Live.*
- **Oceanography** -- research vessel and oceanographic survey palettes (Jason, Atlantis, Alvin, Nautical Flags). *Live.*

## Stack

Static [Quarto](https://quarto.org) website (knitr/R engine). Each mode page pairs a short R/tidyverse teaching chunk (how the underlying data was shaped) with an Observable JS block that runs the actual interactive picker/randomizer/copy-to-clipboard client-side -- no server, deploys as plain static HTML.

## Project layout

```
_quarto.yml, _brand.yml, styles.scss   site config + San Diego brand theme
index.qmd                              landing page
werner/, wada/, pantone/, woods-hole/  one folder per mode, each an index.qmd
data/                                  cleaned CSVs consumed by each mode's ojs block
R/                                     tidyverse scripts documenting how data/*.csv were derived
docs/                                  render output -- GitHub Pages serves from here on main
```

## Rendering

```r
# one-time, if you don't already have these
install.packages(c("tidyverse", "knitr"))
```

```bash
quarto preview   # local dev server with live reload
quarto render    # writes the site into docs/
```

## Deploying

Push `docs/` on `main` and point GitHub Pages at `main` / `/docs` in the repo settings.
