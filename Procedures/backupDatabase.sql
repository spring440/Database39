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