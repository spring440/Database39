IF EXISTS (SELECT * FROM sys.tables WHERE name = 'sponsor')
	DROP TABLE sponsor;

--Sponsor table
CREATE TABLE sponsor(
	sponsor_id int PRIMARY KEY IDENTITY NOT NULL,
	sponsor_name nvarchar(200) NOT NULL,
	address_id int,
	sponsor_level tinyint NOT NULL,
	sponsor_phone char(13),
	sponsor_email nvarchar(254)

	FOREIGN KEY(address_id) REFERENCES address_table(address_id),
	FOREIGN KEY(sponsor_level) REFERENCES sponsor_level(sponsor_level_id)
)
GO