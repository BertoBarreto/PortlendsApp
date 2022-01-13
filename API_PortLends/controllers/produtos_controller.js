const db_config = require('../DB_config');
const sql = require('mssql')
const queries = require('../events/queries')

let get_produtos_categoria = async (req,res)=>{
    let idParam = req.params.id
    try {
        
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input('idParam', idParam)
            .query(queries.getAllCategoryProd)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected products",
            "result": result.recordsets
            })

    } catch (err) {
        
        res.status(500).send(err)
    }
}

let get_produtos_categoria_subcategoria = async (req,res)=>{
    let {categoriaId, subcategoriaId} = req.body
    try {
 
        let pool = await sql.connect(db_config)
        
        let result = await pool.request()
            .input("categoriaId", sql.Int, categoriaId)
            .input("subcategoriaId", sql.Int, subcategoriaId)
            .query(queries.getAllCategorySubcategoryProd)
          
        pool.close()
        
        res.status(200).json({
            "message": "Selected Products",
            "result": result.recordsets
            })

    } catch (err) {
        console.log(err)
        res.status(500).send(err)
    }
}

module.exports={
    get_produtos_categoria,
    get_produtos_categoria_subcategoria
}