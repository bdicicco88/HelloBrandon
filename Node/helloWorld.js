// Testing out First Node app
/* 
1. cd to directory with this file and run "node <filename>.js in command prompt"
2. Visit http://localhost:8080/ in browser and text should display "Hello World!"
*/ 

var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.end('Hello World!');
}).listen(8080);