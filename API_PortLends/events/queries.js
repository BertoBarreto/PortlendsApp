module.exports = {
  //?Users
  updateUserByID: "UPDATE Users SET Nome=@nome,contato=@contato WHERE uid=@idParam",
  getAllUsers: "EXEC getUsers;",
  getUserById: "EXEC getUsersById @uid=@idParam;",
  getUserByEmail: "EXEC getUsersPasswdByEmail @email = @email",
  getUserProducts: `select Pd_ID from Inventario 
                    join Users on Users.UID=Inventario.UID Where Users.uid=@idParam AND Inventario.Disponibilidade>=0`,
  registerUser:`EXEC addUser @userName =@userName,@userBirthDate = @userBirthDate,
  @userContact =@userContact,@userStreet =@userStreet,@userPC =@userPC
  ,@userPassword =@userPassword,@userEmail =@userEmail`,
  //?Categories
  getAllCategories: `EXEC getCategories;`,
  //TODO
  getSearchCategories: `select * from Categorias where Categorias.Descricao LIKE @nome`,
  getAllSubCategoriesFromCategory:`EXEC getSubcategories @CategoriaID = @idParam;`,
  getAllCategoryProd: "EXEC getCategoryProducts @CategoriaID = @idParam;",
  getAllCategorySubcategoryProd: "EXEC getSubcategoryProducts @CategoriaID = @categoriaId, @SubcategoriaID = @subcategoriaId;",
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