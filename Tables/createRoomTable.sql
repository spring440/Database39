IF EXISTS (SELECT * FROM sys.tables WHERE name = 'room')
	DROP TABLE room;

--Rooms table
CREATE TABLE room (
	room_id int PRIMARY KEY IDENTITY NOT NULL,
    room_name nvarchar(100) NOT NULL,
	address_id int NOT NULL, 
	max_seats tinyint NOT NULL

	FOREIGN KEY(address_id) REFERENCES address_table(address_id)
)
GO