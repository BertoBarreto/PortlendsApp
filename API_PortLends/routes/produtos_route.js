const express = require('express');
const router = express.Router();
const produtos_controller=require('../controllers/produtos_controller')


router.post('/',produtos_controller.get_produtos_categoria_subcategoria)
router.get('/:id',produtos_controller.get_produtos_categoria)

module.exports=router;
