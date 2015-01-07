# Create a table for ethnicity, extra insert to populate it
# elliot.voris.me

create table tbl_ethnicity
(
ethnicity_id   smallint unsigned not null auto_increment comment 'PK: Unique ethnicity ID',
ethnicity_name varchar(30) not null comment 'Ethnicity name with first letter capital',

primary key (ethnicity_id)
)
;

insert into tbl_ethnicity
	values
	(NULL, 'American Indian/Alaskan Native'),
	(NULL, 'Asian or Pacific Islander'),
	(NULL, 'Black or African American'),
	(NULL, 'Caucasian'),
	(NULL, 'Hispanic'),
	(NULL, 'Other')
	;