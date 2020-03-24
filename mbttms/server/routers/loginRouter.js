const express = require('express'),
    router = express.Router(),
    loginController = require('../controllers/loginController');

router.post( '/', loginController.confirmUser );

module.exports = router;