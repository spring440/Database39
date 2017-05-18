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