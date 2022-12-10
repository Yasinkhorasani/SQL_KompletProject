USE [Klinikum]
GO

/****** Object:  View [dbo].[View_Patient_Biogeschlecht_ChroKrankenheit]    Script Date: 21.11.2022 13:49:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_Patient_Biogeschlecht_ChroKrankenheit]
AS
SELECT        TOP (100) PERCENT Nachname, Vorname, Biogeschlecht, ChronischeKrankheiten
FROM            dbo.Patienten
WHERE        (Biogeschlecht = 1) AND (ChronischeKrankheiten = 1)
ORDER BY Nachname, Vorname
GO



