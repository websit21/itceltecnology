CREATE DATABASE itceltecnology;
USE itceltecnology;

CREATE TABLE usuario(
id                  int(255) auto_increment not null,
nombre_usuario      varchar(100) not null,
apellido_usuario    varchar(255),
email               varchar(255) not null,
contraseña          varchar(255) not null,
rol_usuario         varchar(20),
imagen_usuario      varchar(255),
CONSTRAINT pk_usuario PRIMARY KEY(id),
CONSTRAINT uq_email UNIQUE(email)
)ENGINE=InnoDb; 

INSERT INTO usuario VALUES(NULL, 'Didier', 'Ramirez', 'didier.ron07@gmail.com', 'didier21', 'admin', null);


CREATE TABLE categoria(
id                  int(255) auto_increment not null,
nombre_categoria    varchar(100) not null,
CONSTRAINT pk_usuario PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO categoria VALUES(null, smartwach);  --Insercion de datos  a categoria

CREATE TABLE producto (
id                  int(255) auto_increment not null,
categoria_id        int(255) not null,
nombre_producto     varchar(100) not null,
descripcion         text,
precio_producto     float(100,2) not null,
stock_producto      int(255) not null,
oferta_producto     varchar(10),
fecha_ingreso       date not null,
imagen_producto     varchar(255),
CONSTRAINT pk_categoria PRIMARY KEY(id),
CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id)
)ENGINE=InnoDb;


CREATE TABLE pedido(
id              int(255) auto_increment not null,
usuario_id      int(255) not null,
cliente_id      int(255) not null,
departamento    varchar(100)not null,
municipio       varchar(255) not null,
direccion       varchar(255) not null,
costo           float(200,2) not null,
estado          varchar(20) not null,
fecha           date,
hora            time,
CONSTRAINT pk_pedido PRIMARY KEY (id),
CONSTRAINT fk_pedido_usuario FOREIGN KEY(usuario_id) REFERENCES usuario(id),
CONSTRAINT fk_cliente_pedido FOREIGN KEY(cliente_id) REFERENCES cliente(id)
)ENGINE=InnoDb;


CREATE TABLE cliente(
id                  int(255) auto_increment not null,
nombre              varchar(255) not null,
apellido            varchar(255) not null,
telefono            varchar(100) not null,
nombre_quien_recibe varchar(255),
CONSTRAINT pk_cliente PRIMARY KEY(id)
)ENGINE=InnoDb;


CREATE TABLE linea_pedido(
id                  int(255) auto_increment not null,
pedido_id           int(255) not null,
producto_id         int(255) not null,
unidades            int(255) not null,
CONSTRAINT pk_linea_pedidio PRIMARY KEY(id),
CONSTRAINT fk_linea_pedido FOREIGN KEY(pedido_id) REFERENCES pedido(id),
CONSTRAINT fk_linea_producto FOREIGN KEY(producto_id) REFERENCES producto(id)
)ENGINE=InnoDb;