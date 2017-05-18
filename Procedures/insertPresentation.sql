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