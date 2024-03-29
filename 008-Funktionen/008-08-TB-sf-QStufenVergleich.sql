USE [Klinikum]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_QStufenVergleich]    Script Date: 23.11.2022 14:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <23.11.2022>
-- Description:	<QStufenVergleichen>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_QStufenVergleich]  
(
	@PersonalID int,
	@ProzedurID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;
	DECLARE @QStufePersonal int;
	DECLARE @QStufeProzedur int;
		
	-- Add the T-SQL statements to compute the return value here
	
			-- v.1 mit Funktionen --------------------------
	
	SET @QStufePersonal = [dbo].[sf_QStufePersonal](@PersonalID)
	SET @QStufeProzedur = [dbo].[sf_QStufeProzedur](@ProzedurID)
	
			-- v.2 ohne Funktionen ------------------------
	
	--SELECT @QStufePersonal = Qualifikationen.QStufeID
	--	FROM Qualifikationen 
	--		INNER JOIN Personal 
	--			ON Qualifikationen.QualifikationID = Personal.QualifikationID
	--	WHERE (Personal.PersonalID = @PersonalID);
	
	--SELECT @QStufeProzedur = Prozeduren.QStufeID
	--	FROM Prozeduren 
	--	WHERE (Prozeduren.ProzedurID = @ProzedurID);
	
	IF (@QStufePersonal >= @QStufeProzedur  )
		SET @Ergebnis = 1
	ELSE
		SET @Ergebnis = 0

	-- Return the result of the function
	RETURN @Ergebnis;

END
