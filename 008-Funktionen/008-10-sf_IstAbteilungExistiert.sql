USE [Klinikum]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_IstQualifikationExistiert]    Script Date: 24.11.2022 07:33:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<>
-- Create date: <20.11.2022>
-- Description:	<IstAbteilungExistirt?>
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_IstAbteilungExistiert]
(
	@AbteilungsID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;

	-- Add the T-SQL statements to compute the return value here
		SELECT @Ergebnis = COUNT(*)
						FROM[dbo].[Abteilungen]
						WHERE (Abteilungen.AbteilungsID = @AbteilungsID)
						;
	
	-- Return the result of the function
	RETURN @Ergebnis;

END
GO


