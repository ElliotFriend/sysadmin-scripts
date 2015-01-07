# Create a table for degrees, extra insert to populate it
# elliot.voris.me

create table tbl_degree
(
degree_id   smallint    unsigned not null auto_increment comment 'PK: Unique Degree ID',
degree_name varchar(56) not null comment 'Degree name with first letter capital',
degree_abbr varchar(11) comment 'Optional degree abbreviation',

primary key (degree_id)
)
;

insert into tbl_degree
	values
	(NULL, 'Associate of Arts or Associate of Applied Science Degree', 'associate'),
	(NULL, 'Bachelor of Arts or Bachelor of Science Degree', 'bachelor'),
	(NULL, 'Certificate', 'certificate')
	;