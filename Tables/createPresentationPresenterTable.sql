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