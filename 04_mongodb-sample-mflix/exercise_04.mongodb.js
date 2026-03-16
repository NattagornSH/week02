use("sample_mflix");

// 4.1 How many movies does mentioned American in its plot? ANS =557
db.movies.countDocuments({ 
  plot: { $regex: "american", $options: "i" } 
});

// 4.2 How many movies does end plot (sentence) with the word street.
db.movies.countDocuments({ 
  plot: { $regex: "street.$", $options: "i" } 
});

// 4.3 What does the data of above examples look like?
db.movies.find({ 
  plot: { $regex: "street.$", $options: "i" } 
});

