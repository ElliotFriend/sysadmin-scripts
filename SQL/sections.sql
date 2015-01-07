# Create a table for application sections, extra insert to populate it
# elliot.voris.me

create table tbl_section
	(
		section_id   smallint    unsigned not null auto_increment comment 'PK: Unique section ID',
		section_name varchar(28) not null comment 'section name with first letters capital',
		section_abbr varchar(16) not null comment 'section name abbreviation',
		section_link varchar(32) not null comment 'link to go to the form to fill out',
		section_description varchar(255) comment 'description to show before the user clicks on the page',
		required_day_aim tinyint(1) not null Default '1' comment 'is this section required for Day/AIM students to fill out; 0:no 1:yes',
		required_cert tinyint(1) not null Default '1' comment 'is this section required for cert students?',
		required_j101 tinyint(1) not null Default '1' comment 'is this section required for Jesus:101 students?',
		required_urshan tinyint(1) not null Default '1' comment 'is this section required for Urshan students?',
		required_international tinyint(1) not null Default '1' comment 'is this section required for international students?',

		primary key (section_id)
	)
;

insert into tbl_section
	(section_id, section_name, section_abbr, section_link, section_description)
	values
	(NULL, 'Personal Information', 'personal_info', 'personal_information.php', 'Give us some personal information, please'),
	(NULL, 'Enrollment Information', 'enrollment_info', 'enrollment_information.php', 'Give us some enrollment information, please'),
	(NULL, 'Educational Information', 'educational_info', 'educational_information.php', 'Give us some educational information, please'),
	(NULL, 'Church Information', 'church_info', 'church_information.php', 'Give us some church information, please'),
	(NULL, 'Essay Information', 'essay_info', 'essay_information.php', 'Write some essays for us, please'),
	(NULL, 'Lifestyle Information', 'lifestyle_info', 'lifestyle_information.php', 'Give us some lifestyle information, please'),
	(NULL, 'Financial Aid Information', 'financial_info', 'financial_aid_information.php', 'Give us some financial aid information, plase'),
	(NULL, 'Ministry Advancement Program', 'map_info', 'ministry_advancement_program.php', 'Give us some MAP information, please'),
	(NULL, 'Other Information', 'other_info', 'other_information.php', 'Give us some other information, plase'),
	(NULL, 'Optional Information', 'optional_info', 'optional_information.php', 'Give us some optional information, if you feel like it'),
	(NULL, 'Housing Information', 'housing_info', 'housing_information.php', 'Give us some housing information, please')
;