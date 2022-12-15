USE [Klinikum]
GO

/****** Object:  StoredProcedure [dbo].[sp_Backup_Klinikum_mit_Zeitstempel]    Script Date: 17.11.2022 22:06:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE    PROCEDURE [dbo].[sp_Backup_Klinikum_mit_Zeitstempel] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @backupFile NVARCHAR(MAX); -- file name
	SET @backupFile = 'C:\SQL\DB\Klinikum\Backup\Klinikum-' 
					  + [dbo].[sf_Zeitstempel]() 
					  + '.bak';
					  
	BACKUP DATABASE [Klinikum] TO DISK = @backupFile;
END
GO


