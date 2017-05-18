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