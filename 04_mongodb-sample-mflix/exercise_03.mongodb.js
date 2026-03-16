// 3.1 How many theaters does AL state has? ANS = 19
db.theaters.find({ "location.address.state": "AL"}).count()
//or
db.theaters.countDocuments({ "location.address.state": "AL"})


// 3.2 How many theaters does La Quinta city has? ANS = 1 
db.theaters.find({ "location.address.city": "La Quinta"}).count()
//or
db.theaters.countDocuments({ "location.address.city": "La Quinta"})

// 3.3 What is an example of each documents of above like?
db.theaters.findOne({ "location.address.city": "La Quinta"})
//or
db.theaters.findOne({ "location.address.state": "AL"})
