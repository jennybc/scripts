library(rprojroot)
library(readr)
library(dplyr)
root <- find_root("README.md")
P <- function(...) file.path(root, ...)

characters <- read_csv(P("data", "character_list5.csv"),
                      na = c("", "NA", "NULL"), # unknown ages
                      locale = locale(encoding = 'ISO-8859-1'))
characters <- characters %>%
  mutate(gender = recode(gender, m = "male", f = "female",
                         .default = NA_character_)) # deal w/ "?"s
## table(characters$gender)

films <- read_csv(P("data", "meta_data7.csv"),
                  locale = locale(encoding = 'ISO-8859-1'))

setequal(characters$script_id, films$script_id)
## WOW

d <- P("data_joined")
if (!dir.exists(d)) dir.create(d, recursive = TRUE)
write_csv(characters %>%
            left_join(films %>% select(-lines_data)),
          file.path(d, "characters_with_film.csv"))
