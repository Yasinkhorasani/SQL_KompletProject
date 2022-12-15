USE [Klinikum]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <22.11.2011>
-- Description:	<Add Cases-Prozeduren>
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[sp_AddCasesProzeduren]
	@CaseID int,
	@ProzedurID int,
	@Date datetime,
	@PersonalID int,
	@Kommentar nvarchar(MAX),
	-----
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN	
	-- Hilfsvariablen deklarieren	
	DECLARE @CaseAbgeschlosen AS int;
	DECLARE @StufenVergleich AS int;
	DECLARE @StartDatum AS datetime;
	-------------------------------	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	BEGIN TRY
					-- @CaseID existiert und ist nicht abgeschlossen
		
		SET @CaseAbgeschlosen = dbo.sf_CaseAbgeschlossen(@CaseID);
		IF @CaseAbgeschlosen IS NOT NULL -- @CaseID nicht gefunden, Fehler
			THROW 50001, 'Case existiert nicht, CaseID ist falsch, bitte korrigieren!', 1;
						
		SET @CaseAbgeschlosen = dbo.sf_CaseAbgeschlossen(@CaseID);
		IF @CaseAbgeschlosen = 1 -- @CaseID ist abgeschlössen, Fehler
			THROW 50002, 'Case ist abgeschlössen, bitte korrigieren!', 1;
	
					-- @StufenVergleich ist True
	
		SET @StufenVergleich = [dbo].[sf_QStufenVergleich](@PersonalID, @ProzedurID);
		IF @StufenVergleich IS NULL -- PersonalID oder ProzedurID nicht gefunden, Fehler
			THROW 50003, 'Mitarbeiter oder Prozedur existiert nicht, PersonalID oder ProzedurID ist falsch, bitte korrigieren!', 1;
	
		IF @StufenVergleich = 0 -- Mitarbeiter ist nicht genug qualifiziert 
			THROW 50004, 'Mitarbeiter ist nicht genug qulifiziert !', 1;
 
		-- Datum der Prozedur liegt nach dem Datum des Cases
		SELECT @StartDatum = Cases.StartDatum
				FROM [Cases]
					JOIN [Cases-Prozeduren]
					ON [dbo].[Cases].[CaseID] = [dbo].[Cases-Prozeduren].[CaseID]
				WHERE [dbo].[Cases].[StartDatum] = @StartDatum;

		IF @Date < @StartDatum -- @Date liegt vor dem Datum des Cases, Fehler
			THROW 50005, 'Datum der Prozedur liegt vor dem Datum des Cases, bitte korrigieren!', 1;

			--INSERT INTO [dbo].[Cases-Prozeduren]
		INSERT INTO [dbo].[Cases-Prozeduren]
					([CaseID], [ProzedurID], [Datum], [PersonalID], [Kommentar])
		 VALUES     (@CaseID,  @ProzedurID,  @Date,  @PersonalID,  @Kommentar);

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


