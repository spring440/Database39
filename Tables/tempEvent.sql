--Temp table for event
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'temp_event')
	DROP TABLE temp_event

CREATE TABLE temp_event (
	temp_id int PRIMARY KEY IDENTITY NOT NULL,
	event_date date NOT NULL,
	event_name nvarchar(200) NOT NULL,
	event_region nvarchar(200),
)
GO