USE [Klinikum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Timofey BELOKON>
-- Create date: <23.11.2022>
-- Description:	<Create eine Diagnose>
-- =============================================
CREATE OR ALTER TRIGGER [dbo].[tr_Cases_ProzedurenINSERT13] 
   ON [dbo].[Cases-Prozeduren]   
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ID int
	SELECT @ID = ID FROM inserted;

	DECLARE @ProzedurID int;
	SELECT @ProzedurID = ProzedurID FROM inserted;
	IF @ProzedurID = 13
	INSERT INTO [dbo].[Diagnosen]
			([CaseProzID],[Diagnose])
	SELECT   @ID,'Muss man eine Diagnose stellen'
	FROM inserted;
END
GO
