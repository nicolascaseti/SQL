
CREATE SCHEMA clinica_medica;


USE clinica_medica;


CREATE TABLE obras_sociales (
id_obrasocial INT NOT NULL AUTO_INCREMENT,
cuit VARCHAR(20) NOT NULL,
razon_social VARCHAR(50) NOT NULL,
direccion VARCHAR(40) NULL,
telefono VARCHAR(20) NULL,
email VARCHAR(50) NULL,
PRIMARY KEY (id_obrasocial));


CREATE TABLE pacientes (
id_paciente INT NOT NULL AUTO_INCREMENT,
id_obrasocial INT NOT NULL,
dni VARCHAR(20) NOT NULL,
nombre VARCHAR(40) NOT NULL,
apellido VARCHAR(40) NOT NULL,
edad VARCHAR(10) NULL,
PRIMARY KEY (id_paciente),
CONSTRAINT pacientes_obras_sociales 
FOREIGN KEY (id_obrasocial) 
REFERENCES obras_sociales(id_obrasocial));

  
CREATE TABLE horarios (
id_horario INT NOT NULL AUTO_INCREMENT,
hora_inicio VARCHAR(20) NOT NULL,
hora_fin VARCHAR(20) NOT NULL,
PRIMARY KEY (id_horario));


CREATE TABLE especialidades (
id_especialidad INT NOT NULL AUTO_INCREMENT,
nombre_especialidad VARCHAR(50) NOT NULL,
PRIMARY KEY (id_especialidad));


CREATE TABLE dias_de_trabajo (
id_medico INT NOT NULL, 
id_horario INT NOT NULL, 
dia VARCHAR(20) NOT NULL,
PRIMARY KEY (id_medico, id_horario));


CREATE TABLE medicamentos (
id_medicamento INT NOT NULL AUTO_INCREMENT,
nombre_comercial VARCHAR(50) NOT NULL,
laboratorio VARCHAR(50) NULL,
via VARCHAR(50) NULL,
PRIMARY KEY (id_medicamento));


CREATE TABLE receta (
id_consulta INT NOT NULL,
id_medicamento INT NOT NULL,
fecha DATE NOT NULL,
nro_orden VARCHAR(20) NOT NULL,
vencimiento_orden DATE NOT NULL,
PRIMARY KEY (id_consulta, id_medicamento));


CREATE TABLE medicos (
id_medico INT NOT NULL AUTO_INCREMENT,
matricula VARCHAR (20) NOT NULL,
nombre VARCHAR (40) NOT NULL,
apellido VARCHAR(40) NOT NULL,
id_especialidad INT NOT NULL,
PRIMARY KEY (id_medico),
CONSTRAINT medicos_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidades (id_especialidad));


CREATE TABLE consultas_medicas (
id_consulta INT NOT NULL AUTO_INCREMENT,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
consultorio VARCHAR(10) NOT NULL,
fecha DATE NOT NULL,
horario VARCHAR(20) NOT NULL,
PRIMARY KEY (id_consulta),
CONSTRAINT consultas_medicas_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes (id_paciente),
CONSTRAINT consultas_medicas_medico FOREIGN KEY (id_medico) REFERENCES medicos (id_medico));


