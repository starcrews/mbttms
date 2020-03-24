const { app } = require( './app' );
    //http = require('http').Server(app);

app.set( 'port', 3000 ),
app.set( 'hostname', '192.168.80.1');

var server = require('http').createServer(app);

server.listen( app.get('port'), app.get('hostname'), () => {
    console.log( `Server running at http://${app.get('hostname')}:${app.get('port')}/` );
});

module.exports = {server};
