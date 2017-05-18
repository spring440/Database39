--Address table inserts
INSERT INTO address_table
(street, city, state_id, zip)
SELECT street, city, (SELECT state_id FROM state_table st WHERE st.state_name = tar.state_name), zip FROM temp_attendees_registration tar;
