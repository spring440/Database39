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