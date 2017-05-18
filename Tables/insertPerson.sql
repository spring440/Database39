--Insert values into person
INSERT INTO person
(first_name, last_name, address_id, person_email)
SELECT first_name, last_name, (SELECT TOP 1 address_id FROM address_table WHERE street = tar.street AND city = tar.city AND zip = tar.zip AND state_id = (SELECT state_id FROM state_table WHERE state_name = tar.state_name)), email FROM temp_attendees_registration tar;
