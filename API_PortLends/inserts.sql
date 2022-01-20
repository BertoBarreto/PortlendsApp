INSERT INTO Categorias VALUES('Jardim','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Fjardim.jpg?alt=media&token=8ec75b96-6865-4c0d-b9ea-e3afa10bd34e')
INSERT INTO Categorias VALUES('Mecânica','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Fmecanica.jpg?alt=media&token=f08917d8-5cd0-4032-b052-c483ca6c5079')
INSERT INTO Categorias VALUES('Casa','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Fcasa.jpg?alt=media&token=7567edca-563f-4d0d-981d-43a4c2d92a5f')
INSERT INTO Categorias VALUES('Cozinha','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Fcozinha.jpg?alt=media&token=96910e29-c089-4828-a758-950d49f50b54')
INSERT INTO Categorias VALUES('Roupa','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Froupa.jpg?alt=media&token=c0649788-b1dd-4fd9-863e-566cd40a6192')
INSERT INTO Categorias VALUES('Desporto','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Fdesporto.jpg?alt=media&token=e9390ba1-7a01-401b-92ba-3a2c279abbbd')
INSERT INTO Categorias VALUES('Livros','https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Categorias%2Flivros.jfif?alt=media&token=14287915-bb39-49dd-b6b1-d2bc51b074b5')

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
DBCC CHECKIDENT (Users, RESEED, 0);
GO

INSERT INTO Users
VALUES ('Antonio Esteves',GETDATE(),668989899,'Rua da esquina',4900,'teste123','antonioesteves@gmail.com')

INSERT INTO Users
VALUES ('Roberto Barreto',GETDATE(),668989899,'Rua da esquina',4900,'teste123','robertofmbarreto@gmail.com')

INSERT INTO Users
VALUES ('Maria Madalena',GETDATE(),668989899,'Rua da esquina',4900,'teste123','robertofmbarreto@gmail.com')


DBCC CHECKIDENT (Inventario, RESEED, 0);
GO

select*from Inventario
INSERT INTO Inventario Values(2,5,5,1,'Vestido de Noiva','Um simples vestido de noiva','Tamanho S','Está praticamente como novo',1)
INSERT INTO Inventario Values(2,5,5,1,'Fato de Noivo','Um simples fato de noivo','Tamanho M','Está praticamente como novo',0)
INSERT INTO Inventario Values(2,5,5,8,'Sobretudo','Um simples Sobretudo','Tamanho S','Está praticamente como novo',1)



Insert into ImagensProdutos VALUES(1,'https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Produtos%2F1%2Fnoiva.jpg?alt=media&token=efba4ba3-83f8-429a-878a-462051b9efd5')
Insert into ImagensProdutos VALUES(2,'https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Produtos%2F2%2Fnoivo.jpg?alt=media&token=3709bbeb-55b6-4fa8-ab33-1fdd99a0ed89')
Insert into ImagensProdutos VALUES(3,'https://firebasestorage.googleapis.com/v0/b/portlends-ad27b.appspot.com/o/Produtos%2F3%2Fsobretudo.jpg?alt=media&token=180ea27a-cdd6-48a8-8842-1ad0d808be72')


select * from PrecoAluguer
Insert into PrecoAluguer VALUES(GETDATE(),15,'\h',1)
Insert into PrecoAluguer VALUES(GETDATE(),16,'\h',1)
Insert into PrecoAluguer VALUES(GETDATE(),17,'\h',1)
Insert into PrecoAluguer VALUES(GETDATE(),17,'\min',3)

Insert into EstadoProdutos Values('Péssimo')
Insert into EstadoProdutos Values('Razoável')
Insert into EstadoProdutos Values('Satisfatório')
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




select * from Categorias
where Categorias.Descricao LIKE '%C%'


select * from Inventario 
left join ImagensProdutos on ImagensProdutos.Pd_ID = Inventario.Pd_ID 
left join PrecoAluguer on PrecoAluguer.Pd_ID=Inventario.Pd_ID 
where CategoriaID = 5 AND PrecoAluguer.data >= ALL (select data from PrecoAluguer where Pd_ID=1)

select * from PrecoAluguer
select quantia, Pd_ID from PrecoAluguer
where data >= ALL (select * from PrecoAluguer
					select quantia, Pd_ID from PrecoAluguer where Pd_ID=1)

					select * from Inventario
SET ANSI_WARNINGS OFF;
Update Inventario Set Descricao='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nunc orci, tincidunt id augue sodales, finibus ultricies nibh. Donec metus eros, convallis sit amet tincidunt eget, dictum sed risus. Suspendisse leo mi, vulputate ac consequat tempus, aliquam eget sapien. Vestibulum quis sem orci. Phasellus mi purus, consequat ac sem sit amet, congue convallis sapien.', DescEstado='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nunc orci, tincidunt id augue sodales, finibus ultricies nibh. Donec metus eros, convallis sit amet tincidunt eget, dictum sed risus. '
SET ANSI_WARNINGS ON;