USE [Klinikum]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_IstPer_Aus_MedAbt]  
(
	@PersonalID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;


	SET @Ergebnis = (SELECT COUNT(*)
						FROM Abteilungen 
						INNER JOIN Personal 
						ON Abteilungen.AbteilungsID = Personal.AbteilungsID
						WHERE (Personal.PersonalID = @PersonalID)
					);

	-- Return the result of the function
	RETURN @Ergebnis;
END
Go