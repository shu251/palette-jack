# prep-werner.R
#
# Takes downloaded "Werner's Nomenclature of Colours" reference table (Werner 1814 / Syme 1821; see werner/index.qmd for the full citation) cleans for downstream  data/werner-colors.csv .

## Run this from the project root:
##   Rscript R/prep-werner.R

###

library(tidyverse)

# Grab werner color csv from prior driectory
raw_path <- "../PaletteWoodsHole/werner-colors.csv"

werner_raw <- read_csv(raw_path, locale = locale(encoding = "latin1"))

werner_clean <- werner_raw |>
  rename(id = 1) |>
  mutate(
    id = row_number(),
    across(
      c(group, name, hex, Animal, Vegetable, Mineral, Description),
      \(x) x |> str_replace_all(" ", " ") |> str_squish()
    ),
    hex = str_to_lower(hex)
  ) |>
  rename_with(str_to_lower, c(Animal, Vegetable, Mineral, Description)) |>
  select(id, group, name, hex, animal, vegetable, mineral, description)

# Quick sanity check students can reuse: count colors per Werner classification
werner_clean |>
  count(group, sort = TRUE) |>
  print(n = Inf)

write_csv(werner_clean, "data/werner-colors.csv")
