--Insert values into sponsor
INSERT INTO sponsor
(sponsor_name, sponsor_level)
SELECT ts.sponsor_name, (SELECT TOP 1 sponsor_level_id FROM sponsor_level WHERE sponsor_name = ts.sponsor_name) FROM temp_sponsors ts;
