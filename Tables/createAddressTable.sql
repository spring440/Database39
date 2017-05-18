IF EXISTS (SELECT * FROM sys.tables WHERE name = 'address_table')
	DROP TABLE address_table;

--address_table Table
CREATE TABLE address_table (
	address_id int PRIMARY KEY IDENTITY NOT NULL,
	street nvarchar(100) NOT NULL,
	city nvarchar(125) NOT NULL,
	state_id tinyint,
	zip char(13),
	country tinyint

	FOREIGN KEY(state_id) REFERENCES state_table(state_id),
	FOREIGN KEY(country) REFERENCES country(country_id)
)
GO