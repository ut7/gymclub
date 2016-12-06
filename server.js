let http = require('http')
let index = require('./index');
http.createServer(function(req,res) {
	res.end(index());
}).listen(8080, function() {
	console.log("server started");
});
