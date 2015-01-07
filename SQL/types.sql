# Create a table for application types, extra insert to populate it
# elliot.voris.me

create table tbl_app_type
(
type_id   smallint    unsigned not null auto_increment comment 'PK: Unique type ID',
type_name varchar(13) not null comment 'Type name with first letter capital',
type_abbr varchar(13) not null comment 'Type abbreviate to help make things simple',

primary key (type_id)
)
;

insert into tbl_app_type
	values
		(NULL, 'Day/AIM', 'day_aim'),
		(NULL, 'Certificate', 'cert'),
		(NULL, 'Jesus: 101', 'jesus_101'),
		(NULL, 'Urshan Co-Op' ,'urshan'),
		(NULL, 'International', 'international')
	;