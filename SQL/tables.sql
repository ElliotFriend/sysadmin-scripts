## CREATE ALL THE TABLES FOR THE ONLINE APPLICATION
## elliot.voris.me

# Create a table for users

BEGIN;
create table app_user_info
	(
		user_id    smallint    unsigned not null auto_increment comment 'PK: Unique User ID',
		first_name varchar(255) comment 'First name with first letter capital',
		last_name  varchar(255) comment 'Last name with first letter capital',
		email      varchar(255) comment 'email address used to sign in',
		password   varchar(64) comment 'hashed and salted password',
		confirmed  tinyint(1) Default '0' comment 'has the email address been confirmed?',

		primary key (user_id)
	)
;



create table app_personal_info
	(
		personal_id smallint unsigned not null auto_increment comment 'PK: Unique Personal Information ID',
		app_id smallint unsigned not null comment 'FK: unique application id from tbl:app_application_info',
		enrollment_term smallint unsigned not null comment 'FK: Unique term ID from tbl:tbl_term',
		enrollment_year varchar(4) comment 'Enrollment year for students first term',
		social_security varchar(11) comment 'Social Security Number, separated by dashes (-)',
		gender enum('male','female') comment 'Gender of applicant',
		first_name varchar(255) comment 'First name with first letter capital',
		middle_name varchar(255) comment 'middle name with first letter capital',
		last_name varchar(255) comment 'Last name with first letter capital',
		address varchar(30) comment 'Street address of the applicant',
		city varchar(30) comment 'City of the applicant',
		state smallint unsigned comment 'FK: Unique State id from tbl:tbl_state',
		zip varchar(10) comment 'zip code of applicant (room for "-1234")',
		phone1 varchar(20) comment 'Phone number of applicant',
		phone1_type varchar(10) comment 'Description of phone1',
		can_text1 enum('yes','no') comment 'Can we text phone1?',
		phone2 varchar(20) comment 'phone number of applicant',
		phone2_type varchar(10) comment 'Description of phone2',
		can_text2 enum('yes','no') comment 'Can we text phone2?',
		email varchar(255) comment 'Applicant email address',
		birthday varchar(10) comment 'Birthday in the following format: MM/DD/YYYY',
		marital_status enum('never_married','married','widowed','divorced','separated') comment 'Marital status of applicant',
		is_citizen enum('yes','no') comment 'US Citizenship?',
		complete tinyint(1) Default '0' comment 'Is this section complete? 0:no 1:yes',

		primary key (personal_id)
	)
;

create table app_education_info
	(
		education_id smallint unsigned not null auto_increment comment 'PK: Unique Education Information ID',
		app_id smallint not	null comment 'FK: unique application id from tbl:app_application_info',
		hs_name varchar(30),
		hs_city varchar(30),
		hs_state smallint comment 'FK: unique state id from tbl:tbl_state',
		hs_diploma enum('yes','no') comment 'Does the student have a high school diploma',
		hs_grad_date ,
		hs_gpa,
		ged,
		ged_date,
		act,
		act_score,
		act_date,
		sat,
		sat_score,
		sat_date,
		c1_name,
		c1_dates,
		c1_hours,
		c1_gpa,
		c2_name,
		c2_dates,
		c2_hours,
		c2_gpa,
		c3_name,
		c3_dates,
		c3_hours,
		c3_gpa,

		primary key (education_id)
	)
;

create table app_enrollment_info
	(
		enrollment_id smallint unsigned not null auto_increment comment 'PK: Unique Enrollment Information ID',
		app_id smallint not null comment 'FK: unique application id from tbl:app_application_info',
		course_load enum('full_time','part_time','jesus_101') comment 'What level of course work does the applicant want to complete',
		program enum('day','aim') comment 'Does the applicant wish to be an aim or day student?',
		incoming_status enum('freshman','transfer','re_admit') comment 'What is the status of the applicant',
		readmit_date varchar(7) comment 'Date of last attendance (MM/YYYY)',
		intended_degree smallint not null comment 'FK: unique degree id from tbl:tbl_degree',
		intended_major smallint not null comment 'FK: unique major id from tbl:tbl_major',
		enrollment_status smallint not null comment 'FK: unique enrollment status id from tbl:tbl_enrollment',

		primary key (enrollment_id)
	)
;

create table app_church_info
	(
		church_id,
		app_id,
		current_church,
		religion,
		church_attendance,
		attendance_length,

		primary key (church_id)
	)
;

create table app_housing_info
	(
		housing_id,
		app_id,
		housing,
		res_hall,
		family,
		engaged,
		wedding_date,

		primary key (housing_id)
	)
;

create table app_financial_info
	(
		financial_id,
		app_id,
		federal_aid,
		veterans_benefits,

		primary key (financial_id)
	)
;

create table app_other_info
	(
		other_id,
		app_id,
		first_heard,
		relative_name,
		relationship,
		athletics,
		suspended,
		convicted,
		contact_reference,

		primary key (other_id)
	)
;

create table app_optional_info
	(
		optional_id,
		app_id,
		citizenship,
		ethnicity,
		first_language,
		second_language,
		disability,
		diagnosis,

		primary key (optional_id)
	)
;

create table app_map_info
	(
		map_id,
		app_id,
		guidelines,

		primary key (map_id)
	)
;

create table app_essay_info
	(
		essay_id,
		app_id,
		essay_one,
		essay_two,
		essay_three,
		lifestyle_expectations,
		violation_action,

		primary key (essay_id)
	)
;

ROLLBACK;