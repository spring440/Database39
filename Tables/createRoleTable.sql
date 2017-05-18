IF EXISTS (SELECT * FROM sys.tables WHERE name = 'role_table')
	DROP TABLE role_table;

--People role_table table
CREATE TABLE role_table (
	role_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	role_type nvarchar(100) UNIQUE NOT NULL,
	role_desc nvarchar(500)
)
GO