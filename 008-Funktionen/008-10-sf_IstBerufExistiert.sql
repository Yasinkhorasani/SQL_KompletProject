USE Klinikum
GO 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <20.11,2022>
-- Description:	<IstBerufExistirt?>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_IstBerufExistirt]
(
	@BerufID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;

	-- Add the T-SQL statements to compute the return value here
		SELECT @Ergebnis = COUNT(*)
						FROM[dbo].[Berufe]
						WHERE (Berufe.BerufID = @BerufID)
						;
	
	-- Return the result of the function
	RETURN @Ergebnis;

END
GO

