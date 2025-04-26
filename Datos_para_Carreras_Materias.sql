INSERT INTO Carrera (nombre_carrera)
VALUES 
('Licenciatura en Medicina'),
('Licenciatura en Enfermer�a'),
('Licenciatura en Psicolog�a'),
('Ingenier�a en Sistemas y Redes Inform�ticas'),
('Licenciatura en Teolog�a'),
('Licenciatura en Administraci�n de Empresas'),
('Licenciatura en Contadur�a P�blica'),
('Licenciatura en Comunicaciones'),
('Doctorado en Medicina'),
('Licenciatura en Educaci�n');


-- Insertar materias, 5 por cada carrera

-- Para Licenciatura en Medicina (id_carrera = 1)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Anatom�a Humana', 1),
('Fisiolog�a General', 1),
('Farmacolog�a', 1),
('Patolog�a General', 1),
('Salud P�blica', 1);

-- Para Licenciatura en Enfermer�a (id_carrera = 2)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Fundamentos de Enfermer�a', 2),
('Cuidados de Adulto Mayor', 2),
('Enfermer�a Materno-Infantil', 2),
('Nutrici�n y Diet�tica', 2),
('�tica Profesional en Enfermer�a', 2);

-- Para Licenciatura en Psicolog�a (id_carrera = 3)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Psicolog�a General', 3),
('Teor�as de la Personalidad', 3),
('Psicolog�a del Desarrollo', 3),
('Psicometr�a', 3),
('Psicolog�a Social', 3);

-- Para Ingenier�a en Sistemas y Redes Inform�ticas (id_carrera = 4)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Programaci�n I', 4),
('Redes de Computadoras', 4),
('Base de Datos I', 4),
('Arquitectura de Computadoras', 4),
('Seguridad Inform�tica', 4);

-- Para Licenciatura en Teolog�a (id_carrera = 5)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Introducci�n a la Teolog�a', 5),
('Historia de la Iglesia', 5),
('Teolog�a Sistem�tica', 5),
('Homil�tica', 5),
('�tica Cristiana', 5);

-- Para Licenciatura en Administraci�n de Empresas (id_carrera = 6)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Contabilidad Financiera', 6),
('Administraci�n de Empresas I', 6),
('Mercadeo B�sico', 6),
('Matem�tica Financiera', 6),
('Emprendimiento e Innovaci�n', 6);

-- Para Licenciatura en Contadur�a P�blica (id_carrera = 7)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Contabilidad I', 7),
('Auditor�a I', 7),
('Contabilidad de Costos', 7),
('Legislaci�n Fiscal', 7),
('Finanzas Corporativas', 7);

-- Para Licenciatura en Comunicaciones (id_carrera = 8)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Periodismo B�sico', 8),
('Comunicaci�n Organizacional', 8),
('Producci�n Audiovisual', 8),
('Teor�a de la Comunicaci�n', 8),
('Redacci�n y Estilo', 8);

-- Para Doctorado en Medicina (id_carrera = 9)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Bioqu�mica', 9),
('Microbiolog�a M�dica', 9),
('Medicina Interna', 9),
('Cirug�a General', 9),
('Pediatr�a', 9);

-- Para Licenciatura en Educaci�n (id_carrera = 10)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Did�ctica General', 10),
('Psicopedagog�a', 10),
('Evaluaci�n Educativa', 10),
('Dise�o Curricular', 10),
('Tecnolog�as Educativas', 10);