--Temp table for sponsors
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'temp_sponsors')
	DROP TABLE temp_sponsors

CREATE TABLE temp_sponsors (
	temp_id int PRIMARY KEY IDENTITY NOT NULL,
	sponsor_name nvarchar(200) NOT NULL,
	sponsor_type nvarchar(25) NOT NULL
)
GO