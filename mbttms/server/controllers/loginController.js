const {User} = require('../models/userModel'),
    mongoose = require('mongoose');

exports.confirmUser = function( req, res ) {
    var username = req.body.username;
    var password = req.body.password;

    User.findOne({ "username" : username }, function(err, user) {
        if(err) {
            res.json({ response : "Non" });
            throw err;
        }

        if(user) {
            if(password == user["password"]) {
                res.json({ response : "Yes" });
            } else {
                res.json({ response : "WP" });
            }
        } else {
            res.json({ response : "WU/P" });
        }
    })   
}