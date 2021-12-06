Create database Project_Monitoring_System;

drop table if exists document;
drop table if exists livrable;
drop table if exists phase;
drop table if exists travaille;
drop table if exists project;
drop table if exists organisation;
drop table if exists employé;
drop table if exists profile;




create table profile (
	id serial primary key,
	nom varchar(30) unique not null
);

create table employé(
	matricule serial primary key,
	nom varchar(30) not null,
	prénom varchar(30) not null,
	profile integer REFERENCES profile (id),
	tél DECIMAL(10),
	email varchar(40),
	login varchar(40),
	password varchar(40)
);
create table organisation(
	code serial primary key,
	nom varchar(20),
	adresse varchar(20),
	tél DECIMAL(10),
	nom_contact varchar(30),
	email_contact varchar(40),
	adresse_web varchar(40)
);
create table project (
	code serial primary key,
	nom varchar(40),
	descriptions varchar(100),
	date_debut date,
	date_fin date,
	montant decimal,
	organisation integer references organisation(code)
);

create table document(
	id serial primary key,
	doc_path varchar(300),
	project integer REFERENCES project (code)
);
create table phase(
	code serial primary key,
	libellé varchar(30),
	description varchar(200),
	date_debut date,
	date_fin date,
	montant float,
	status boolean,
	facturé boolean,
	paiement boolean,
	project integer REFERENCES project (code)
);

create table travaille(
	employé_matricule integer REFERENCES employé (matricule) ON DELETE CASCADE ON UPDATE CASCADE,
	project_code integer REFERENCES project (code) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (employé_matricule, project_code)
);
create table livrable(
	code serial primary key,
	libellé varchar(50),
	description varchar(400),
	doc_url varchar(400),
	phase_code integer REFERENCES phase (code)
);