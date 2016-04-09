library(rprojroot)
library(readr)
library(dplyr)
root <- find_root("README.md")
P <- function(...) file.path(root, ...)

characters <- read_csv(P("data", "character_list5.csv"),
                      na = c("", "NA", "NULL")) # unknown ages
characters <- characters %>%
  mutate(gender = recode(gender, m = "male", f = "female",
                         .default = NA_character_)) # deal w/ "?"s
## table(characters$gender)

films <- read_csv(P("data", "meta_data7.csv"))
films

setequal(characters$script_id, films$script_id)
## WOW
