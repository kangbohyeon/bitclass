for(i=0;i<100000;i++){
db.user.insertOne(
{"i":i,
"username":"user"+i,
"age":Math.floor(Math.random()*120),
"created":new Date()
}
);
}



db.user.find({score:"23"}).explain("executionStats").executionStats.executionTimeMillis
