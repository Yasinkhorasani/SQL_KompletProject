USE [Klinikum]
GO

/****** Object:  View [dbo].[View_Anzahl_Patient_pro_Arzt/Arztin]    Script Date: 21.11.2022 13:53:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_Anzahl_Patient_pro_Arzt/Arztin]
AS
SELECT        TOP (100) PERCENT dbo.Personal.Nachname, dbo.Personal.Vorname, dbo.Qualifikationen.Qualifikation, COUNT(dbo.Cases.PatientID) AS [Anzahl Ptienten]
FROM            dbo.Personal INNER JOIN
                         dbo.Qualifikationen ON dbo.Personal.QualifikationID = dbo.Qualifikationen.QualifikationID INNER JOIN
                         dbo.[Cases-Prozeduren] ON dbo.Personal.PersonalID = dbo.[Cases-Prozeduren].PersonalID INNER JOIN
                         dbo.Cases ON dbo.[Cases-Prozeduren].CaseID = dbo.Cases.CaseID
GROUP BY dbo.Personal.Nachname, dbo.Personal.Vorname, dbo.Qualifikationen.Qualifikation
HAVING        (dbo.Qualifikationen.Qualifikation = 'Arzt/Ärtztin')
ORDER BY dbo.Personal.Nachname, dbo.Personal.Vorname
GO