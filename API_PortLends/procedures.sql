
-- get users
CREATE PROCEDURE getUsers
AS
BEGIN 
	TRANSACTION
	select * from Users
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION
-- get categories with counter

CREATE PROCEDURE getCategories
AS
BEGIN 
	TRANSACTION
	select Categorias.Categoria_ID,Categorias.imageUrl,Categorias.Descricao, count(Inventario.Pd_ID) as contagem from Categorias
	left join Inventario on Inventario.CategoriaID=Categorias.Categoria_ID
	group by Categorias.Categoria_ID,Categorias.Descricao,Categorias.imageUrl 
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get subcategories from categorie with counter
CREATE PROCEDURE getSubcategories @CategoriaID int
AS
BEGIN 
	TRANSACTION
	select Subcategorias.Subcategoria_ID,Subcategorias.Descricao, count(Inventario.Pd_ID) as contagem from Subcategorias
	left join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
	where Subcategorias.Categoria_ID = @CategoriaID
	group by Subcategorias.Subcategoria_ID,Subcategorias.Descricao
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION


-- get all category products
-- select * from Inventario left join ImagensProdutos on ImagensProdutos.Pd_ID = Inventario.Pd_ID LEFT JOIN PrecoAluguer on PrecoAluguer.Pd_ID=Inventario.Pd_ID WHERE CategoriaID = @CategoriaID AND PrecoAluguer.data >= ALL (select data from PrecoAluguer)

CREATE PROCEDURE getCategoryProducts @CategoriaID int
AS
BEGIN 
	TRANSACTION
	select Pd_ID from Inventario where CategoriaID = @CategoriaID
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

--get all subcategory products

CREATE PROCEDURE getSubcategoryProducts @CategoriaID int, @SubcategoriaID int
AS
BEGIN 
	TRANSACTION
	select Pd_ID from Inventario where CategoriaID = @CategoriaID and SubcategoriaId = @SubcategoriaID
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION