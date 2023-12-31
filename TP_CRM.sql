Create DATABASE Cours

Use Cours


CREATE TABLE [client] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom] varchar(255) NOT NULL
)
GO

CREATE TABLE [projet] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [client_id] int NOT NULL,
  [nom] varchar(255)
)
GO

CREATE TABLE [devis] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [version] int NOT NULL,
  [reference] varchar(10) NOT NULL,
  [prix] float NOT NULL,
  [projet_id] int NOT NULL
)
GO

CREATE TABLE [facture] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [reference] varchar(10) NOT NULL,
  [info] varchar(255) NOT NULL,
  [total] float NOT NULL,
  [date_crea] date NOT NULL,
  [date_paiement] date,
  [devis_id] int NOT NULL
)
GO

ALTER TABLE [projet] ADD FOREIGN KEY ([client_id]) REFERENCES [client] ([id])
GO

ALTER TABLE [devis] ADD FOREIGN KEY ([projet_id]) REFERENCES [projet] ([id])
GO

ALTER TABLE [facture] ADD FOREIGN KEY ([devis_id]) REFERENCES [devis] ([id])
GO


INSERT INTO client (nom) Values('Mairie de Rennes');
INSERT INTO client (nom) Values('Neo soft');
INSERT INTO client (nom) Values('Sopra');
INSERT INTO client (nom) Values('Accenture');
INSERT INTO client (nom) Values('Amazon');

Insert Into projet(client_id,nom) Values(1,'Creation de site internet')
Insert Into projet(client_id,nom) Values(2,'Logiciel CRM')
Insert Into projet(client_id,nom) Values(3,'Logiciel de devis')
Insert Into projet(client_id,nom) Values(4,'Site internet ecommerce')
Insert Into projet(client_id,nom) Values(2,'Logiciel ERP')
Insert Into projet(client_id,nom) Values(5,'Logiciel Gestion de Stock')

Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2C00A',3000,1)
Insert Into devis(version,reference,prix,projet_id) Values(2,'DEV2100B',5000,1)
Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2100C',5000,2)
Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2100D',3000,3)
Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2100E',5000,4)
Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2100F',2000,5)
Insert Into devis(version,reference,prix,projet_id) Values(1,'DEV2100G',1000,6)

Insert Into facture(reference,info,total,date_crea,date_paiement,devis_id) Values('FA001','Site internet partie 1',1500,DATEFROMPARTS(2023,09,01),DATEFROMPARTS(2023,10,1),1)
Insert Into facture(reference,info,total,date_crea,devis_id) Values('FA002','Site internet partie 2',1500,DATEFROMPARTS(2023,09,20),2)
Insert Into facture(reference,info,total,date_crea,devis_id) Values('FA003','Logiciel CRM',5000,DATEFROMPARTS(2023,08,01),3)
Insert Into facture(reference,info,total,date_crea,date_paiement,devis_id) Values('FA004','Logiciel devis',3000,DATEFROMPARTS(2023,03,03),DATEFROMPARTS(2023,04,03),4)
Insert Into facture(reference,info,total,date_crea,devis_id) Values('FA005','Site internet ecommerce',5000,DATEFROMPARTS(2023,04,03),5)
Insert Into facture(reference,info,total,date_crea,devis_id) Values('FA006','Logiciel ERP',2000,DATEFROMPARTS(2023,05,04),6)

Select * from devis left join projet on devis.projet_id = projet.id right join facture on devis.projet_id = projet.id where client_id = 3;
Select top 1 client.nom,count(facture.id) from client inner join projet on client.id = projet.client_id inner join devis on projet.id = devis.projet_id inner join facture on devis.id = facture.devis_id group by client.nom order by count(facture.id) desc; 
Select client.nom,sum(facture.total) as Total from client inner join projet on client.id = projet.client_id inner join devis on projet.id = devis.projet_id inner join facture on devis.id = facture.devis_id group by client.nom
Select client.nom,count(devis.id) as Total from client inner join projet on client.id = projet.client_id inner join devis on projet.id = devis.projet_id group by client.nom;
Select sum(facture.total) as CA from facture;
Select sum(facture.total) from client inner join projet on client.id = projet.client_id inner join devis on projet.id = devis.projet_id inner join facture on devis.id = facture.devis_id where facture.date_paiement is NULL;
Select sum(facture.total) from client inner join projet on client.id = projet.client_id inner join devis on projet.id = devis.projet_id inner join facture on devis.id = facture.devis_id where DATEDIFF(MONTH,facture.date_crea,GETDATE()) >= 2 and facture.date_paiement is NULL;