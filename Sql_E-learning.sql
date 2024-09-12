CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    contra VARCHAR(100) NOT NULL,
    rol ENUM('Admin', 'Teacher', 'Student') DEFAULT 'Student'
);

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES usuarios(id)
);

CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    curso_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE lecciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    titulo VARCHAR(255),
    contenido TEXT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

CREATE TABLE evaluaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    usuario_id INT,
    calificacion DECIMAL(5, 2),
    comentario TEXT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);