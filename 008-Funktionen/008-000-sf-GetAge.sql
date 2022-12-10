USE [Klinikum]
GO

/****** Object:  UserDefinedFunction [dbo].[sf_GetAge]    Script Date: 20.11.2022 17:06:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Timofey Belokon
-- Create date: 20.11.2022
-- Description:	diese Funktion berechnet Alter
-- =============================================
CREATE OR ALTER     FUNCTION [dbo].[sf_GetAge] 
-- Declare the input variable here
(
	@GebDat date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE  @Age int;
	
	-- Declare the help variable here
	DECLARE @Heute date;
	SET @Heute = GETDATE();
	
	-- Funktion 
	IF (MONTH(@GebDat) > MONTH(@Heute)) -- Geburtstag erst später
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE IF (MONTH(@GebDat) = MONTH(@Heute) AND DAY(@GebDat) > DAY(@Heute))
		SET @Age = DATEDIFF(YEAR, @GebDat, @Heute) - 1 -- ist noch nich so alt
	ELSE SET @Age = DATEDIFF(YEAR, @GebDat, @Heute);

	-- Return the result of the function
	RETURN @Age;

END
GO


