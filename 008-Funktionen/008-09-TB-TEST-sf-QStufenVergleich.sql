
PRINT [dbo].[sf_QStufeProzedur](3)		-- Erstaufname
PRINT [dbo].[sf_QStufeProzedur](4)		-- Blutabnahme
PRINT [dbo].[sf_QStufeProzedur](8)		-- Binde
PRINT '--------------------------------'
PRINT [dbo].[sf_QStufePersonal](2)		-- Arzt/Ärtztin 
PRINT [dbo].[sf_QStufePersonal](16)		-- Arzthelfer/-inen
PRINT [dbo].[sf_QStufePersonal](22)		-- Pflegefachkraft
PRINT [dbo].[sf_QStufePersonal](24)		-- Unmedizinichearbeitskraft   
PRINT '--------------------------------'
PRINT [dbo].[sf_QStufenVergleich](2,3)	-- Arzt/Ärtztin     , Erstaufname
PRINT [dbo].[sf_QStufenVergleich](16,3) -- Arzthelfer/-inen    , Erstaufname
PRINT [dbo].[sf_QStufenVergleich](22,4) -- Pflegefachkraft      , Blutabnahme
PRINT [dbo].[sf_QStufenVergleich](24,8) -- Pflegefachkraft     , Binde
