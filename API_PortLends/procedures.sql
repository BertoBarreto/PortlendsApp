-- add user
CREATE PROCEDURE addUser @userName varchar(255),@userBirthDate varchar(255),
							@userContact int,@userStreet varchar(255),@userPC int,@userPassword varchar(255),@userEmail varchar(255)
AS
BEGIN 
	TRANSACTION
	INSERT INTO Users
		VALUES (@userName,@userBirthDate,@userContact,@userStreet,@userPC,@userPassword,@userEmail)
	SELECT Users.UID,contato,Nome,Floor((DATEDIFF(day,dt_nasc,GETDATE())/365)) as idade,email,rua,CP from Users where uid >= ALL(SELECT Users.UID from users)
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION


-- update user
CREATE PROCEDURE updateUser @userName varchar(255), @userContact int, @uid int
AS
BEGIN 
	TRANSACTION
	Update Users SET Users.Nome=@userName,Users.contato =@userContact where uid = @uid
	SELECT Users.UID,contato,Nome,Floor((DATEDIFF(day,dt_nasc,GETDATE())/365)) as idade,email,rua,CP from Users where uid = @uid
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get users
CREATE PROCEDURE getUsers
AS
BEGIN 
	TRANSACTION
	SELECT Users.UID,contato,Nome,Floor((DATEDIFF(day,dt_nasc,GETDATE())/365)) as idade,email,rua,Users.CP,Localidades.Descricao from Users join Localidades on Localidades.CP=Users.CP
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get users by id
CREATE PROCEDURE getUsersById @uid int
AS
BEGIN 
	TRANSACTION
	SELECT Users.UID,contato,Nome,Floor((DATEDIFF(day,dt_nasc,GETDATE())/365)) as idade,email,rua,Users.CP,Localidades.Descricao from Users join Localidades on Localidades.CP=Users.CP where uid = @uid
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get users by email
CREATE PROCEDURE getUsersPasswdByEmail @email Varchar(255)
AS
BEGIN 
	TRANSACTION
	SELECT password, uid FROM Users WHERE email=@email
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get categories with counter

CREATE PROCEDURE getCategories
AS
BEGIN 
	TRANSACTION
	select Categorias.Categoria_ID,Categorias.imageUrl,Categorias.Descricao, count(A.Pd_ID) as contagem from Categorias
	left join (select * from Inventario where Inventario.Disponibilidade>=0) A on A.CategoriaID=Categorias.Categoria_ID
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
	select Subcategorias.Subcategoria_ID,Subcategorias.Descricao, count(A.Pd_ID) as contagem from Subcategorias
	left join (select * from Inventario where Inventario.Disponibilidade>=0) A on A.SubcategoriaID=Subcategorias.Subcategoria_ID
	where Subcategorias.Categoria_ID = @CategoriaID
	group by Subcategorias.Subcategoria_ID,Subcategorias.Descricao
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION


-- get all category products

CREATE PROCEDURE getCategoryProducts @CategoriaID int
AS
BEGIN 
	TRANSACTION
	select Pd_ID from Inventario where CategoriaID = @CategoriaID AND Inventario.Disponibilidade>=0
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

-- get category search

CREATE PROCEDURE getCategorySearch @name varchar(255)
AS
BEGIN 
	TRANSACTION
	select Categorias.Categoria_ID,Categorias.imageUrl,Categorias.Descricao, count(A.Pd_ID) as contagem from Categorias
	left join (select * from Inventario where Inventario.Disponibilidade>=0) A on A.CategoriaID=Categorias.Categoria_ID
	where Categorias.Descricao LIKE @name
	group by Categorias.Categoria_ID,Categorias.Descricao,Categorias.imageUrl
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

--get all subcategory products

CREATE PROCEDURE getSubcategoryProducts @CategoriaID int, @SubcategoriaID int
AS
BEGIN 
	TRANSACTION
	select Pd_ID from Inventario where CategoriaID = @CategoriaID and SubcategoriaId = @SubcategoriaID AND Inventario.Disponibilidade>=0
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION


--get product info

CREATE PROCEDURE getProductInfo @pdID int
AS
BEGIN 
	TRANSACTION
	SELECT Inventario.Pd_ID,Nome,Descricao,DescEstado, InfoAdicional, EstadoProdutoID,Disponibilidade,ImgUrl,quantia,tipo,Favoritos.UID as FavoritoUid FROM Inventario 
	JOIN ImagensProdutos ON ImagensProdutos.Pd_ID=Inventario.Pd_ID 
	LEFT JOIN PrecoAluguer on PrecoAluguer.Pd_ID=Inventario.Pd_ID 
	LEFT JOIN Favoritos on Favoritos.Pd_ID=Inventario.Pd_ID
	WHERE Inventario.Pd_ID=@pdID AND PrecoAluguer.data >= ALL (select data from PrecoAluguer Where Pd_ID=@pdID) AND Inventario.Disponibilidade>=0
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION

--get user products

CREATE PROCEDURE getUserProducts @uid int
AS
BEGIN 
	TRANSACTION
	select Pd_ID from Inventario join Users on Users.UID=Inventario.UID Where Users.uid=@uid AND Inventario.Disponibilidade>=0
	IF @@ERROR <>0
	ROLLBACK TRANSACTION
	ELSE
	COMMIT TRANSACTION