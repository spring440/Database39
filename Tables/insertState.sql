--Insert values into state table
INSERT INTO state_table
(state_name)
SELECT DISTINCT state_name FROM temp_attendees_registration;