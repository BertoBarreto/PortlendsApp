module.exports = {
  updateUserByID: "UPDATE Users SET Rua=@ruaParam WHERE uid=@idParam",
  getAllUsers: "SELECT * FROM Users",
  deleteUser: "DELETE FROM Users WHERE uid=@idParam",
  getAllCategories: `select Categorias.Categoria_ID,Categorias.Descricao, count(Inventario.Pd_ID) as contagem from Categorias
                      left join Inventario on Inventario.CategoriaID=Categorias.Categoria_ID
                      group by Categorias.Categoria_ID,Categorias.Descricao`,
  getAllSubCategoriesFromCategory:`select Subcategorias.Subcategoria_ID,Subcategorias.Descricao, count(Inventario.Pd_ID) as contagem from Subcategorias
                                    join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
                                    where Subcategorias.Categoria_ID = @idParam
                                    group by Subcategorias.Subcategoria_ID,Subcategorias.Descricao`,
  getAllCategoryProd: "select * from Inventario where CategoriaID = @idParam",
  getAllCategorySubcategoryProd: "select * from Inventario where CategoriaID = @categoriaID and SubcategoriaId = @subcategoriaId",
 
};

/* SELECT Subcategorias.Subcategoria_ID, Subcategorias.Descricao, count(Inventario.Pd_ID) FROM Subcategorias 
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
group by Subcategorias.Subcategoria_ID, Subcategorias.Descricao */