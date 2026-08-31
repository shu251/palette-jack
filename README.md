# Palette Jack

[Visit site](https://shu251.github.io/palette-jack/)

🏋️ 🎨 🧑‍🎨 🏗️ 👷

Copy-able hex color palettes for R. Use *Palette Jack* to do all the heavy lifting for creating pretty data visualizations.

- **Werner**: randomizes sets of colors from [Werner's Nomenclature of Colours (1814/1821)](https://www.smithsonianbooks.com/store/science-nature/werners-nomenclature-of-colours-adapted-to-zoology-botany-chemistry-mineralogy-anatomy-and-the-arts/).
- **Woods Hole**: Curated set of 20 palettes from a previous release of the [PaletteWoodsHole](https://github.com/shu251/PaletteWoodsHole) R package.
- **Wada**: Select 2, 3, or 4-color combinations from Sanzo Wada's [*Dictionary of Color Combinations*](https://www.wada-sanzo-colors.com/)
- **Oceanography**: Inspiration from our time on research vessels and oceanographic surveys. Palettes include: ROV Jason, RV Atlantis, HOV Alvin, and nautical flags).

### Behind the scences

Static [Quarto](https://quarto.org) website (knitr/R engine). Each module page pairs a short R/tidyverse code chunk to show how the underlying data was shaped. Uses the with an Observable JS (ojs) block to run interactive component.

### Project layout

```         
_quarto.yml, _brand.yml, styles.scss   # site config
index.qmd                              # Home/landing page
werner/, wada/, pantone/, woods-hole/  # one folder per mode, each has an index.qmd
data/                                  # cleaned CSVs for hex codes and combintations
R/                                     # tidyverse scripts for how data/*.csv are parsed
docs/                                  # render output; github pages read this series of htmls
```

### Last updated

Aug 31, 2026
