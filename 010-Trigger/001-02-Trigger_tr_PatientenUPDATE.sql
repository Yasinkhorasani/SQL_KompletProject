USE [Klinikum];
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------
CREATE OR ALTER TRIGGER [tr_PatientenUPDATE] 
   ON [dbo].[Patienten] 
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO dbo.PatientenLog
			(Mode, PatientID, PatientNachname, PatientVorname,
			 PLZAlt,
			 PLZ,
			 OrtAlt, 
			 Ort)
	SELECT   'U', PatientID, Nachname, Vorname, 
	-- Beispiel nur für Ort und PLZ genau so kann man auch für Nachname, Vorname etc. programmieren	
	        (SELECT PLZ FROM deleted), -- Wert alt
			(SELECT PLZ FROM inserted), -- Wert neu
			(SELECT Ort FROM deleted), -- Wert alt
			(SELECT Ort FROM inserted) -- Wert neu
	FROM deleted; -- es geht auch FROM inserted


END
GO
