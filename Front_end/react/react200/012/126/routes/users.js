var express = require('express');
var router = express.Router();

/* Post users listing. */
router.post('/', function(req, res, next) {
  res.send({'message':'node post success'});
});

module.exports = router;
