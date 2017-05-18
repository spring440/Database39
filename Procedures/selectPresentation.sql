--Procedure to select a presentation with a level
--The directions say track but the data you provided does not have any tracks
CREATE PROCEDURE selectPresentation
(
@Event nvarchar(200),
@Level nvarchar(200)
)
AS
BEGIN TRY 
	SELECT * FROM professors_presentation WHERE presentation_event = @Event AND presentation_level = @Level;
END TRY
BEGIN CATCH
	PRINT N'AN ERROR OCCURRED WITH PROCEDURE selectPresentation. COULD NOT SELECT DATA';
END CATCH;
GO