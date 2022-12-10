USE [Klinikum]
GO

/****** Object:  View [dbo].[View_ArbeitsTag_Arbeitszeit_Einkommen_Pro_Artz]    Script Date: 21.11.2022 13:52:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_ArbeitsTag_Arbeitszeit_Einkommen_Pro_Artz]
AS
SELECT        TOP (100) PERCENT dbo.Personal.Nachname, dbo.Personal.Vorname, dbo.Qualifikationen.Qualifikation, COUNT(dbo.[Cases-Prozeduren].Datum) AS Anz_ArbietsTag, SUM(dbo.Prozeduren.Dauer) AS Sum_ArbeitsZeit, 
                         SUM(dbo.Prozeduren.Preis) AS Einkommen
FROM            dbo.Personal INNER JOIN
                         dbo.Qualifikationen ON dbo.Personal.QualifikationID = dbo.Qualifikationen.QualifikationID INNER JOIN
                         dbo.[Cases-Prozeduren] ON dbo.Personal.PersonalID = dbo.[Cases-Prozeduren].PersonalID INNER JOIN
                         dbo.Prozeduren ON dbo.[Cases-Prozeduren].ProzedurID = dbo.Prozeduren.ProzedurID
GROUP BY dbo.Personal.Nachname, dbo.Personal.Vorname, dbo.Qualifikationen.Qualifikation
HAVING        (dbo.Qualifikationen.Qualifikation = 'Arzt/Ärtztin ')
ORDER BY dbo.Personal.Nachname, dbo.Personal.Vorname
GO