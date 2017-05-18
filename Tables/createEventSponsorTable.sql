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