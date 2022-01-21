const express = require('express');
const router = express.Router();
const users_controller=require('../controllers/users_controller')

router.get('/',users_controller.get_all_users)
router.get('/:id',users_controller.get_user_by_id)
router.get('/produtos/:id',users_controller.get_user_products)
router.post('/',users_controller.register_user)
router.post('/favoritos',users_controller.add_favorite)
router.delete('/favoritos',users_controller.remove_favorite)
router.put('/:id',users_controller.update_user)
module.exports=router;
