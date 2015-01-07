# Create a table for majors, extra insert to populate it
# elliot.voris.me

create table tbl_major
(
major_id   smallint    unsigned not null auto_increment comment 'PK: Unique major ID',
degree_id  smallint    unsigned not null comment 'FK: Unique Degree ID',
major_name varchar(42) not null comment 'Major name with first letters capital',
major_abbr varchar(25)  comment 'Optional major abbreviation',

primary key (major_id)
)
;

insert into tbl_major
values
(NULL, 1, 'General Studies', 'gen_studies'),
(NULL, 1, 'Preaching Ministry', 'preach_min'),
(NULL, 1, 'Intercultural & Urban Missions', 'inter_urban_missions'),
(NULL, 1, 'Biblical Studies (AIM)', 'aim_bib_studies'),
(NULL, 1, 'Undecided', 'undecided'),
(NULL, 2, 'Children''s Ministry', 'child_min'),
(NULL, 2, 'Student Ministry', 'stu_min'),
(NULL, 2, 'Preaching Ministry', 'preach_min'),
(NULL, 2, 'Christian Ministry', 'christian_min'),
(NULL, 2, 'Music & Worship Ministry', 'music_worsh_min'),
(NULL, 2, 'Discipleship & Involvement Ministry', 'dis_inv_min'),
(NULL, 2, 'Behavioral Ministry (Pre-Counseling)', 'behav_min'),
(NULL, 2, 'Christian Ministry (AIM)', 'aim_christian_min'),
(NULL, 2, 'Undecided', 'undecided'),
(NULL, 3, 'Bible Knowledge (AIM)', 'aim_bib_know'),
(NULL, 3, 'Church Leaders (AIM)', 'aim_church_leaders'),
(NULL, 3, 'Bible & Ministry (DAY)', 'day_bib_min'), 
(NULL, 3, 'TESOL', 'tesol')
;