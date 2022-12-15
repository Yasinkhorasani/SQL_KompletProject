USE [Klinikum]
GO

/****** Object:  StoredProcedure [dbo].[sp_Add_Med_Mitarbeiter_zu_Personal]    ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	die Prozedur soll Eingangsparameter prüfen 
-- und Daten in Tabelle 'Projektzuordnung' hinzufügen
-- =============================================
CREATE OR ALTER  PROCEDURE [dbo].[sp_Add_Med_Mitarbeiter_zu_Personal] 
  
	@PersonalID int, 
	@PersonalNummer uniqueidentifier,
    @Vorname  nvarchar(50),
    @Nachname nvarchar(50),
    @GebDatum date, 
    @Land nvarchar(50),
    @Ort nvarchar(50),
    @PLZ nchar(5),
    @Strasse nvarchar(50),
    @Hausnr nvarchar(50),
    @Telefon nvarchar(50),
    @Mobil nvarchar(50),
    @QualifikationID int,
    @BerufID int,
    @AbteilungsID int,
    @PositionID int,
	@Kommentar nvarchar(MAX),
	----------------------------------------------------
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @msg AS nvarchar(MAX); -- Fehlermeldung
	--DECLARE @CheckResult AS int;
	DECLARE @Ergebnis bit;
	-------------------------------------------------------------------	
	BEGIN TRY
	-- @ProjektID existiert und ist nicht abgeschlossen
	--	SET @CheckResult = dbo.sf_ProjektAbgeschlossen(@ProjektID);
		--	IF @CheckResult IS NULL -- @ProjektID nicht gefunden, Fehler
		--	THROW 50001, 'Projekt existiert nicht, ProjektID ist falsch, bitte korrigieren!', 1;
		--	IF @CheckResult = 1 -- Projekt abgeschlossen
		--	THROW 50002, 'Projekt abgeschlossen, bitte korrigieren!', 1;


		-- @PersonalID existiert und Mitarbeiter ist aus Medabteilung
		SET @Ergebnis = [dbo].[sf_IstPer_Aus_MedAbt](@PersonalID)
		IF @Ergebnis IS NULL -- @PersonalID nicht gefunden, Fehler
			THROW 50002, 'Mitarbeiter existiert nicht, PersonalID ist falsch, bitte korrigieren!', 1;
			IF @Ergebnis = 0 -- Mitarbeiter ist aus Keine Projektabteilung
			THROW 50003, 'Mitarbeiter ist aus Keine Medabteilung, bitte korrigieren!', 1;


		-- TODO (Zukunft) -- nur 1 Projektleiter pro Projekt - stored function ~ sf_ProjektMitProjektleiter(@ProjektID); 



		-- INSERT INTO [dbo].[Personal]
		INSERT INTO [dbo].[Personal]
	   ([PersonalID]
      ,[PersonalNummer]
      ,[Vorname]
      ,[Nachname]
      ,[GebDatum]
      ,[Land]
      ,[Ort]
      ,[PLZ]
      ,[Strasse]
      ,[Hausnr]
      ,[Telefon]
      ,[Mobil]
      ,[QualifikationID]
      ,[BerufID]
      ,[AbteilungsID]
      ,[PositionID]
      ,[Kommentar])
		 VALUES   
	   (@PersonalID 
	  ,@PersonalNummer
      ,@Vorname
      ,@Nachname
      ,@GebDatum 
      ,@Land
      ,@Ort
      ,@PLZ
      ,@Strasse
      ,@Hausnr
      ,@Telefon
      ,@Mobil
      ,@QualifikationID
      ,@BerufID
      ,@AbteilungsID
      ,@PositionID
	  ,@Kommentar);

		----------------------
		SET @Erfolg = 1;
		SET @Feedback = 'Alles OK!';	
	END TRY 
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- 	@Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
						+ ' Prozedur: '  + ERROR_PROCEDURE()
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	END CATCH;    
END
GO

