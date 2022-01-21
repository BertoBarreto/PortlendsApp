const express = require('express');
const router = express.Router();
const produtos_controller=require('../controllers/produtos_controller')


router.get('/:id',produtos_controller.get_produto)
router.delete('/:id',produtos_controller.delete_produto)


module.exports=router;
