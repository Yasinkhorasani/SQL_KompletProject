USE [Klinikum]
GO

/****** Object:  Trigger [tr_CasesINSERT]    Script Date: 21.11.2022 20:46:20 ******/
DROP TRIGGER [dbo].[tr_CasesINSERT]
GO

/****** Object:  Trigger [dbo].[tr_CasesINSERT]    Script Date: 21.11.2022 20:46:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <21.11.2022>
-- Description:	<Erstellung einer neue Case-Prozedur>
-- =============================================
CREATE     TRIGGER [dbo].[tr_CasesINSERT]
   ON [dbo].[Cases] 
   FOR INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO [dbo].[Cases-Prozeduren]
			([CaseID], [ProzedurID], [Datum], [PersonalID], [Kommentar])
	SELECT   [CaseID],  '3', [StartDatum], [PersonalID], 'Wird automatisch im Zusammenhang mit der Erstbehandlung des Patienten erstellt.'
	FROM inserted;

END
GO

ALTER TABLE [dbo].[Cases] ENABLE TRIGGER [tr_CasesINSERT]
GO

