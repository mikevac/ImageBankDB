CREATE SCHEMA ibank AUTHORIZATION ibankadmin;

GRANT ALL ON SCHEMA ibank TO ibankadmin;
GRANT USAGE ON SCHEMA ibank to ibankuser;

#------------------------------------

CREATE SEQUENCE ibank.user_id_seq START 1;

CREATE TABLE ibank.user
(
	user_id				integer 	 not null default nextval('ibank.user_id_seq'),
	handle              varchar(200) not null,
	first_name			varchar(100) not null,
	last_name 			varchar(100) not null,
	email_address 		varchar(500) not null,
	date_established    date 		 not null,
	password            varchar(100) not null,
	active				boolean		 not null default false,
	deleted				boolean		 not null default true,
	time_zone           varchar(3)   not null,
	primary key(user_id)
);

ALTER SEQUENCE ibank.user_id_seq OWNED BY ibank.user.user_id;

CREATE INDEX username_idx ON ibank.user (last_name, first_name);

#------------------------------------

CREATE SEQUENCE IBANK.ROLE_ID_SEQ START 1;

CREATE TABLE IBANK.ROLE
(
	USER_ROLE_ID   		integer		 not null default nextval('IBANK.ROLE_ID_SEQ'),
	USER_ID				integer 	 not null references ibank.user(user_id),
	ROLE                varchar(50)  not null,
	EXPIRATION          timestamp    NULL,
	PRIMARY KEY(privilage_id)
);

ALTER SEQUENCE ibank.privilate_id_seq OWNED BY ibank.privilage.privilage_id;

#------------------------------------

CREATE SEQUENCE ibank.album_id_seq START 1;

CREATE TABLE ibank.album 
(
	album_id			integer		 not null default nextvalu('ibank.album_id_seq'),
	owner_id			integer      not null REFERENCES ibank.user(user_id),
	name				varchar(200) not null,
	description			varchar(500) null,
	primary key(album_id)
);

CREATE INDEX album_name_idx on ibank.album


#------------------------------------

CREATE SEQUENCE ibank.album_id_seq START 1;

CREATE TABLE ibank.album 
(
	album_id			integer		 not null default nextvalu('ibank.album_id_seq'),
	owner_id			integer      not null REFERENCES ibank.user(user_id),
	name				varchar(200) not null,
	description			varchar(500) null,
	primary key(album_id)
);

#------------------------------------

CREATE SEQUENCE ibank.tag_id_seq START 1;

CREATE TABLE ibank.tag 
(
	tag_id				integer		 not null default nextvalu('ibank.tag_id_seq'),
	owner_id			integer      not null REFERENCES ibank.user(user_id),
	tag					varchar(200) not null,
	primary key(tag_id)
);

#------------------------------------

CREATE SEQUENCE ibank.doc_type_id_seq START 1;

CREATE TABLE ibank.doc_type 
(
	doc_type_id			integer		 not null default nextvalu('ibank.doc_type_id_seq'),
	owner_id			integer      not null REFERENCES ibank.user(user_id),
	doc_type 			varchar(200) not null,
	file_ext_default	varchar(10)  not null,
	primary key(doc_type_id)
);

#------------------------------------

CREATE SEQUENCE ibank.doc_id_seq START 1;

CREATE TABLE ibank.doc 
(
	doc_id				integer		 not null default nextvalu('ibank.doc_id_seq'),
	owner_id			integer      not null REFERENCES ibank.user(user_id),
	file_name 			varchar(200) not null,
	primary key(doc_id)
);

#------------------------------------

CREATE SEQUENCE ibank.doc_2_album_id_seq START 1;

CREATE TABLE ibank.doc_2_album 
(
	doc_2_album_id		integer		 not null default nextvalu('ibank.doc_2_album_id_seq'),
	doc_id	 			integer		 not null REFERENCES ibank.doc(doc_id),
	album_id			integer		 not null REFERENCES ibank.album(album_id)
	primary key(doc_2_album_id)
);


#------------------------------------

CREATE SEQUENCE ibank.doc_2_tag_id_seq START 1;

CREATE TABLE ibank.doc_2_tag 
(
	doc_2_tag_id		integer		 not null default nextvalu('ibank.doc_2_tag_id_seq'),
	doc_id	 			integer		 not null REFERENCES ibank.doc(doc_id),
	tag_id				integer		 not null REFERENCES ibank.tag(tag_id)
	primary key(doc_2_tag_id)
);


