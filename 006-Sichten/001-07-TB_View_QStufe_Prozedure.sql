USE [Klinikum]
GO

/****** Object:  View [dbo].[View_QStufe_Prozedure]    Script Date: 22.11.2022 20:59:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[View_QStufe_Prozedure]
AS
SELECT        TOP (100) PERCENT dbo.Prozeduren.ProzedurName, dbo.ProzedurTypen.PrezedurTyp, dbo.Prozeduren.ProzedurTypID, dbo.Prozeduren.Beschreibung, dbo.Prozeduren.QStufeID
FROM            dbo.Prozeduren INNER JOIN
                         dbo.ProzedurTypen ON dbo.Prozeduren.ProzedurTypID = dbo.ProzedurTypen.ProzedurTypID
ORDER BY dbo.Prozeduren.ProzedurTypID
GO