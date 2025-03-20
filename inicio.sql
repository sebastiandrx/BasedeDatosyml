CREATE DATABASE IF NOT EXISTS BibliotecaP;
USE BibliotecaP;

CREATE TABLE IF NOT EXISTS Autores (
    ID_Autor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Fecha_Nacimiento DATE
);

CREATE TABLE IF NOT EXISTS Libros (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Anio_Publicacion YEAR,
    ID_Autor INT,
    Genero VARCHAR(50),
    Cantidad_Disponible INT,
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);

CREATE TABLE IF NOT EXISTS Miembros (
    ID_Miembro INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Fecha_Registro DATE
);

CREATE TABLE IF NOT EXISTS Prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20),
    ID_Miembro INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ISBN) REFERENCES Libros(ISBN),
    FOREIGN KEY (ID_Miembro) REFERENCES Miembros(ID_Miembro)
);

INSERT INTO Autores (Nombre, Apellido, Fecha_Nacimiento) VALUES
('Gabriel', 'García Márquez', '1927-03-06'),
('J.K.', 'Rowling', '1965-07-31'),
('George', 'Orwell', '1903-06-25');

INSERT INTO Libros (ISBN, Titulo, Anio_Publicacion, ID_Autor, Genero, Cantidad_Disponible) VALUES
('978-84-376-0494-7', 'Cien años de soledad', 1967, 1, 'Novela', 5),
('978-0747532699', 'Harry Potter y la piedra filosofal', 1997, 2, 'Fantasía', 10),
('978-0451524935', '1984', 1949, 3, 'Ciencia Ficción', 7);

INSERT INTO Miembros (Nombre, Direccion, Telefono, Fecha_Registro) VALUES
('Juan Pérez', 'Calle 123, Bogotá', '3001234567', '2023-01-15'),
('María Gómez', 'Avenida 456, Medellín', '3107654321', '2023-02-20');

INSERT INTO Prestamos (ISBN, ID_Miembro, Fecha_Prestamo, Fecha_Devolucion) VALUES
('978-84-376-0494-7', 1, '2024-03-01', '2024-03-15'),
('978-0747532699', 2, '2024-03-05', '2024-03-20');
