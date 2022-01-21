module.exports = {
  //?Users
  updateUserByID: "EXEC updateUser @userName=@nome,@userContact=@contato,@uid=@idParam",
  getAllUsers: "EXEC getUsers;",
  getUserById: "EXEC getUsersById @uid=@idParam;",
  getUserByEmail: "EXEC getUsersPasswdByEmail @email = @email",
  getUserProducts: "EXEC getUserProducts @uid=@idParam",
  registerUser:`EXEC addUser @userName =@userName,@userBirthDate = @userBirthDate,
                  @userContact =@userContact,@userStreet =@userStreet,@userPC =@userPC
                  ,@userPassword =@userPassword,@userEmail =@userEmail`,
  //?Categories
  getAllCategories: `EXEC getCategories;`,
  //TODO
  getSearchCategories: `EXEC getCategorySearch @name=@nome`,
  getAllSubCategoriesFromCategory:`EXEC getSubcategories @CategoriaID = @idParam;`,
  getAllCategoryProd: "EXEC getCategoryProducts @CategoriaID = @idParam;",
  getSearchCategoryProd: "EXEC getSearchCategoryProducts @CategoriaID = @idParam, @name=@name;",
  getAllCategorySubcategoryProd: "EXEC getSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId;",
  getSearchCategorySubcategoryProd: "EXEC getSearchSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId, @name=@name;",
  //?Products
  getProduct: "EXEC getProductInfo @pdID=@pdID",
  getPrecoProduct: "SELECT quantia FROM PrecoAluguer WHERE PrecoAluguer.data >= ALL (select data from PrecoAluguer Where Pd_ID=@pdID)",
  deleteProduct: "UPDATE Inventario Set disponibilidade = -1 where Pd_ID=@pdID",
  deleteProductFav: "DELETE Favoritos Where Pd_ID = @pdID and UID = @uid",
  addProductFav: "INSERT INTO Favoritos VALUES (@uid,@pdID);"
  
};

/* SELECT Subcategorias.Subcategoria_ID, Subcategorias.Descricao, count(Inventario.Pd_ID) FROM Subcategorias 
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
group by Subcategorias.Subcategoria_ID, Subcategorias.Descricao */