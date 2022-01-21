const db_config = require('../DB_config');
const sql = require('mssql')
const queries = require('../events/queries')

let get_all_categories = async (req,res)=>{
    try {
        
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .query(queries.getAllCategories)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected Categories",
            "result": result.recordset
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

let get_search_categories = async (req,res)=>{
    let {pesquisa} = req.body
    try {

        pesquisa = pesquisa + '%'
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('nome', sql.VarChar, pesquisa)
            .query(queries.getSearchCategories)
        
        pool.close()
        
        res.status(200).json({
            "message": "Selected Search Categories",
            "result": result.recordset
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}



module.exports={
    get_all_categories,
    get_search_categories
}