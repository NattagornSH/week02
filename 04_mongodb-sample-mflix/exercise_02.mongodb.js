//What is an example of  type “movie” and rated “TV-G” look like?
db.movies.findOne({ type: "movie", rated: "TV-G"})

//How many movies are there in “movie” type and “TV-G” rated? ANS = 58
db.movies.countDocuments({ type: "movie", rated: "TV-G"})

