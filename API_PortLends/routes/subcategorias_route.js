const express = require('express');
const router = express.Router();
const subcategorias_controller=require('../controllers/subcategorias_controller')

router.get('/:id',subcategorias_controller.get_all_subcategories_from_category)
module.exports=router;
