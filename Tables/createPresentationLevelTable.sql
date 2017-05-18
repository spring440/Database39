IF EXISTS (SELECT * FROM sys.tables WHERE name = 'presentation_level')
	DROP TABLE presentation_level;

--Presentation level table
CREATE TABLE presentation_level (
	level_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	level_type nvarchar(50) UNIQUE NOT NULL
)
GO