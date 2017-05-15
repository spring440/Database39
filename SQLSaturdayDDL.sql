USE s17guest39
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'state_table')
	DROP TABLE state_table;

--State_table/Territory Table
CREATE TABLE state_table (
	state_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	state_abbreviation char(2) ,
	state_name char(17) NOT NULL
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'country')
	DROP TABLE country;

--Country table
CREATE TABLE country(
	country_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	country_code char(2) NOT NULL,
	country_name nvarchar(100) NOT NULL
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'address_table')
	DROP TABLE address_table;

--address_table Table
CREATE TABLE address_table (
	address_id int PRIMARY KEY IDENTITY NOT NULL,
	street nvarchar(100) NOT NULL,
	city nvarchar(125) NOT NULL,
	state_id tinyint,
	zip char(13),
	country tinyint

	FOREIGN KEY(state_id) REFERENCES state_table(state_id),
	FOREIGN KEY(country) REFERENCES country(country_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'room')
	DROP TABLE room;

--Rooms table
CREATE TABLE room (
	room_id int PRIMARY KEY IDENTITY NOT NULL,
    room_name nvarchar(100) NOT NULL,
	address_id int NOT NULL, 
	max_seats tinyint NOT NULL

	FOREIGN KEY(address_id) REFERENCES address_table(address_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'person')
	DROP TABLE person;

--Person table
CREATE TABLE person (
	person_id int PRIMARY KEY IDENTITY NOT NULL,
	first_name nvarchar(75) NOT NULL,
	middle_name nvarchar(75),
	last_name nvarchar(75) NOT NULL,
	address_id int NOT NULL,
	person_phone char(13),
	person_email nvarchar(254) NOT NULL

	FOREIGN KEY(address_id) REFERENCES address_table(address_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'sponsor_level')
	DROP TABLE sponsor_level;

--Sponsor level table
CREATE TABLE sponsor_level(
	sponsor_level_id tinyint IDENTITY PRIMARY KEY NOT NULL,
	sponsor_level_name nvarchar(20) UNIQUE NOT NULL
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'sponsor')
	DROP TABLE sponsor;

--Sponsor table
CREATE TABLE sponsor(
	sponsor_id int PRIMARY KEY IDENTITY NOT NULL,
	sponsor_name nvarchar(200) NOT NULL,
	address_id int,
	sponsor_level tinyint NOT NULL,
	sponsor_phone char(13),
	sponsor_email nvarchar(254)

	FOREIGN KEY(address_id) REFERENCES address_table(address_id),
	FOREIGN KEY(sponsor_level) REFERENCES sponsor_level(sponsor_level_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'track')
	DROP TABLE track;

--Track table
CREATE TABLE track (
	track_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	track_name nvarchar(200) UNIQUE NOT NULL,
	track_desc nvarchar(500)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'presentation_level')
	DROP TABLE presentation_level;

--Presentation level table
CREATE TABLE presentation_level (
	level_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	level_type nvarchar(50) UNIQUE NOT NULL
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'presentation')
	DROP TABLE presentation;

--Presentation table
CREATE TABLE presentation(
	presentation_id int PRIMARY KEY IDENTITY NOT NULL,
	presentation_name nvarchar(200) NOT NULL,
	presentation_level tinyint NOT NULL,
	presentation_track tinyint,
	presentation_room int,
	presentation_desc nvarchar(500),

	FOREIGN KEY(presentation_level) REFERENCES presentation_level(level_id),
	FOREIGN KEY(presentation_track) REFERENCES track(track_id),
	FOREIGN KEY(presentation_room) REFERENCES room(room_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'professors_presentation')
	DROP TABLE professors_presentation;

--Presentation table for professors data
CREATE TABLE professors_presentation(
	presentation_id int PRIMARY KEY IDENTITY NOT NULL,
	presentation_title nvarchar(200) NOT NULL,
	presentation_level nvarchar(50),
	presentation_speaker nvarchar(175) NOT NULL,
	presentation_event nvarchar(200)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'presentation_presenter')
	DROP TABLE presentation_presenter;

--Presentation presters table
CREATE TABLE presentation_presenter(
	presentation_id int NOT NULL,
	person_id int NOT NULL,
	grade int DEFAULT 0 NOT NULL

	PRIMARY KEY(presentation_id, person_id),
	FOREIGN KEY(person_id) REFERENCES person(person_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'event_table')
	DROP TABLE event_table;

--event_table table
CREATE TABLE event_table (
	event_id int PRIMARY KEY IDENTITY NOT NULL,
	event_name nvarchar(200) NOT NULL,
	event_desc nvarchar(500),
	address_id int NOT NULL,
	event_date date NOT NULL

	UNIQUE(event_name, address_id, event_date),
	FOREIGN KEY(address_id) REFERENCES address_table(address_id)
)
GO


IF EXISTS (SELECT * FROM sys.tables WHERE name = 'professors_event_table')
	DROP TABLE professors_event_table;

--event_table table
CREATE TABLE professors_event_table (
	event_id int PRIMARY KEY IDENTITY NOT NULL,
	event_name nvarchar(200) NOT NULL,
	event_date date NOT NULL,
	event_region nvarchar(200) NOT NULL

	UNIQUE(event_name, event_date, event_region),
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'role_table')
	DROP TABLE role_table;

--People role_table table
CREATE TABLE role_table (
	role_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	role_type nvarchar(100) UNIQUE NOT NULL,
	role_desc nvarchar(500)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'person_role_event')
	DROP TABLE person_role_event;

--Person role_table event_table table
CREATE TABLE person_role_event(
	person_id int NOT NULL,
	role_id tinyint NOT NULL,
	event_id int NOT NULL

	PRIMARY KEY(person_id, role_id, event_id),
	FOREIGN KEY(person_id) REFERENCES person(person_id),
	FOREIGN KEY(role_id) REFERENCES role_table(role_id),
	FOREIGN KEY(event_id) REFERENCES event_table(event_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'event_sponsor_table')
	DROP TABLE event_sponsor_table;

--Person role_table event_table table
CREATE TABLE event_sponsor_table(
	event_id int NOT NULL,
	sponsor_id int NOT NULL,
	table_number tinyint CHECK(table_number > 0 AND table_number < 11) NOT NULL

	PRIMARY KEY(event_id, sponsor_id, table_number),
	FOREIGN KEY(event_id) REFERENCES event_table(event_id),
	FOREIGN KEY(sponsor_id) REFERENCES sponsor(sponsor_id)
)
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'presentation_schedule')
	DROP TABLE presentation_schedule;

--Presentation schedule table
CREATE TABLE presentation_schedule(
	presentation_schedule_id int PRIMARY KEY IDENTITY NOT NULL,
	event_table int NOT NULL,
	presentation int NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL,
	
	UNIQUE(event_table, presentation, start_time, end_time),
	FOREIGN KEY(event_table) REFERENCES event_table(event_id),
	FOREIGN KEY(presentation) REFERENCES presentation(presentation_id)
)
GO