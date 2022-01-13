const db_config = require('../DB_config');
const sql = require('mssql')
const queries = require('../events/queries')

let get_all_subcategories_from_category = async(req,res)=>{
    
    try {
        let pool = await sql.connect(db_config)
        let result = await pool.request()
        .input('idParam', sql.Int, req.params.id)
        .query(queries.getAllSubCategoriesFromCategory)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected subcategories from categorie",
            "result":  result.recordsets
        })

    } catch (err) {
        
        res.status(500).send(err)
    }
}


module.exports={
    get_all_subcategories_from_category
}