INSERT INTO Categorias VALUES('Jardim','url')
INSERT INTO Categorias VALUES('Mec�nica','url')
INSERT INTO Categorias VALUES('Casa','url')
INSERT INTO Categorias VALUES('Cozinha','url')
INSERT INTO Categorias VALUES('Roupa','url')
INSERT INTO Categorias VALUES('Desporto','url')
INSERT INTO Categorias VALUES('Livros','url')

select * from Categorias

INSERT INTO Subcategorias VALUES('Gala',5)
INSERT INTO Subcategorias VALUES('Blusas',5)
INSERT INTO Subcategorias VALUES('T-Shirts',5)
INSERT INTO Subcategorias VALUES('Vestidos',5)
INSERT INTO Subcategorias VALUES('Cal��es Homem',5)
INSERT INTO Subcategorias VALUES('Cal�as Homem',5)
INSERT INTO Subcategorias VALUES('Cal�as Mulher',5)
INSERT INTO Subcategorias VALUES('Casacos Mulher',5)

select Categorias.Categoria_ID,Categorias.Descricao, count(Inventario.Pd_ID) as contagem from Categorias
join Inventario on Inventario.CategoriaID=Categorias.Categoria_ID
group by Categorias.Categoria_ID,Categorias.Descricao

select Subcategorias.Subcategoria_ID,Subcategorias.Descricao, count(Inventario.Pd_ID) as contagem from Subcategorias
join Inventario on Inventario.SubcategoriaID=Subcategorias.Subcategoria_ID
where Subcategorias.Categoria_ID = 1
group by Subcategorias.Subcategoria_ID,Subcategorias.Descricao


select * from Categorias
  select * from Inventario where CategoriaID = 5 and SubcategoriaId = 1

select * from Inventario
where CategoriaID = 5

Select Subcategorias.Descricao from Categorias
join Subcategorias on Subcategorias.Categoria_ID=Categorias.Categoria_ID
where Categorias.Categoria_ID=5

select * from Inventario 
left join ImagensProdutos on ImagensProdutos.Pd_ID = Inventario.Pd_ID
left join PrecoAluguer on PrecoAluguer.Pd_ID = Inventario.Pd_ID
where CategoriaID = 5 and SubcategoriaId = 1 and PrecoAluguer.data >= ALL(select data from PrecoAluguer)

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

INSERT INTO Inventario Values(2,5,5,1,'Vestido de Noiva','Um simples vestido de noiva','Tamanho S','Est� praticamente como novo')
INSERT INTO Inventario Values(2,5,5,1,'Fato de Noivo','Um simples fato de noivo','Tamanho M','Est� praticamente como novo')
INSERT INTO Inventario Values(2,5,5,8,'Sobretudo','Um simples Sobretudo','Tamanho S','Est� praticamente como novo')


Insert into ImagensProdutos VALUES(1,'https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Produtos%2F1%2Fnoiva.jpg?alt=media&token=efba4ba3-83f8-429a-878a-462051b9efd5')

Insert into PrecoAluguer VALUES(GETDATE(),15,1)
Insert into PrecoAluguer VALUES(GETDATE(),16,1)
Insert into PrecoAluguer VALUES(GETDATE(),17,1)

Insert into EstadoProdutos Values('P�ssimo')
Insert into EstadoProdutos Values('Razo�vel')
Insert into EstadoProdutos Values('Satisfat�rio')
Insert into EstadoProdutos Values('Muito Bom')
Insert into EstadoProdutos Values('Excelente')

UPDATE Categorias
SET ImageURL = 'https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Froupa.jpg?alt=media&token=c0649788-b1dd-4fd9-863e-566cd40a6192'
WHERE Descricao = 'Roupa';

select * from EstadoProdutos
select * from Users
select * from Inventario
select * from Subcategorias


select Categorias.Categoria_ID,Categorias.ImageURL,Categorias.Descricao, count(Inventario.Pd_ID) as contagem from Categorias
                      left join Inventario on Inventario.CategoriaID=Categorias.Categoria_ID
                      group by Categorias.Categoria_ID,Categorias.Descricao