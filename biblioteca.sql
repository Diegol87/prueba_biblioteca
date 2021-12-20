-- 1. Crear el modelo en una base de datos llamada biblioteca, considerando las tablas y sus atributos

CREATE TABLE libro(
	id_libro SERIAL,
	isbn VARCHAR(15)NOT NULL,
	titulo VARCHAR(25) NOT NULL,
	n_paginas INT NOT NULL,
	PRIMARY KEY(id_libro)
);

CREATE TABLE autor(
	cod_autor INT,
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25) NOT NULL,
	fecha_nacimiento INT NOT NULL,
	fecha_muerte INT,
	tipo VARCHAR(15) NOT NULL,
	PRIMARY KEY(cod_autor)
);

CREATE TABLE socio(
	rut VARCHAR(10),
	nombre VARCHAR(25) NOT NULL,
	apellido VARCHAR(25) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono INT NOT NULL,
	PRIMARY KEY(rut)
);

CREATE TABLE autorlibro(
	id_libro INT NOT NULL,
	cod_autor INT NOT NULL,
	FOREIGN KEY(id_libro) REFERENCES libro(id_libro),
	FOREIGN KEY(cod_autor) REFERENCES autor(cod_autor)
);

CREATE TABLE prestamo(
	id_prestamo SERIAL,
	id_libro INT NOT NULL,
	rut VARCHAR (10) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_esperada_dev DATE NOT NULL,
	fecha_real_dev DATE NOT NULL,
	PRIMARY KEY(id_prestamo),
	FOREIGN KEY(id_libro) REFERENCES libro(id_libro),
	FOREIGN KEY(rut) REFERENCES socio(rut)
);

-- 2. Se deben insertar los registros de las tablas correspondientes

-- Tabla socio

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES(
	'1111111-1',
	'JUAN',
	'SOTO',
	'AVENIDA 1, SANTIAGO',
	911111111
);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES(
	'2222222-2',
	'ANA',
	'PÉREZ',
	'PASAJE 2, SANTIAGO',
	922222222
);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES(
	'3333333-3',
	'SANDRA',
	'AGUILAR',
	'AVENIDA 2, SANTIAGO',
	933333333
);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES(
	'4444444-4',
	'ESTEBAN',
	'JEREZ',
	'AVENIDA 3, SANTIAGO',
	944444444
);

INSERT INTO socio(rut, nombre, apellido, direccion, telefono) VALUES(
	'5555555-5',
	'SILVANA',
	'MUÑOZ',
	'PASAJE 3, SANTIAGO',
	955555555
);

--Tabla libro

INSERT INTO libro(isbn, titulo, n_paginas) VALUES(
	'111-1111111-111',
	'CUENTOS DE TERROR',
	344
);

INSERT INTO libro(isbn, titulo, n_paginas) VALUES(
	'222-2222222-222',
	'POESÍAS CONTEMPORANEAS',
	167
);

INSERT INTO libro(isbn, titulo, n_paginas) VALUES(
	'333-3333333-333',
	'HISTORIA DE ASIA',
	511
);

INSERT INTO libro(isbn, titulo, n_paginas) VALUES(
	'444-4444444-444',
	'MANUAL DE MECÁNICA',
	298
);

--Tabla autor

INSERT INTO autor(cod_autor, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo) VALUES(
	3,
	'JOSE',
	'SALGADO',
	1968,
	2020,
	'PRINCIPAL'
);

INSERT INTO autor(cod_autor, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo) VALUES(
	4,
	'ANA',
	'SALGADO',
	1972,
	NULL,
	'COAUTOR'
);

INSERT INTO autor(cod_autor, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo) VALUES(
	1,
	'ANDRÉS',
	'ULLOA',
	1982,
	NULL,
	'PRINCIPAL'
);

INSERT INTO autor(cod_autor, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo) VALUES(
	2,
	'SERGIO',
	'MARDONES',
	1950,
	2012,
	'PRINCIPAL'
);

INSERT INTO autor(cod_autor, nombre, apellido, fecha_nacimiento, fecha_muerte, tipo) VALUES(
	5,
	'MARTIN',
	'PORTA',
	1976,
	NULL,
	'PRINCIPAL'
);

-- Tabla prestamo

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	1,
	'1111111-1',
	'20-01-2020',
	'27-01-2020',
	'27-01-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	2,
	'5555555-5',
	'20-01-2020',
	'27-01-2020',
	'30-01-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	3,
	'3333333-3',
	'22-01-2020',
	'29-01-2020',
	'30-01-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	4,
	'4444444-4',
	'23-01-2020',
	'30-01-2020',
	'30-01-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	1,
	'2222222-2',
	'27-01-2020',
	'03-02-2020',
	'04-02-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	3,
	'1111111-1',
	'31-01-2020',
	'07-02-2020',
	'12-02-2020'
);

INSERT INTO prestamo(id_libro, rut, fecha_inicio, fecha_esperada_dev, fecha_real_dev) VALUES(
	2,
	'3333333-3',
	'31-01-2020',
	'07-02-2020',
	'12-02-2020'
);

-- Tabla autorlibro

INSERT INTO autorlibro(id_libro, cod_autor) VALUES(
	1,
	3
);

INSERT INTO autorlibro(id_libro, cod_autor) VALUES(
	1,
	4
);

INSERT INTO autorlibro(id_libro, cod_autor) VALUES(
	2,
	1
);

INSERT INTO autorlibro(id_libro, cod_autor) VALUES(
	3,
	2
);

INSERT INTO autorlibro(id_libro, cod_autor) VALUES(
	4,
	5
);

-- 3. Realizar  las siguientes consultas:
-- a. Mostrar todos los libros que posean menos de 300 páginas 

SELECT * FROM libro WHERE n_paginas < 300;

-- b. Mostrar todos los autores que hayan  nacido después del 01-01-1970

SELECT * FROM  autor WHERE fecha_nacimiento > 1970;

-- c. ¿Cuál es el libro  más solicitado?

-- d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.
