USE [Klinikum];
GO

SELECT * FROM [dbo].[Patienten]
WHERE PatientID = 31; -- Ulf Wolff 

GO
SELECT * FROM dbo.PatientenLog;
GO
----------------------------------------------
UPDATE [dbo].[Patienten]
SET Ort = 'Marburg_1' , PLZ = '1111'
WHERE PatientID = 31; -- Ulf Wolff 

UPDATE [dbo].[Patienten]
SET Ort = 'Marburg_2' , PLZ = '2222'
WHERE PatientID = 31; -- Ulf Wolff 


SELECT * FROM [dbo].[Patienten]
WHERE PatientID = 31; -- Ulf Wolff 
GO
SELECT * FROM dbo.PatientenLog;
GO