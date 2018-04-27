CREATE DATABASE IF NOT EXISTS `phase8.db`;

create table rashis (
	id int primary key not null,
	name varchar not null,
	weight int not null
);

create table devas (
	name varchar not null,
	first_rashi int not null references rashi(id),
	second_rashi int not null references rashi(id)
);

select name,(select weight from rashi where id=first_rashi),(select weight from rashi where id=second_rashi) from devas
