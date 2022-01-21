const db_config = require('../DB_config');
const sql = require('mssql')
const queries = require('../events/queries')
const bcrypt = require('bcrypt');
const saltRounds = 10;

let get_user_by_id = async (req,res)=>{
    let idParam = req.params.id
    try {
        
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('idParam', sql.Int, idParam)
            .query(queries.getUserById)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected user",
            "result": result.recordset[0]
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

let get_user_products = async (req,res)=>{
    let idParam = req.params.id
    try {
        
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('idParam', idParam)
            .query(queries.getUserProducts)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected products",
            "result": result.recordset
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}


let register_user = async(req,res)=>{
    let {userName,
        userEmail,
        userPassword,
        userStreet,
        userPC,
        userContact,
        userBirthDate} = req.body
        try {
            let pool = await sql.connect(db_config)
            const salt = bcrypt.genSaltSync(saltRounds);
            const pWD = bcrypt.hashSync(userPassword, salt);


        let result = await pool.request()
            .input('userName', userName)
            .input('userEmail', userEmail)
            .input('userPassword', pWD)
            .input('userStreet', userStreet)
            .input('userPC', userPC)
            .input('userContact', userContact)
            .input('userBirthDate', userBirthDate)
            .query(queries.registerUser)
        
        pool.close()
        

        res.status(200).json({
            "message": 'Registo efetuado com sucesso',
            "result":  result.recordset[0]
            })
       
        
    } catch (err) {
        
        res.status(500).send(err)
    }
}


let update_user = async(req,res)=>{
    let uid = req.params.id

    let {nome,contato} = req.body

    try {
        let pool = await sql.connect(db_config)
        await pool
          .request()
          .input("nome", nome)
          .input("contato", contato)
          .input("idParam", uid)
          .query(queries.updateUserByID);
        pool.close()
        res.status(200).json({
            "message": 'User atualizado com sucesso',
            })
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

let add_favorite = async(req,res)=>{

    let {uid,pdID} = req.body

    try {
        let pool = await sql.connect(db_config)
        let result = await pool
          .request()
          .input("uid", uid)
          .input("pdID", pdID)
          .query(queries.addProductFav);
        pool.close()
        res.status(200).json({
            "message": 'Produto adicionado com sucesso aos favoritos',
            })
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
}

let remove_favorite = async(req,res)=>{

    let {uid,pdID} = req.body

    try {
        let pool = await sql.connect(db_config)
        let result = await pool
          .request()
          .input("uid", uid)
          .input("pdID", pdID)
          .query(queries.deleteProductFav);

        pool.close()
        res.status(200).json({
            "message": 'Favorito removido com sucesso',
            })
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


module.exports={
    get_user_by_id,
    update_user,
    get_all_users,
    register_user,
    get_user_products,
    remove_favorite,
    add_favorite
}