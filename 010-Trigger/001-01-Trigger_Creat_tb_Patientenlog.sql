USE [Klinikum];
GO

DROP TABLE IF EXISTS PatientenLog;
GO

CREATE TABLE PatientenLog 
(
  ID       INT       NOT NULL IDENTITY PRIMARY KEY,
  ---------------------------------------------------------
  Mode     CHAR(1)        NOT NULL, -- I für INSERT, D für DELETE, U für UPDATE
  EditOn   DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  EditUser NVARCHAR(100)  NOT NULL DEFAULT ORIGINAL_LOGIN(),
  ------- Tabelle Kunden ------------------------------------
  PatientID       INT           NOT NULL, -- PatientID (Tabelle Patienten), 
  PatientNachname NVARCHAR(50)  NOT NULL,
  PatientVorname  NVARCHAR(50)  NOT NULL,
  ----------------------------------------------------------
  PLZAlt            CHAR(5)       NULL,
  PLZ            CHAR(5)       NULL,
  ---------------------------------------------------------
  OrtAlt   NVARCHAR(50)   NULL, -- Alt und Neu - nur für UPDATE
  Ort      NVARCHAR(50)   NULL
)
GO
