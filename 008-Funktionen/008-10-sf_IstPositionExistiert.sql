USE [Klinikum]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_IstBerufExistiert]    Script Date: 24.11.2022 07:26:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<>
-- Create date: <20.11.2022>
-- Description:	<IstPositionExistirt?>
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_IstPositionExistiert]
(
	@PositionID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;

	-- Add the T-SQL statements to compute the return value here
		SELECT @Ergebnis = COUNT(*)
						FROM[dbo].[Positionen]
						WHERE (Positionen.PositionID = @PositionID)
						;
	
	-- Return the result of the function
	RETURN @Ergebnis;

END
GO


