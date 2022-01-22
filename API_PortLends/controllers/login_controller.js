const db_config = require('../DB_config');
const bcrypt = require('bcrypt');
const saltRounds = 10;
const sql = require('mssql')
const queries = require('../events/queries')

let login = async (req,res)=>{

    const credentials = req.headers.authorization.split(':');
    email=credentials[0]
    passwd=credentials[1]
    try {
        
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('email', email)
            .query(queries.getUserByEmail)
        
        pool.close()

        const resp = bcrypt.compareSync(passwd, result.recordset[0]["password"]);
        
        
        if (resp){
        res.status(200).json({
            "message": "Autenticação bem sucedida",
            "UID":result.recordset[0]["uid"]
            })
        }else{
            res.status(206).json({
                "message": "Falha na autenticação: password errada",
                })
        }
        
    } catch (err) {
        
        res.status(500).json({
            "message": "Falha na autenticação: email não existe",
            })
    }
}



module.exports={
    login
}