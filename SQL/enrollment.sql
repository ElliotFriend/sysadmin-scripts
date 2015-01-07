# Create a table for enrollment status, extra insert to populate it
# elliot.voris.me

create table tbl_enrollment
(
enrollment_id   smallint    unsigned not null auto_increment comment 'PK: Unique enrollment ID',
enrollment_name varchar(18) not null comment 'Enrollment name with first letters capital',

primary key (enrollment_id)
)
;

insert into tbl_enrollment
values
(NULL, 'Non-Degree Seeking'),
(NULL, '2 + 2 Program'),
(NULL, 'Associate Degree'),
(NULL, 'Bachelor Degree'),
(NULL, 'Audit')
;