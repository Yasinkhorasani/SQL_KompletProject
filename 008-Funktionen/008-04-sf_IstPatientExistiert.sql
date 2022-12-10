USE Klinikum
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <22.11.2022>
-- Description:	<Ist Patient existiert?>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_IstPatientExistiert] 
(
	@PersonalID int
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis bit;

	-- Add the T-SQL statements to compute the return value here
	SET @Ergebnis = (SELECT COUNT(*)
						FROM[dbo].[Patienten]
						WHERE (Patienten.PatientID = @PersonalID)
					);

	-- Return the result of the function
	RETURN @Ergebnis;
END
GO

