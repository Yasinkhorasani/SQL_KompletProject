
USE Klinikum
GO

DECLARE	@Erfolg bit; -- geklappt oder nicht
DECLARE	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

-- Test Test PersonalID existiert

-- Test Test PersonalID existiert nicht

-- Test Personal nicht aus Projektabteilung


/* Test INSERT 
  
  PersonalID 
  PersonalNummer
  Vorname
  Nachname
  GebDatum 
  Land
  Ort
  PLZ
  Strasse
  Hausnr
  Telefon
  Mobil
  QualifikationID
  BerufID
  AbteilungsID
  PositionID
  Kommentar        
*/

EXEC [dbo].[sp_Add_Med_Mitarbeiter_zu_Personal] 
	24, 
	'334f839c-0849-4bda-a19d-382e4b85f380', 
	'Elizabeth',
    'Blackburn',
	'1972-09-06',
	'Detschland',
	 'Brandenburg',
	 '14776',
	 'Ulmenweg',
	 '39',
	 '1689109580',
	 '1689109516',
	 4,
	 11,
	 80,
	 9,
	' Test ',
	----------
	@Erfolg OUTPUT,
	@Feedback OUTPUT;


SELECT @Erfolg AS 'Geklappt?', @Feedback AS 'Rückgabemeldung';