IF EXISTS (SELECT * FROM sys.tables WHERE name = 'country')
	DROP TABLE country;

--Country table
CREATE TABLE country(
	country_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	country_code char(2) NOT NULL,
	country_name nvarchar(100) NOT NULL
)
GO