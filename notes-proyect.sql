-- Con este Script se van a formar las tablas  y sus respectivos datos para las pruebas.
-- En primer lugar va a querer volcar los datos en una base existente con el nombre 'project_notes'.
-- De no poder ser asi , va a crearla.

DROP DATABASE IF EXISTS project_notes;
CREATE DATABASE project_notes;
USE project_notes;

CREATE TABLE `user` (
   `id` INT AUTO_INCREMENT,
   `name` VARCHAR(50) NOT NULL,
   `mail` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`id`)
);
insert into user (id, name, mail) values (1,'Lazaro', 'lplampeyn0@wunderground.com');
insert into user (id, name, mail) values (2,'Leguizamon', 'csmaile1@mayoclinic.com');
insert into user (id, name, mail) values (3,'Carlos', 'ckearley2@howstuffworks.com');
insert into user (id, name, mail) values (4,'Ignacio', 'icastanos3@w3.org');
insert into user (id, name, mail) values (5,'Pablo', 'csynder4@wordpress.com');
insert into user (id, name, mail) values (6,'Sabrina', 'rsharples5@digg.com');
insert into user (id, name, mail) values (7,'Julieta', 'dbembrick6@parallels.com');
insert into user (id, name, mail) values (8,'Emma', 'ewoolbrook7@imgur.com');
insert into user (id, name, mail) values (9,'Rodrgio', 'kmcalees8@go.com');
insert into user (id, name, mail) values (10,'Ambrosio', 'awillgrass9@java.com');

CREATE TABLE `category` (
   `id` INT AUTO_INCREMENT,
   `name` VARCHAR(40),
   PRIMARY KEY (`id`)
);
insert into category (id,name) values (1,'Estudios');
insert into category (id,name) values (2,'Recetas');
insert into category (id,name) values (3,'Rutinas');
insert into category (id,name) values (4,'Supermercado');
insert into category (id,name) values (5,'Recordatorios');
insert into category (id,name) values (6,'Musica');
insert into category (id,name) values (7,'Libros');
insert into category (id,name) values (8,'Pelis');
insert into category (id,name) values (9,'Salud');
insert into category (id,name) values (10,'Varios');

CREATE TABLE `notes_category` (
   `id` INT AUTO_INCREMENT,
   `notes_id` INT,
   `cat_id` INT,
   PRIMARY KEY (`id`)
);
insert into notes_category (notes_id, cat_id) values (1,2);
insert into notes_category (notes_id, cat_id) values (5,3);
insert into notes_category (notes_id, cat_id) values (4,6);
insert into notes_category (notes_id, cat_id) values (2,7);
insert into notes_category (notes_id, cat_id) values (4,7);
insert into notes_category (notes_id, cat_id) values (3,9);
insert into notes_category (notes_id, cat_id) values (7,10);
insert into notes_category (notes_id, cat_id) values (10,4);
insert into notes_category (notes_id, cat_id) values (9,1);



CREATE TABLE `notes` (
   `id` INT AUTO_INCREMENT,
   `user_id` INT,
   `cat_id` INT DEFAULT NULL,
   `title` VARCHAR(50),
   `date_create` DATE,
   `last_update` DATE DEFAULT NULL,
   `destroy` TINYINT DEFAULT 0,
   `description` TEXT,
   PRIMARY KEY (`id`)
);
insert into notes (id, user_id,title, date_create, last_update, destroy,description) values (1,5, 'Terminar Proyecto individual', '2021-03-14', '2021-02-12', 1, 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (2,3, 'Completar tarea Trello', '2021-07-25', '2021-09-14', 1, 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (3,9, 'Vacunar a Mora 15/9', '2021-02-03', '2021-04-02', 1, 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (4,9, 'Pastel de papa', '2020-11-19', '2021-06-19', 0, 'metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (5,3, 'Libros para leer', '2021-09-25', '2021-07-18', 1, 'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (6,7, 'Recordatorios varios', '2020-11-08', '2021-08-26', 1, 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (7,7, 'Lista de supermercado', '2021-08-01', '2021-09-27', 0, 'odio porttitor id consequat in consequat ut nulla sed accumsan');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (8,8, 'Pendientes', '2021-06-27', '2021-08-27', 0, 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (9,7, 'mauris vulputate elementum nullam', '2021-02-22', '2021-07-29', 1, 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante');
insert into notes (id, user_id,title, date_create, last_update, destroy, description) values (10,10, 'consequat nulla nisl', '2021-10-03', '2021-08-04', 1, 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in');



ALTER TABLE `notes` ADD CONSTRAINT `FK_3400c17a-f32f-41fd-bf6d-65a4bd1014e4` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`)  ;

ALTER TABLE `notes` ADD CONSTRAINT `FK_fa3850b9-5355-4610-b856-7e25690cd6c5` FOREIGN KEY (`cat_id`) REFERENCES `category`(`id`)  ;

ALTER TABLE `notes_category` ADD CONSTRAINT `FK_20c19954-1272-4a7f-886e-8f44897dabad` FOREIGN KEY (`notes_id`) REFERENCES `notes`(`id`)  ;

ALTER TABLE `notes_category` ADD CONSTRAINT `FK_e011a949-85ec-4d60-b346-a0028e3a4254` FOREIGN KEY (`cat_id`) REFERENCES `category`(`id`)  ;