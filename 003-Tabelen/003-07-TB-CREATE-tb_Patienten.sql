USE [Klinikum]
GO

/****** Object:  Table [dbo].[Patienten]    Script Date: 24.11.2022 06:10:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Patienten](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[GebDat] [date] NOT NULL,
	[KrankenkassenID] [int] NOT NULL,
	[Ort] [nvarchar](50) NULL,
	[PLZ] [nchar](5) NULL,
	[Strasse] [nvarchar](50) NULL,
	[Hausnr] [nvarchar](10) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Mobil] [nvarchar](50) NULL,
	[BiogeschlechtW] [bit] NULL,
	[Allergien] [bit] NULL,
	[ChronischeKrankheiten] [bit] NULL,
	[Gewicht] [tinyint] NULL,
	[Höhe] [tinyint] NULL,
	[Rauchen] [bit] NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_PatientenID] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Patienten] ADD  CONSTRAINT [DF_Patienten_Biogeschlecht]  DEFAULT ((0)) FOR [BiogeschlechtW]
GO

ALTER TABLE [dbo].[Patienten] ADD  CONSTRAINT [DF_Patienten_Allergien]  DEFAULT ((0)) FOR [Allergien]
GO

ALTER TABLE [dbo].[Patienten] ADD  CONSTRAINT [DF_Patienten_ChronischeKrankheiten]  DEFAULT ((0)) FOR [ChronischeKrankheiten]
GO

ALTER TABLE [dbo].[Patienten] ADD  CONSTRAINT [DF_Patienten_Rauchen]  DEFAULT ((0)) FOR [Rauchen]
GO

ALTER TABLE [dbo].[Patienten]  WITH CHECK ADD  CONSTRAINT [FK_Patienten_Krankenkassen] FOREIGN KEY([KrankenkassenID])
REFERENCES [dbo].[Krankenkassen] ([KrankenkasseID])
GO

ALTER TABLE [dbo].[Patienten] CHECK CONSTRAINT [FK_Patienten_Krankenkassen]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Weiblich - 1, Mänlich - 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Patienten', @level2type=N'COLUMN',@level2name=N'BiogeschlechtW'
GO

