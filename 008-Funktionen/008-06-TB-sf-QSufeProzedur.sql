USE [Klinikum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Timofey Belokon>
-- Create date: <20.11.2022>
-- Description:	<QStufeID von ProzedurID>
-- =============================================
CREATE OR ALTER     FUNCTION [dbo].[sf_QStufeProzedur] 
(
	@ProzedurID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Ergebnis int;
	
	-- Add the T-SQL statements to compute the return value here
	 SELECT @Ergebnis = Prozeduren.QStufeID
							FROM Prozeduren 
							WHERE (Prozeduren.ProzedurID = @ProzedurID);
	
	-- Return the result of the function
	RETURN @Ergebnis;
END
