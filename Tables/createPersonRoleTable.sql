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