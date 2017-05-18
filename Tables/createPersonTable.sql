IF EXISTS (SELECT * FROM sys.tables WHERE name = 'person')
	DROP TABLE person;

--Person table
CREATE TABLE person (
	person_id int PRIMARY KEY IDENTITY NOT NULL,
	first_name nvarchar(75) NOT NULL,
	middle_name nvarchar(75),
	last_name nvarchar(75) NOT NULL,
	address_id int NOT NULL,
	person_phone char(13),
	person_email nvarchar(254) NOT NULL

	FOREIGN KEY(address_id) REFERENCES address_table(address_id)
)
GO