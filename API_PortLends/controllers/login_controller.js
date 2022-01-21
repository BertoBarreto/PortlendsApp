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

let registo = async (req,res)=>{
    let {email, passwd} = req.body
    try {
        
        let pool = await sql.connect(db_config)
        const salt = bcrypt.genSaltSync(saltRounds);
        const pWD = bcrypt.hashSync(result.recordset[0]["password"], salt);
        //TODO:MEter opçõ de registo, falta routes e falta app
        let result = await pool.request()
            .input('email', email)
            .query(queries.getUserByEmail)
        
        pool.close()

        
        
        
        if (resp){
        res.status(200).json({
            "message": "Selected products",
            "result": 'Autenticação correta'
            })
        }else{
            res.status(206).send('Autenticação incorreta')
        }
        
    } catch (err) {
        
        res.status(500).send(err)
    }
}


module.exports={
    login
}