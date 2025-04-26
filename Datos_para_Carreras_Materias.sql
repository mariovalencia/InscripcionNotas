INSERT INTO Carrera (nombre_carrera)
VALUES 
('Licenciatura en Medicina'),
('Licenciatura en Enfermería'),
('Licenciatura en Psicología'),
('Ingeniería en Sistemas y Redes Informáticas'),
('Licenciatura en Teología'),
('Licenciatura en Administración de Empresas'),
('Licenciatura en Contaduría Pública'),
('Licenciatura en Comunicaciones'),
('Doctorado en Medicina'),
('Licenciatura en Educación');


-- Insertar materias, 5 por cada carrera

-- Para Licenciatura en Medicina (id_carrera = 1)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Anatomía Humana', 1),
('Fisiología General', 1),
('Farmacología', 1),
('Patología General', 1),
('Salud Pública', 1);

-- Para Licenciatura en Enfermería (id_carrera = 2)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Fundamentos de Enfermería', 2),
('Cuidados de Adulto Mayor', 2),
('Enfermería Materno-Infantil', 2),
('Nutrición y Dietética', 2),
('Ética Profesional en Enfermería', 2);

-- Para Licenciatura en Psicología (id_carrera = 3)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Psicología General', 3),
('Teorías de la Personalidad', 3),
('Psicología del Desarrollo', 3),
('Psicometría', 3),
('Psicología Social', 3);

-- Para Ingeniería en Sistemas y Redes Informáticas (id_carrera = 4)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Programación I', 4),
('Redes de Computadoras', 4),
('Base de Datos I', 4),
('Arquitectura de Computadoras', 4),
('Seguridad Informática', 4);

-- Para Licenciatura en Teología (id_carrera = 5)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Introducción a la Teología', 5),
('Historia de la Iglesia', 5),
('Teología Sistemática', 5),
('Homilética', 5),
('Ética Cristiana', 5);

-- Para Licenciatura en Administración de Empresas (id_carrera = 6)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Contabilidad Financiera', 6),
('Administración de Empresas I', 6),
('Mercadeo Básico', 6),
('Matemática Financiera', 6),
('Emprendimiento e Innovación', 6);

-- Para Licenciatura en Contaduría Pública (id_carrera = 7)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Contabilidad I', 7),
('Auditoría I', 7),
('Contabilidad de Costos', 7),
('Legislación Fiscal', 7),
('Finanzas Corporativas', 7);

-- Para Licenciatura en Comunicaciones (id_carrera = 8)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Periodismo Básico', 8),
('Comunicación Organizacional', 8),
('Producción Audiovisual', 8),
('Teoría de la Comunicación', 8),
('Redacción y Estilo', 8);

-- Para Doctorado en Medicina (id_carrera = 9)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Bioquímica', 9),
('Microbiología Médica', 9),
('Medicina Interna', 9),
('Cirugía General', 9),
('Pediatría', 9);

-- Para Licenciatura en Educación (id_carrera = 10)
INSERT INTO Materia (nombre_materia, id_carrera) VALUES
('Didáctica General', 10),
('Psicopedagogía', 10),
('Evaluación Educativa', 10),
('Diseño Curricular', 10),
('Tecnologías Educativas', 10);