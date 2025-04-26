CREATE DATABASE Candidato01;

use Candidato01;

CREATE TABLE Carrera(
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre_carrera nvarchar(100) not null
);

CREATE TABLE Estudiante(
	id int IDENTITY (1,1) PRIMARY KEY,
	nombre nvarchar(100),
	apellido nvarchar(100),
	carnet nvarchar(50) not null unique,
	id_carrera int FOREIGN KEY REFERENCES Carrera(id)
);

CREATE TABLE Materia(
	id int IDENTITY(1,1) PRIMARY KEY,
	nombre_materia nvarchar(100) not null,
	id_carrera int FOREIGN KEY REFERENCES Carrera(id)
);

CREATE TABLE Nota(
	id int IDENTITY (1,1) PRIMARY KEY,
	id_estudiante int FOREIGN KEY REFERENCES Estudiante(id),
	id_materia int FOREIGN KEY REFERENCES Materia(id),
	id_carrera int FOREIGN KEY REFERENCES Carrera(id),
	nota1 decimal(5,2),
	nota2 decimal(5,2),
	nota3 decimal(5,2),
	nota_final decimal(5,2)
);