// 6.1 Find all movies in the "movies" collection released between 1950 and 1970 (inclusive) that are documented as being shown in countries located in the USA.
db.movies.find({
  countries: {$in: ["USA"]},
  year: {$gte: 1950, $lte: 1970}
});

// 6.2 What is the number of movies in the "movies" collection with genres "Drama" and "History" released after the year 1970?
db.movies.find({ 
  genres: { $all: ["Drama", "History"] },
  released: { $gt: ISODate("1970-01-01T00:00:00Z") }
}).count();


// 6.3 In how many films is Roy L. McCardell credited as an actor?
db.movies.find({ cast: "Roy L. McCardell" }).count();


// 6.4 How many movies did Hal Roach directed?
db.movies.find({ directors: "Hal Roach" }).count();


// 6.5 What is the movie with the earliest release year directed by Hal Roach?
db.movies.find({ directors: { $in: ["Hal Roach"] } });


// 6.6 How many awards did Hal Roach’s movies win?
db.movies.find(
{ 
directors: { $in: ["Hal Roach"] } 
}, 
{
title: 1, 
"awards.wins": 1, 
_id: 0 
}
);

