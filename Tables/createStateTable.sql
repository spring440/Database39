IF EXISTS (SELECT * FROM sys.tables WHERE name = 'state_table')
	DROP TABLE state_table;

--State_table/Territory Table
CREATE TABLE state_table (
	state_id tinyint PRIMARY KEY IDENTITY NOT NULL,
	state_abbreviation char(2) ,
	state_name char(17) NOT NULL
)
GO