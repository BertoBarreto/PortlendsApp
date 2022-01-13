const express = require('express');
const router = express.Router();
const users_controller=require('../controllers/users_controller')

router.get('/',users_controller.get_all_users)
router.get('/:id',users_controller.get_user_by_id)
router.put('/:id',users_controller.update_user)
router.delete('/:id', users_controller.delete_user)
module.exports=router;
