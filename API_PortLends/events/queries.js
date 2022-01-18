module.exports = {
  updateUserByID: "UPDATE Users SET Rua=@ruaParam WHERE uid=@idParam",
  getAllUsers: "EXEC getUsers;",
  deleteUser: "DELETE FROM Users WHERE uid=@idParam",
  getAllCategories: `EXEC getCategories;`,
  getSearchCategories: `select * from Categorias where Categorias.Descricao LIKE @nome`,
  getAllSubCategoriesFromCategory:`EXEC getSubcategories @CategoriaID = @idParam;`,
  getAllCategoryProd: "EXEC getCategoryProducts @CategoriaID = @idParam;",
  getAllCategorySubcategoryProd: "EXEC getSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId;",
  getProduct: "SELECT * FROM Inventario JOIN ImagensProdutos ON ImagensProdutos.Pd_ID=Inventario.Pd_ID LEFT JOIN PrecoAluguer on PrecoAluguer.Pd_ID=Inventario.Pd_ID WHERE Inventario.Pd_ID=@pdID AND PrecoAluguer.data >= ALL (select data from PrecoAluguer Where Pd_ID=@pdID)",
  getPrecoProduct: "SELECT quantia FROM PrecoAluguer WHERE PrecoAluguer.data >= ALL (select data from PrecoAluguer Where Pd_ID=@pdID)"
 
};

/* SELECT Subcategorias.Subcategoria_ID, Subcategorias.Descricao, count(Inventario.Pd_ID) FROM Subcategorias 
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
group by Subcategorias.Subcategoria_ID, Subcategorias.Descricao */