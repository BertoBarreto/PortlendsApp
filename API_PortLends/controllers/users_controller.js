const db_config = require('../DB_config');
const sql = require('mssql')
const queries = require('../events/queries')

let get_user_by_id = async (req,res)=>{
    let idParam = req.params.id
    try {
        console.log(idParam)
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('idParam', sql.Int, idParam)
            .query('select * from Users where uid = @idParam')
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected user",
            "result": result.recordsets[0]
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

let update_user = async(req,res)=>{
    let uid = req.params.id

    let {rua,pwd} = req.body

    try {
        let pool = await sql.connect(db_config)
        await pool
          .request()
          .input("ruaParam", sql.VarChar, rua)
          .input("idParam", sql.Int, uid)
          .query(queries.updateUserByID);
        pool.close()
        res.json({ rua, uid });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

let get_all_users = async(req,res)=>{

    try {
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .query(queries.getAllUsers)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected user",
            "result": result.recordsets
        })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

let delete_user = async(req,res)=>{
    
    try {
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
        .input('idParam', sql.Int, req.params.id)
        .query(queries.deleteUser)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected user",
            "result":  result.rowsAffected > 0 ? "utilizador eliminado":"nenhum user eliminado"
        })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

module.exports={
    get_user_by_id,
    update_user,
    get_all_users,
    delete_user
}