const express = require('express'),
    app = express(),
    bodyParser = require('body-parser'),
    mongoose = require('mongoose'),
    carsRouter = require( './routers/carsRouter' ),
    flightsRouter = require( './routers/flightsRouter' ),
    hotelsRouter = require( './routers/hotelsRouter' ),
    loginRouter = require( './routers/loginRouter' ),
    profileRouter = require( './routers/profileRouter' ),
    registerRouter = require( './routers/registerRouter' ),
    tripsRouter = require( './routers/tripsRouter' );

app.use(bodyParser.urlencoded( {extended: true} ) );
app.use(bodyParser.json());
app.use(bodyParser.raw());

mongoose.connect( "mongodb://localhost:27017/mbttms", { useUnifiedTopology: true, useNewUrlParser:true, useCreateIndex: true } );

app.use( "/login", loginRouter );
app.use( "/register", registerRouter );

app.get( "/", (req, res) => {
    res.sendStatus(200);
});

module.exports = { app };
 
