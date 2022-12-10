USE [Klinikum]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  FUNCTION [dbo].[sf_Zeitstempel] 
(
)
RETURNS char(18)
AS
BEGIN
	
	RETURN FORMAT(GETDATE(), 'yyyyMMdd-HHmmssfff');

END
GO

