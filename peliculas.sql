-- #1 Crear una base de datos llamada películas.
CREATE DATABASE peliculas;

\c peliculas;

-- Crear 2 tablas llamadas películas y reparto.
CREATE TABLE peliculas(
    id INTEGER,
    Pelicula VARCHAR,
    A_Estreno INTEGER,
    Director VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE reparto(
    id INTEGER,
    Nombres VARCHAR,
    FOREIGN KEY (id) REFERENCES peliculas (id)
);

-- #2 Cargar ambos archivos a su tabla correspondiente.
\copy peliculas FROM '/Users/darik/Library/Mobile Documents/com~apple~CloudDocs/BootCamp/07 Introducción a Base de Datos para Emprendimiento Digital/01 Bases de Datos Relacionales/Día 4/Desafio/peliculas.csv' csv header;
\copy reparto FROM '/Users/darik/Library/Mobile Documents/com~apple~CloudDocs/BootCamp/07 Introducción a Base de Datos para Emprendimiento Digital/01 Bases de Datos Relacionales/Día 4/Desafio/reparto.csv' csv header;

-- #3 Obtener el ID de la película “Titanic”.
SELECT id, Pelicula FROM peliculas WHERE Pelicula = 'Titanic';

-- #4 Listar a todos los actores que aparecen en la película "Titanic".
SELECT id, Nombres FROM reparto WHERE id = 2;

-- #5 Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT Nombres, COUNT(id) FROM reparto WHERE Nombres = 'Harrison Ford' GROUP BY Nombres;

-- #6 Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT Pelicula, A_Estreno FROM peliculas WHERE A_Estreno BETWEEN 1990 AND 1999 ORDER BY Pelicula ASC;

-- #7 Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM peliculas;

-- #8 Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT Pelicula, LENGTH(Pelicula) AS longitud_titulo FROM peliculas ORDER BY LENGTH(Pelicula) DESC LIMIT 1;