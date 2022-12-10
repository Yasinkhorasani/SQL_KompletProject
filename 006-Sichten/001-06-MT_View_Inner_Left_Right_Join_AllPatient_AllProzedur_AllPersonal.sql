USE [Klinikum]
GO

/****** Object:  View [dbo].[View_AllPatient_AllProzedur_AllPersonal]    Script Date: 21.11.2022 13:55:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  OR ALTER VIEW [dbo].[View_AllPatient_AllProzedur_AllPersonal]
AS
SELECT        TOP (100) PERCENT dbo.Patienten.Nachname AS PatientNN, dbo.Patienten.Vorname AS PatientVN, dbo.Krankenkassen.Krankenkasse, dbo.Prozeduren.ProzedurName, dbo.[Cases-Prozeduren].Datum, 
                         dbo.Personal.Nachname AS PersonalNN, dbo.Personal.Vorname AS PersonalVN, dbo.Personal.QualifikationID
FROM            dbo.[Cases-Prozeduren] RIGHT OUTER JOIN
                         dbo.Personal ON dbo.[Cases-Prozeduren].PersonalID = dbo.Personal.PersonalID RIGHT OUTER JOIN
                         dbo.Prozeduren ON dbo.[Cases-Prozeduren].ProzedurID = dbo.Prozeduren.ProzedurID LEFT OUTER JOIN
                         dbo.Cases ON dbo.[Cases-Prozeduren].CaseID = dbo.Cases.CaseID RIGHT OUTER JOIN
                         dbo.Patienten ON dbo.Cases.PatientID = dbo.Patienten.PatientID FULL OUTER JOIN
                         dbo.Krankenkassen ON dbo.Patienten.KrankenkassenID = dbo.Krankenkassen.KrankenkasseID
ORDER BY PatientNN, PatientVN, dbo.[Cases-Prozeduren].Datum
GO