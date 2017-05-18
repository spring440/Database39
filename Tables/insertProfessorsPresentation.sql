--Insert into presentation
INSERT INTO professors_presentation
(presentation_title, presentation_speaker, presentation_level, presentation_event)
SELECT title, speaker, level_name, event_name FROM temp_presentations;

