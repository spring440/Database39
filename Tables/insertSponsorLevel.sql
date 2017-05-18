--Insert values into sponsor level
INSERT INTO sponsor_level 
(sponsor_level_name) 
SELECT DISTINCT sponsor_type FROM temp_sponsors;