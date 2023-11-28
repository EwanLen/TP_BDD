/*Create DATABASE Groupe_travail*/

Use Groupe_travail

/*
CREATE TABLE [Personne] (
  [idEquipe] int PRIMARY KEY IDENTITY(1, 1),
  [nom] nvarchar(50) NOT NULL,
  [prenom] nvarchar(50) NOT NULL,
  [metier_id] int NOT NULL
)
GO

CREATE TABLE [Equipe] (
  [idEquipe] int PRIMARY KEY IDENTITY(1, 1),
  [nom] nvarchar(50) NOT NULL,
  [projet] nvarchar(100) NOT NULL
)
GO

CREATE TABLE [Personne_has_Equipe] (
  [personne_id] int,
  [equipe_id] int,
  PRIMARY KEY ([personne_id], [equipe_id])
)
GO

CREATE TABLE [Metier] (
  [idMetier] int PRIMARY KEY IDENTITY(1, 1),
  [nom] nvarchar(50) NOT NULL
)
GO

ALTER TABLE [Personne_has_Equipe] ADD FOREIGN KEY ([equipe_id]) REFERENCES [Equipe] ([idEquipe])
GO

ALTER TABLE [Personne_has_Equipe] ADD FOREIGN KEY ([personne_id]) REFERENCES [Personne] ([idEquipe])
GO

ALTER TABLE [Personne] ADD FOREIGN KEY ([metier_id]) REFERENCES [Metier] ([idMetier])
GO
*/

--Insert into Metier(nom) Values('chef');
--Insert into Metier(nom) Values('designer');

--Insert into Equipe(nom,projet) Values('Team A','site internet Mairie');
--Insert into Equipe(nom,projet) Values('Team B','CRM');
--Insert into Equipe(nom,projet) Values('Team C','ERP');

--Insert into Personne(nom,prenom,metier_id) Values('Brad','Pitt',1);
--Insert into Personne(nom,prenom,metier_id) Values('Bruce','Willis',2);
--Insert into Personne(nom,prenom,metier_id) Values('Nicolas','Cage',2);

--Insert into Personne(nom,prenom,metier_id) Values('Angelina','Jolie',1);
--Insert into Personne(nom,prenom,metier_id) Values('Tom','Cruise',2);
--Insert into Personne(nom,prenom,metier_id) Values('Tom','Hanks',2);

--Insert into Personne(nom,prenom,metier_id) Values('Bob','Dylan',1);
--Insert into Personne(nom,prenom,metier_id) Values('Johnny','Cash',2);
--Insert into Personne(nom,prenom,metier_id) Values('Johnny','Hendrix',2);

--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(1,1)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(2,1)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(3,1)

--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(4,2)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(5,2)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(6,2)

--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(7,3)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(8,3)
--Insert into Personne_has_Equipe(personne_id,equipe_id) Values(9,3)

Select p.nom,p.prenom,m.nom,e.projet from Personne as p inner join Metier as m on p.metier_id = m.idMetier inner join Personne_has_Equipe as Per on p.idEquipe = Per.personne_id inner join Equipe as e on Per.equipe_id = e.idEquipe where e.nom = 'Team A';
Select p.nom,p.prenom,m.nom,e.projet from Personne as p inner join Metier as m on p.metier_id = m.idMetier inner join Personne_has_Equipe as Per on p.idEquipe = Per.personne_id inner join Equipe as e on Per.equipe_id = e.idEquipe;