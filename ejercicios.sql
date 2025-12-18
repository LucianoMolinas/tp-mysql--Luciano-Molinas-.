-- ejercicio 1 

CREATE DATABASE veterinaria_patitas_felices; 

-- ejercicio 2 

use veterinaria_patitas_felices;

CREATE TABLE dueños (
  
id_dueños INT AUTO_INCREMENT PRIMARY KEY , 
nombre VARCHAR (50) NOT NULL ,
apellido VARCHAR (50) NOT NULL , 
telefono VARCHAR (20) NOT NULL , 
direccion VARCHAR (100),
);

-- ejercicio 3

use veterinaria_patitas_felices;

CREATE TABLE mascotas(
id_mascotas INT AUTO_INCREMENT PRIMARY KEY ,
nombre VARCHAR (50) NOT NULL, 
especie VARCHAR (30) NOT NULL, 
fecha_nacimiento DATE,
id_dueño INT , 
FOREIGN KEY (id_dueño) REFERENCES dueños (id_dueños)
);

--ejercicio 4 

use veterinaria_patitas_felices;

CREATE TABLE veterinarios (
id_veterinario INT PRIMARY KEY , AUTO_INCREMENT , 
nombre VARCHAR (50) NOT NULL ,  
apellido VARCHAR (20) NOT NULL , 
matricula VARCHAR (20) NOT NULL, UNIQUE,
especialidad VARCHAR (50) NOT NULL 
);

--ejercicio 5 

use veterinaria_patitas_felices;

CREATE TABLE historial_clinico (
id_historial_clinico INT PRIMARY KEY AUTO_INCREMENT ,
id_mascota INT , 
FOREIGN KEY (id_mascota) REFERENCES macotas (id_mascotas),
id_veterinario INT , 
FOREIGN KEY (id_veterinario) REFERENCES veterinarios (id_veterinario)
fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
descripcion VARCHAR (250) NOT NULL 
);

--ejercicio 6 

INSERT INTO  dueños (nombre, apellido,telefono,direccion) VALUES ("Jorge", "Gomez", "3413459843", "Cerrito 1244");

INSERT INTO dueños (nombre, apellido,telefono,direccion) VALUES ("Martin", "Rojas", "3413659611", "Ocampo 499");

INSERT INTO dueños (nombre, apellido, telefono,direccion) VALUES ("Violeta", "Gutierrez" ,"3413258799", "Alvear 67");

INSERT INTO mascotas (nombre, especie,fecha_nacimiento, id_dueño) VALUES ("Koda","Labrador", "01-12-2020", 1);

INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueño) VALUES ("Coscu","Ovejero Aleman","2022-03-05", 2);

INSERT INTO mascotas (nombre, especie,fecha_nacimiento,id_dueño) VALUES ("Robert", "Chihuahua", "2019-01-13", 3);

INSERT INTO veterinarios (nombre, apellido, matricula,especialidad) VALUES ("Esteban", "Diaz", "1874/9", "cardiologo");

INSERT INTO veterinarios (nombre, apellido, matricula,especialidad) VALUES (" Romina", "Raposo", "2574/2", "dermatologia");

INSERT INTO historial_clinico (id_mascota, id_veterinario, fecha_registro, descripcion) VALUES (2,2, "2025-11-11","Reaccion alergica en la panza por jugar con planta venenosa");

INSERT INTO historial_clinico (id_mascota, id_veterinario, fecha_registro, descripcion) VALUES (3,1, "2025-11-06" ,"Patologia de arritmia bajo grandes exigencias fisicas ");

INSERT INTO historial_clinico (id_mascota, id_veterinario, fecha_registro, descripcion) VALUES (1,2, "2025-06-01", "presencia de granos en la pata tarsera ");

--ejercicio 7 

UPDATE  dueños SET direccion = "España 1224" WHERE id_dueños =2;

UPDATE veterinarios SET especialidad = "nutricion" WHERE  id_veterinario =1 ;

UPDATE historial_clinico SET descrpcion = "dolor en la panza" WHERE id_mascota = 2;

-- ejercicio 8 

DELETE FROM historial_clinico WHERE id_mascotas = (
SELECT id_mascotas
FROM mascotas 
WHERE nombre = "Koda"
);

DELETE FROM mascotas WHERE nombre = "Koda";


-- ejercicio 9 


SELECT m.nombre  , m.especie, d.nombre,  d.apellido , v.nombre , v.apellido,     h.fecha_registro, h.descripcion FROM historial_clinico h
  INNER JOIN 
mascotas m ON h.id_mascota = m.id_mascotas 

INNER JOIN dueños d ON m.id_dueño = d.id_dueños

inner join VETERINARIOS v ON v.id_veterinario = h.id_veterinario;


-- ejercicio 10 

SELECT m.nombre AS "MASCOTA" , m.especie,  CONCAT (d.nombre,' ' ,  d.apellido) AS "DUEÑO" , CONCAT  (v.nombre, ' ' , v.apellido) AS "VETERINARIO",     h.fecha_registro, h.descripcion FROM historial_clinico h
  INNER JOIN 
mascotas m ON h.id_mascota = m.id_mascotas 

INNER JOIN dueños d ON m.id_dueño = d.id_dueños

inner join VETERINARIOS v ON v.id_veterinario = h.id_veterinario

ORDER BY fecha_registro DESC
