INSERT INTO Categorias VALUES('Jardim','url')
INSERT INTO Categorias VALUES('Mecânica','url')
INSERT INTO Categorias VALUES('Casa','url')
INSERT INTO Categorias VALUES('Cozinha','url')
INSERT INTO Categorias VALUES('Roupa','url')
INSERT INTO Categorias VALUES('Desporto','url')

select * from Categorias

INSERT INTO Subcategorias VALUES('Gala',5)
INSERT INTO Subcategorias VALUES('Blusas',5)
INSERT INTO Subcategorias VALUES('T-Shirts',5)
INSERT INTO Subcategorias VALUES('Vestidos',5)
INSERT INTO Subcategorias VALUES('Calções Homem',5)
INSERT INTO Subcategorias VALUES('Calças Homem',5)
INSERT INTO Subcategorias VALUES('Calças Mulher',5)
INSERT INTO Subcategorias VALUES('Casacos Mulher',5)

select Categorias.Categoria_ID,Categorias.Descricao, count(Inventario.Pd_ID) as contagem from Categorias
join Inventario on Inventario.CategoriaID=Categorias.Categoria_ID
group by Categorias.Categoria_ID,Categorias.Descricao

select Subcategorias.Subcategoria_ID,Subcategorias.Descricao, count(Inventario.Pd_ID) as contagem from Subcategorias
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
where Subcategorias.Categoria_ID = @idParam
group by Subcategorias.Subcategoria_ID,Subcategorias.Descricao


select * from Categorias
  select * from Inventario where CategoriaID = 5 and SubcategoriaId = 1

select * from Inventario
where CategoriaID = 5

Select Subcategorias.Descricao from Categorias
join Subcategorias on Subcategorias.Categoria_ID=Categorias.Categoria_ID
where Categorias.Categoria_ID=5

select * from Inventario where CategoriaID = 5 and SubcategoriaId = 1

SET IDENTITY_INSERT Localidades ON
INSERT INTO Localidades(CP,Descricao) VALUES(4900,'Viana do castelo')
SET IDENTITY_INSERT Localidades OFF

select * from Users

INSERT INTO Users
VALUES ('Antonio Esteves',GETDATE(),668989899,'Rua da esquina',4900,'teste123','antonioesteves@gmail.com')

INSERT INTO Users
VALUES ('Roberto Barreto',GETDATE(),668989899,'Rua da esquina',4900,'teste123','robertofmbarreto@gmail.com')

INSERT INTO Users
VALUES ('Maria Madalena',GETDATE(),668989899,'Rua da esquina',4900,'teste123','robertofmbarreto@gmail.com')

INSERT INTO Inventario Values(2,5,5,1,'Vestido de Noiva','Um simples vestido de noiva','Tamanho S','Está praticamente como novo')
INSERT INTO Inventario Values(2,5,5,1,'Fato de Noivo','Um simples fato de noivo','Tamanho M','Está praticamente como novo')
INSERT INTO Inventario Values(2,5,5,8,'Sobretudo','Um simples Sobretudo','Tamanho S','Está praticamente como novo')


Insert into EstadoProdutos Values('Péssimo')
Insert into EstadoProdutos Values('Razoável')
Insert into EstadoProdutos Values('Satisfatório')
Insert into EstadoProdutos Values('Muito Bom')
Insert into EstadoProdutos Values('Excelente')



select * from EstadoProdutos
select * from Users
select * from Inventario
select * from Subcategorias