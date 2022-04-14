for(i=0;i<500000;i++){
db.user.insertOne(
{"userid":i,
"username":"user"+i,
"age":Math.floor(Math.random()*100),
"score":Math.floor(Math.random()*100),
"time":new Date()
});
}

db.user.find({score:"23"}).explain("executionStats").executionStats.executionTimeMillis
