const express = require('express');
const router = express.Router();
const categorias_controller=require('../controllers/categorias_controller')

router.get('/',categorias_controller.get_all_categories)
router.post('/search',categorias_controller.get_search_categories)

module.exports=router;
