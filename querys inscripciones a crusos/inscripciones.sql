-- Inserta al menos cinco nuevos estudiantes en la tabla “estudiantes”.
INSERT INTO estudiantes (nombre, edad)
VALUES					("Nicolas", 24),
                        ("Mikkel", 30),
                        ("Juan", 35),
                        ("Javiera", 28),
                        ("Isabela", 20);
                        
-- Inserta al menos cuatro nuevos cursos en la tabla “cursos”. 
INSERT INTO cursos  (nombre, duracion)
VALUES				('Programación en JAVA', 40),
					('Base de Datos SQL', 30),
					('Desarrollo Web', 50),
					('Inteligencia Artificial', 60);
                    
-- Asociar a cuatro de los estudiantes a al menos dos de los cursos dados de alta.
INSERT INTO inscripciones   (ID_estudiante, ID_curso)
VALUE						(1, 1),
							(1, 2),
							(2, 1),
                            (2, 2),
                            (3, 3),
                            (3, 4),
                            (4, 3),
                            (4, 4);
                            
-- Proyecta a todos los estudiantes y sus respectivos cursos.
SELECT *
FROM estudiantes e JOIN cursos c
ON e.ID_estudiante = c.ID_curso;

-- Proyecta todos los estudiantes que están inscritos en un curso específico, utilizando el nombre del curso como criterio de búsqueda.
SELECT e.nombre, c.nombre
FROM estudiantes e JOIN inscripciones i
ON e.ID_estudiante = i.ID_estudiante
JOIN cursos c 
ON c.ID_curso = i.ID_curso
WHERE c.nombre = 'Programación en JAVA';

-- Proyecta todos los cursos en los que está inscrito un estudiante específico, utilizando su nombre como criterio de búsqueda.
SELECT c.nombre
FROM cursos c JOIN inscripciones i ON c.ID_curso = i.ID_curso
JOIN estudiantes e ON e.ID_estudiante = i.ID_estudiante
WHERE e.nombre = "Mikkel";

-- Cuenta el número de estudiantes inscritos en cada curso y muestra el nombre del curso junto con el número de estudiantes inscritos.
SELECT c.nombre AS curso, COUNT(i.ID_estudiante) AS numero_estudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.ID_curso = i.ID_curso
GROUP BY c.ID_curso, c.nombre;

-- Encuentra los estudiantes que no están inscritos en ningún curso.

SELECT 
    e.ID_estudiante,
    e.nombre,
    e.edad
FROM 
    estudiantes e
LEFT JOIN 
    inscripciones i ON e.ID_estudiante = i.ID_estudiante
WHERE 
    i.ID_estudiante IS NULL;