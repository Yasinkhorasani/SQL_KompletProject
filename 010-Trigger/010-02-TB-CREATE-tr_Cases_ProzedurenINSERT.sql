USE Klinikum
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <23.11.2022>
-- Description:	<Update EndDatum in Tabele Cases>
-- =============================================
CREATE OR ALTER TRIGGER [dbo].[tr_Cases_ProzedurenINSERT] 
   ON [dbo].[Cases-Prozeduren]   
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Insert statements for trigger here
	DECLARE @Datum datetime;
	DECLARE @ProzedurID int;
	DECLARE @CaseID int;

	SELECT @Datum = Datum FROM inserted;
    SELECT @ProzedurID = ProzedurID FROM inserted;
	
	IF @ProzedurID = 18
	SELECT @CaseID = CaseID FROM inserted;
	
	UPDATE dbo.Cases
	SET EndDatum = @Datum, Kommentar = 'Automatisch geschlossen'
	WHERE CaseID = @CaseID
	
END
GO
