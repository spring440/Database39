IF EXISTS (SELECT * FROM sys.tables WHERE name = 'sponsor_level')
	DROP TABLE sponsor_level;

--Sponsor level table
CREATE TABLE sponsor_level(
	sponsor_level_id tinyint IDENTITY PRIMARY KEY NOT NULL,
	sponsor_level_name nvarchar(20) UNIQUE NOT NULL
)
GO