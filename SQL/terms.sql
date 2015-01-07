# Create a table for terms, extra insert to populate it
# elliot.voris.me

create table tbl_term
	(
		term_id   smallint    unsigned not null auto_increment comment 'PK: Unique term ID',
		term_name varchar(18) not null comment 'term name with first letters capital',

		primary key (term_id)
	)
;

insert into tbl_term
	values
	(NULL, 'Fall'),
	(NULL, 'Spring'),
	(NULL, 'Summer')
;