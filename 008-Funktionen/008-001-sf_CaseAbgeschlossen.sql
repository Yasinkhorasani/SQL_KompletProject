USE [Klinikum]
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <22.11.2022>
-- Description:	<Ist Case abgeschlossen?>
-- =============================================
CREATE OR Alter FUNCTION [dbo].[sf_CaseAbgeschlossen]  
(
	-- Add the parameters for the function here
	@CaseID int
	)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @CaseAbgeschlossen bit;
	DECLARE @EndDatum datetime;

	SET @EndDatum =( Select EndDatum
	FROM dbo.Cases
	WHERE CaseID = @CaseID)
	 
	 If @EndDatum IS NUll 
	 Set @CaseAbgeschlossen=0
	 Else Set @CaseAbgeschlossen=1;
	 	 
	-- Return the result of the function
	--RETURN iif(@CaseAbgeschlossen IS NULL, 0, 1);
	RETURN @CaseAbgeschlossen;

END
GO

