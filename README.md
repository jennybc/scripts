# scripts

Note: I am correcting the csv data as people find errors in our character mapping or omitted characters. Sorry if you end up forking an old data set.

A previous version presented the data as "lines." This turned out to be a very ambiguous word. In reality, we had compiled total number of words, by character, and then converted them to lines using an average of 10 words per line. This is creating more confusion than needed, so we're moving back to just words, which is what is currently in the CSV data to begin with. The minute-by-minute data, however, is still based on lines (i.e., a row of dialogue text).

In the data folder, there's quite a few files...

character_list5.csv - this is the data that powers all of the calculations on polygraph.cool/films. It uses the most accurate script that we can find for a given film. People are understandably finding errors, so we will be updating this file as much as possible.

disney_films2.csv - this powers the films selected for the first chart.

meta_data7.csv - this is unique list of IMDB_IDs from the character_list file, with additional meta data, such as release year and domestic, inflation-adjusted gross.

genre_mapping.csv - this is a mapping of IMDB_IDs to genres.

actor_list.csv - this is a list of every actor's imdb page for which we match to a character. The race data is pulled from nndb.

inflation_adjustment.csv - price column has average movie ticket. adjust column is how we scaled domestic box office

box_office.csv - this is a scrape of IMDB's ranking of films by domestic box office. the domestic gross is then scaled by the inflation adjustment amount. Note this produces wildly inaccurate results for older films since IMDB's data includes revenue from later dates.

The selected scripts and their sources are also publicly maintained here:
https://docs.google.com/spreadsheets/d/1fbcldxxyRvHjDaaY0EeQnQzvSP7Ub8QYVM2bIs-tKH8/edit#gid=1668340193


