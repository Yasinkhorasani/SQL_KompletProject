USE [Klinikum]
GO

/****** Object:  Table [dbo].[Patienten]    Script Date: 18.11.2022 06:57:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patienten](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[GeschlechtBio] [bit] NULL,
	[Ort] [nvarchar](50) NULL,
	[PLZ] [nchar](5) NULL,
	[Strasse] [nvarchar](50) NULL,
	[Hausnr] [nvarchar](10) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Mobil] [nvarchar](50) NULL,
	[GebDat] [date] NULL,
	[Kommentar] [text] NULL,
	[Gewicht] [int] NULL,
	[Höhe] [int] NULL,
	[Rauchen] [bit] NULL,
 CONSTRAINT [PK_Kunden] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

