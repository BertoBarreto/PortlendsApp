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
  getSearchCategories: `EXEC getCategorySearch @name=@nome`,
  getAllSubCategoriesFromCategory:`EXEC getSubcategories @CategoriaID = @idParam;`,
  getAllCategoryProd: "EXEC getCategoryProducts @CategoriaID = @idParam;",
  getSearchCategoryProd: "EXEC getSearchCategoryProducts @CategoriaID = @idParam, @name=@name;",
  getAllCategorySubcategoryProd: "EXEC getSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId;",
  getSearchCategorySubcategoryProd: "EXEC getSearchSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId, @name=@name;",
  //?Products
  getProduct: "EXEC getProductInfo @pdID=@pdID",
  getPrecoProduct: "EXEC getProductPrice @pdID=@pdID",
  deleteProduct: "EXEC removeProduct @pdID=@pdID",
  deleteProductFav: "EXEC removeFavorite @pdID=@pdID, @uid=@uid",
  addProductFav: "EXEC addFavorite @pdID=@pdID, @uid=@uid"
  
};

/* SELECT Subcategorias.Subcategoria_ID, Subcategorias.Descricao, count(Inventario.Pd_ID) FROM Subcategorias 
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
group by Subcategorias.Subcategoria_ID, Subcategorias.Descricao */