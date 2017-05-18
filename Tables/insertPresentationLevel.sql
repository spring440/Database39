--Insert into presentation level
INSERT INTO presentation_level 
(level_type)
SELECT DISTINCT level_name FROM temp_presentations;