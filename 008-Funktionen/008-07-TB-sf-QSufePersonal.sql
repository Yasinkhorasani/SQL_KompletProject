USE [Klinikum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <20.11.2022>
-- Description:	<QStufeID von PersonalID>
-- =============================================
CREATE OR ALTER   FUNCTION [dbo].[sf_QStufePersonal] 
(
	@PersonalID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis int;
	
	-- Add the T-SQL statements to compute the return value here
	 SELECT @Ergebnis = Qualifikationen.QStufeID
							FROM Qualifikationen 
							INNER JOIN Personal 
							ON Qualifikationen.QualifikationID = Personal.QualifikationID
							WHERE (Personal.PersonalID = @PersonalID);
	
	-- Return the result of the function
	RETURN @Ergebnis;
END
