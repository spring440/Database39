--Temp table for presentations
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'temp_presentations')
	DROP TABLE temp_presentations

CREATE TABLE temp_presentations (
	temp_id int PRIMARY KEY IDENTITY NOT NULL,
	title nvarchar(200) NOT NULL,
	speaker nvarchar(175) NOT NULL,
	level_name nvarchar(50) NOT NULL,
	event_name nvarchar(125) NOT NULL
)
GO