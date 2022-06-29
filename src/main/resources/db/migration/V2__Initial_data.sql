--tables
CREATE TABLE cautonoma (
	cautonoma_id int8 NOT NULL,
	nombre varchar(255) NOT NULL,
	CONSTRAINT cautonoma_pkey PRIMARY KEY (cautonoma_id)
);

CREATE TABLE imagen (
	imagen_id int8 NOT NULL,
	url varchar(255) NULL,
	CONSTRAINT imagen_pkey PRIMARY KEY (imagen_id)
);

CREATE TABLE provincia (
	provincia_id int8 NOT NULL,
	nombre varchar(255) NOT NULL,
	cautonoma_id int8 NOT NULL,
	CONSTRAINT provincia_pkey PRIMARY KEY (provincia_id),
	CONSTRAINT fk_provincia_cautonoma FOREIGN KEY (cautonoma_id) REFERENCES cautonoma(cautonoma_id)
);

CREATE TABLE pueblo (
	pueblo_id int8 NOT NULL,
	descripcion text NULL,
	nombre varchar(255) NOT NULL,
	provincia_id int8 NOT NULL,
	CONSTRAINT pueblo_pkey PRIMARY KEY (pueblo_id),
	CONSTRAINT fk_pueblo_provincia FOREIGN KEY (provincia_id) REFERENCES provincia(provincia_id)
);

CREATE TABLE pueblo_imagen (
	pueblo_id int8 NOT NULL,
	imagen_id int8 NOT NULL,
	CONSTRAINT pueblo_imagen_pkey PRIMARY KEY (pueblo_id, imagen_id),
	CONSTRAINT fk_pueblo_imagen_imagen FOREIGN KEY (imagen_id) REFERENCES imagen(imagen_id),
	CONSTRAINT fk_pueblo_imagen_pueblo FOREIGN KEY (pueblo_id) REFERENCES pueblo(pueblo_id)
);

CREATE TABLE fiesta (
	fiesta_id int8 NOT NULL,
	descripcion text NULL,
	fin date NULL,
	inicio date NULL,
	nombre varchar(255) NOT NULL,
	pueblo_id int8 NOT NULL,
	CONSTRAINT fiesta_pkey PRIMARY KEY (fiesta_id),
	CONSTRAINT fk_fiesta_pueblo FOREIGN KEY (pueblo_id) REFERENCES pueblo(pueblo_id)
);

CREATE TABLE fiesta_imagen (
	fiesta_id int8 NOT NULL,
	imagen_id int8 NOT NULL,
	CONSTRAINT fiesta_imagen_pkey PRIMARY KEY (imagen_id, fiesta_id),
	CONSTRAINT fk_fiesta_imagen_imagen FOREIGN KEY (imagen_id) REFERENCES imagen(imagen_id),
	CONSTRAINT fk_fiesta_imagen_fiesta FOREIGN KEY (fiesta_id) REFERENCES fiesta(fiesta_id)
);

--sequences
create sequence sq_provincia increment 1 start 1;
create sequence sq_cautonoma increment 1 start 1;
create sequence sq_fiesta increment 1 start 1;
create sequence sq_imagen increment 1 start 1;
create sequence sq_pueblo increment 1 start 1;

--cautonomas
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Andalucía');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Aragón');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Asturias');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Baleares');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Canarias');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Cantabria');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Castilla-La Mancha');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Castilla y León');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'), 'Cataluña');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Comunidad Valenciana');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Extremadura');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Galicia');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Madrid');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Murcia');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'Navarra');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'País Vasco');
insert into cautonoma (cautonoma_id, nombre) values (nextval('sq_cautonoma'),  'La Rioja');

--provincias
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Almería', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Cádiz', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Córdoba', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Granada', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Huelva', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Jaén', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Málaga', 1);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Sevilla', 1);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'),'Huesca', 2);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Teruel', 2);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Zaragoza', 2);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Oviedo', 3);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Palma de Mallorca', 4);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Santa Cruz de Tenerife', 5);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Las Palmas de Gran Canaria', 5);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Santander', 6);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Albacete', 7);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Ciudad Real', 7);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Cuenca', 7);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Guadalajara', 7);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Toledo', 7);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Ávila', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Burgos', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'León', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Salamanca', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Segovia', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Soria', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Valladolid', 8);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Zamora', 8);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Barcelona', 9);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Gerona', 9);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Lérida', 9);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Tarragona', 9);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Alicante', 10);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Castellón de la Plana', 10);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Valencia', 10);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Badajoz', 11);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Cáceres', 11);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'La Coruña', 12);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Lugo', 12);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Orense', 12);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Pontevedra', 12);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Madrid', 13);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Murcia', 14);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Pamplona', 15);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Bilbao', 16);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'San Sebastián', 16);
insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Vitoria', 16);

