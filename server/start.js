var restify = require('restify');
var serveStaticWith304 = require('./static');

var config = require('./config.js');
var os = require('os');
var assert = require('assert');


function setupStaticRoutes() {
    server.get(/\/app\/.*/, serveStaticWith304({
        directory: 'site',
        maxAge: 60 * 60 * 24
    }));
    server.get('/.*/ ', serveStaticWith304({
        'directory': 'site',
        'default': 'index.html',
        maxAge: 60 * 60 * 24
    }));
}

function startServer() {
    server.listen(config.port, function () {
        console.log('%s listening at %s', server.name, server.url);
    });
}

// Restify server
var server = restify.createServer();
setupStaticRoutes();
startServer();