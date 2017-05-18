--Insert into presentation
INSERT INTO professors_event_table
(event_name, event_date, event_region )
SELECT event_name, event_date, event_region FROM temp_event;