insert into provincia (provincia_id, nombre, cautonoma_id) values (nextval('sq_provincia'), 'Logroño', 17);

-- Jalance
insert into pueblo (pueblo_id, nombre, descripcion, provincia_id)
values
(nextval('sq_pueblo'), 'Jalance', 'Integrado en la comarca de Valle de Ayora, se sitúa a 102 kilómetros de la capital valenciana. El término municipal está atravesado por la carretera nacional  N-330  entre los pK 129 y 134. El pueblo está situado en el centro del Valle de Ayora, en el lugar donde se juntan los ríos Júcar y Jarafuel. Todo el terreno se ve quebrado por cerros y muelas de una altura media entre 600 y 900 metros. Destacan el vértice geodésico de Villar Agudo (895 metros), el pico de la Muela (982 metros), el pico de la Sierrecilla (911 metros) y la loma de la Correa (902 metros). Entre estos relieves, el Júcar entra en la Comunidad Valenciana y excava una inaccesible garganta entre los Chorros de la Jávea y la peña del Buitre, la cual se prolonga aguas arriba hacia Alcalá del Júcar, y se ensancha hacia el este por la confluencia del barranco del Agua y del río Jarafuel. En esa zona abrupta se encuentra la Cueva de Don Juan. Por el este se produce el descenso brusco de la muela de Jalance (Sierra de Alcolá), a 779 metros, hacia la rambla de Sácaras, a 450 metros. La altitud oscila entre los 982 metros en el pico de la Muela, al suroeste, en la Sierra del Boquerón, y los 340 metros a orillas del río Júcar. El pueblo se alza a 455 metros sobre el nivel del mar.', 36);

insert into fiesta (fiesta_id, nombre, descripcion, pueblo_id, inicio, fin) values
(nextval('sq_fiesta'), 'San Blas', 'Las fiestas más tradicionales son las dedicadas al patrón del Pueblo, San Blas, el 3 de febrero con unos curiosos cánticos entonados en las frías madrugadas de estos días, conocidos como "las coplillas". Son típicos estos días los "pasteles de San Blas" y el "Pan Bendito" que se reparte en la multitudinaria misa que se celebra en honor al santo.También se celebra el día de La Candelaria y el de la Divina Aurora. Comidas para 1.000 personas estos días en el parque, teatros, pasacalles y bailes completan estas entrañable fiestas.', 1, '2022-02-03', '2022-02-05');

insert into fiesta (fiesta_id, nombre, descripcion, pueblo_id, inicio, fin) values
(nextval('sq_fiesta'), 'Virgen de la Asunción', 'Durante el verano (alrededor del 15 de agosto) están las fiestas en honor a la Asunción de la Virgen; que son más bullangueras y trasnochadoras, ya que las temperaturas de esa época del año lo permiten.Espectáculos de calle, teatros, desfile de carrozas, desfile de moros y cristianos, pasacalles, verbenas, etc. en un ambiente de lo más agradable.', 1, '2022-08-10', '2022-08-15');

insert into fiesta (fiesta_id, nombre, descripcion, pueblo_id, inicio, fin) values
(nextval('sq_fiesta'), 'San Miguel', 'También celebramos el día de San Miguel el 29 de septiembre, Patrón de la parroquia. La celebración suele ir acompañada del reparto de unos rollos dulces y una gran comida popular para todo el pueblo.', 1, '2022-09-29', null);

insert into fiesta (fiesta_id, nombre, descripcion, pueblo_id, inicio, fin) values
(nextval('sq_fiesta'), 'Dia de los Locos', 'La fiesta más popular en toda la comarca, por su originalidad, es la celebrada todos los 28 de diciembre, Día de los Locos. Tenemos constancia escrita de su existencia a principios del siglo XVIII, a través de los libros parroquiales. Desde entonces se viene celebrando. Esta fiesta consiste en que los quintos, los jóvenes que cumplen 18 años (y que años atrás estaban en edad de cumplir el servicio militar), este día toman el poder del pueblo, el civil y el religioso. Exigen la vara de mando al alcalde y cuelgan al cura. A partir de ahí se dedican a gastar bromas a la población y visitantes y a redactar curiosos bandos. La fiesta culmina con el baile de los locos, donde por una módica cantidad cualquier cosa es posible.', 1, '2022-12-28', null);