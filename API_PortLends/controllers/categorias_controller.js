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



module.exports={
    get_all_categories
}