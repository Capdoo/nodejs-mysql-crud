const express = require('express');
const router = express.Router();


router.get('/',(req,res)=>{
    res.render('main/index');
    //res.send('Hello World');
});


module.exports = router;