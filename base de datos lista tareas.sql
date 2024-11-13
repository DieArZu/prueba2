CREATE DATABASE ListaTareas;
USE ListaTareas;

CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nombre varchar(255),
    email varchar(255),
    pwd varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO usuarios ( nombre , email, pwd)
VALUES ('Diego', 'daz@daz.com', '111');

INSERT INTO usuarios ( nombre , email, pwd)
VALUES ('Tefa', 'tefa@daz.com', '222');


CREATE TABLE tareas (
	id INT NOT NULL AUTO_INCREMENT,	
    titulo varchar(255),
    descripcion varchar(255),
    creador varchar(255),
    releaseDate datetime,
    PRIMARY KEY (id)
);


INSERT INTO movies (title, photo, releaseDate) VALUES 
('Shutter Island', 
'https://resizing.flixster.com/dS9_UXykzFWMLxKC2NfI_GV-eR0=/206x305/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p3531967_p_v13_an.jpg', 
'2005-06-01');

INSERT INTO movies (title, photo, releaseDate) VALUES 
('The Goodfather', 
'https://static1.srcdn.com/wordpress/wp-content/uploads/2023/05/the-godfather-poster.jpeg', 
'1990-06-01');

INSERT INTO movies (title, photo, releaseDate) VALUES 
('The Pianist', 
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg5LsNqUeX2eA9QCvElO5kHQzGrwJ8op2KsA&s', 
'2000-06-01');

select curdate()

SELECT 
	m.id, 
	m.title, 
	m.photo, 
	YEAR(m.releaseDate) releaseDate,
	f.idMovie isFavorite
FROM moviesdatabase.movies m
LEFT JOIN moviesdatabase.favoritemovies f 
ON m.id = f.idMovie
AND f.email = 'brav88@hotmail.com'

