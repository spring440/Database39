IF EXISTS (SELECT * FROM sys.tables WHERE name = 'track')
	DROP TABLE track;

--Track table
CREATE TABLE track (
	track_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	track_name nvarchar(200) UNIQUE NOT NULL,
	track_desc nvarchar(500)
)
GO