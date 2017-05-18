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