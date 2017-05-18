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