-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
USE Klinikum;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sophia Nisani>
-- Create date: <22.11.22>
-- Description:	<Die Funktion RETURN Alle Patienten VN&NN&TelN&MobilN and from Cases StartDatum&EndDATUM 
-- dass mehr als @dauer from @timepoint in Klinikum nicht besuchen haben>
-- =============================================
CREATE or ALTER FUNCTION tf_diffBesuch 
(	
	-- Add the parameters for the function here
	@timepoint datetime, 
	@dauer smallint
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT 
		[dbo].[Patienten].[Vorname],
		[dbo].[Patienten].[Nachname],
		[dbo].[Patienten].[Telefon],
		[dbo].[Patienten].[Mobil],
        [dbo].[Cases].[StartDatum],
		[dbo].[Cases].[EndDatum]
	FROM            dbo.Patienten INNER JOIN
                         dbo.Cases ON dbo.Patienten.PatientID = dbo.Cases.PatientID
			WHERE (DATEDIFF(month, [StartDatum], [dbo].[Cases].[EndDatum]) >= @dauer) AND [StartDatum]>=@timepoint 
	--ORDER BY  [dbo].[Patienten].[Vorname], [dbo].[Patienten].[Nachname]--

)
GO
