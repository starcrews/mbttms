const {User} = require('../models/userModel'),
    mongoose = require('mongoose');

exports.registerUser = function( req, res ) {
    var user = new User();

    user.username = JSON.parse( JSON.stringify( req.body.username ) );
    user.password = JSON.parse( JSON.stringify( req.body.password ) );

    user.save( function( err, savedObject) {
        if( err ) {
            res.json({ response : "Fail" });
        } else {
            res.json({ response : "Success" });
        }
    } );  
}