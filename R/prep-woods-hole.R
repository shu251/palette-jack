
# prep-woods-hole.R

# Flattens every named palette in the PaletteWoodsHole R package into the long-format data/woods-hole-palettes.csv consumed by the Palette Woods Hole mode page.


###
library(tidyverse)
library(PaletteWoodsHole)

descriptions <- tribble(
  ~palette,          ~display_name,             ~description,
  "whoi",            "WHOI",                    "Colors derived from the WHOI graphics identity and primary color palette.",
  "whoisec",         "WHOI Secondary",          "WHOI's secondary color palette.",
  "jason",           "ROV Jason",               "Colors that represent ROV Jason.",
  "atlantis",        "Atlantis",                "Colors that match the R/V Atlantis.",
  "wefa_sun",        "West Falmouth Sunset",    "The West Falmouth sunset over Chappaquoit.",
  "bikepath",        "Shining Sea Bikeway",     "The essence of the Shining Sea Bikeway.",
  "bog",             "Cranberry Bog",           "The cranberry bogs of Massachusetts.",
  "rocky_beach",     "Rocky Beach",             "A summertime visit to a rocky beach in Woods Hole.",
  "eelpond_winter",  "Eel Pond, Winter",        "Fresh snowfall on Eel Pond in Woods Hole.",
  "tulips",          "Tulips",                  "Tulips that pop up in late spring.",
  "sunset_winter",   "Winter Sunset",           "A wintertime sunset on the Cape.",
  "dock",            "Dock at Eel Pond",        "A dock at Eel Pond in Woods Hole.",
  "marsh",           "Sippewissett Marsh",      "Sippewissett Marsh.",
  "alvin",           "HOV Alvin",               "Colors from HOV Alvin.",
  "siders",          "Siders Pond",             "Siders Pond at sunset.",
  "siders_filters",  "Siders Pond Filters",     "Filters collected from a depth profile at Siders Pond.",
  "siders_summer",   "Siders Pond, Summer",     "Siders Pond in the summer, doing fieldwork.",
  "long_pond",       "Long Pond",               "Long Pond in the fall.",
  "knob",            "The Knob",                "The Knob beach at sunset.",
  "naushon",         "Naushon Island",          "Naushon Island, Hadley Harbor.",
)


pkg_objects <- data(package = "PaletteWoodsHole")$results[, "Item"]
palette_names <- descriptions$palette
stopifnot(all(palette_names %in% pkg_objects))

woods_hole_long <- palette_names |>
  set_names() |>
  map(get) |>
  imap_dfr(\(hexes, nm) tibble(palette = nm, position = seq_along(hexes), hex = str_to_lower(hexes))) |>
  left_join(descriptions, by = "palette") |>
  select(palette, display_name, description, position, hex)

write_csv(woods_hole_long, "data/woods-hole-palettes.csv")
