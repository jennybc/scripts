## http://polygraph.cool/films/
## https://github.com/matthewfdaniels/scripts

x <- "https://raw.githubusercontent.com/matthewfdaniels/scripts/master/data/character_list5.csv"
characters <- read.csv(x, na.strings = c("NULL", "?"),
                       fileEncoding = "ISO-8859-1", stringsAsFactors = FALSE)
## some ages are clearly (negative) birth years ... oops
characters$age[!is.na(characters$age) & characters$age < 0] <- NA
characters$age[!is.na(characters$age) & characters$age > 105] <- NA

y <- "https://raw.githubusercontent.com/matthewfdaniels/scripts/master/data/meta_data7.csv"
films <- read.csv(y, fileEncoding = "ISO-8859-1", stringsAsFactors = FALSE,
                  colClasses = list(lines_data = NULL))

## setequal(characters$script_id, films$script_id)
## wow, a pleasant surprise

df <- merge(characters, films)
write.table(df, "characters_with_film.csv", sep = ",", row.names = FALSE)

library(ggplot2)
ggplot(subset(df, !is.na(gender)), aes(x = age, colour = gender)) +
  geom_density()
ggsave("densityplot-male-female.png", width = 4, height = 3)
