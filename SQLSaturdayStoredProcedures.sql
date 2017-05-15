--Procedure to insert a presentation
--I had to create a table labeled professors presentation to work with your format
CREATE PROCEDURE insertPresentation 
(
@Speaker nvarchar(175),
@Presentation nvarchar(200)
)
AS
BEGIN TRY 
	INSERT INTO professors_presentation (presentation_speaker, presentation_title) VALUES (@Speaker, @Presentation);
END TRY
BEGIN CATCH
	PRINT N'AN ERROR OCCURRED WITH PROCEDURE insertPresentation. COULD NOT INSERT DATA';
END CATCH;
GO

Execute insertPresentation 'Speaker1', 'Presentation1';
GO

Execute insertPresentation 'Speaker1', 'Presentation2';
GO

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

Execute selectPresentation 'Budapest', 'Intermediate';
GO

--Backup SQLSaturday database
--Need to have the server name adjusted
BEGIN TRY
BACKUP DATABASE SQLSaturday
	TO DISK = '\SQLServerBackups\SQLSaturday.Bak'
   WITH FORMAT,
      MEDIANAME = 'SQLSaturdayBackups',
      NAME = 'Full Backup of SQLSaturday';
END TRY
BEGIN CATCH
	PRINT N'AN ERROR OCCURRED WITH THE BACKUP. ';
END CATCH;
GO


