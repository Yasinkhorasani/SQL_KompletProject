USE [Klinikum]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_IstPositionExistiert]    Script Date: 24.11.2022 07:29:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<>
-- Create date: <20.11.2022>
-- Description:	<IstQualifikationExistirt?>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_IstQualifikationExistiert]
(
	@QualifikationID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;

	-- Add the T-SQL statements to compute the return value here
		SELECT @Ergebnis = COUNT(*)
						FROM[dbo].[Qualifikationen]
						WHERE (Qualifikationen.QualifikationID = @QualifikationID)
						;
	
	-- Return the result of the function
	RETURN @Ergebnis;

END
GO


