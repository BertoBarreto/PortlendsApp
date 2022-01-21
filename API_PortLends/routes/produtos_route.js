const express = require('express');
const router = express.Router();
const produtos_controller=require('../controllers/produtos_controller')


router.post('/',produtos_controller.get_produtos_categoria_subcategoria)
router.get('/:id',produtos_controller.get_produtos_categoria)
router.post('/search/:id',produtos_controller.get_search_produtos_categoria)
router.post('/searchSubcategoria',produtos_controller.get_search_produtos_categoria_subcategoria)


module.exports=router;
