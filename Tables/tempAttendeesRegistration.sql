--Temp table for attendees registration
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'temp_attendees_registration')
	DROP TABLE temp_attendees_registration

CREATE TABLE temp_attendees_registration (
	temp_id int PRIMARY KEY IDENTITY NOT NULL,
	first_name nvarchar(75) NOT NULL,
	last_name nvarchar(75) NOT NULL,
	street nvarchar(100) NOT NULL,
	city nvarchar(125) NOT NULL,
	zip nvarchar(13) NOT NULL,
	state_name nvarchar(125) NOT NULL,
	email nvarchar(254) NOT NULL
)
GO