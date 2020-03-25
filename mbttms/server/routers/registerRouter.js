const express = require('express'),
    router = express.Router(),
    registerController = require('../controllers/registerController');

router.post( '/', registerController.registerUser );

module.exports = router;