USE [Klinikum]
GO

/****** Object:  View [dbo].[View_Patient_Prozedur_Personal]    Script Date: 21.11.2022 13:51:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_Patient_Prozedur_Personal]
AS
SELECT        TOP (100) PERCENT dbo.Patienten.Nachname AS PatientNN, dbo.Patienten.Vorname AS PatientVN, dbo.Krankenkassen.Krankenkasse, dbo.Cases.CaseNummer, dbo.Cases.Symptome, dbo.Prozeduren.ProzedurName, 
                         dbo.[Cases-Prozeduren].Datum, dbo.Prozeduren.Dauer, dbo.Personal.Nachname AS PersonalNN, dbo.Personal.Vorname AS PersonalVN, dbo.Qualifikationen.Qualifikation
FROM            dbo.Patienten INNER JOIN
                         dbo.Krankenkassen ON dbo.Patienten.KrankenkassenID = dbo.Krankenkassen.KrankenkasseID INNER JOIN
                         dbo.Cases ON dbo.Patienten.PatientID = dbo.Cases.PatientID INNER JOIN
                         dbo.[Cases-Prozeduren] ON dbo.Cases.CaseID = dbo.[Cases-Prozeduren].CaseID INNER JOIN
                         dbo.Prozeduren ON dbo.[Cases-Prozeduren].ProzedurID = dbo.Prozeduren.ProzedurID INNER JOIN
                         dbo.ProzedurTypen ON dbo.Prozeduren.ProzedurTypID = dbo.ProzedurTypen.ProzedurTypID INNER JOIN
                         dbo.Personal ON dbo.[Cases-Prozeduren].PersonalID = dbo.Personal.PersonalID INNER JOIN
                         dbo.Qualifikationen ON dbo.Personal.QualifikationID = dbo.Qualifikationen.QualifikationID
ORDER BY PatientNN, PatientVN
GO
