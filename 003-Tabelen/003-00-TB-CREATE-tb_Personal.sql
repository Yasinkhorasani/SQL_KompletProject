USE [Klinikum]
GO

/****** Object:  Table [dbo].[Personal]    Script Date: 24.11.2022 06:10:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personal](
	[PersonalID] [int] IDENTITY(1,1) NOT NULL,
	[PersonalNummer] [uniqueidentifier] NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[GebDatum] [date] NOT NULL,
	[Land] [nvarchar](50) NULL,
	[Ort] [nvarchar](50) NULL,
	[PLZ] [nchar](5) NULL,
	[Strasse] [nvarchar](50) NULL,
	[Hausnr] [nvarchar](20) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Mobil] [nvarchar](150) NULL,
	[QualifikationID] [int] NOT NULL,
	[BerufID] [int] NOT NULL,
	[AbteilungsID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[Kommentar] [ntext] NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[PersonalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Personal] ADD  CONSTRAINT [DF_Personal_PersonalNummer]  DEFAULT (newid()) FOR [PersonalNummer]
GO

ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Abteilung] FOREIGN KEY([AbteilungsID])
REFERENCES [dbo].[Abteilungen] ([AbteilungsID])
GO

ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Abteilung]
GO

ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positionen] ([PositionID])
GO

ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Position]
GO

ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Profession1] FOREIGN KEY([BerufID])
REFERENCES [dbo].[Berufe] ([BerufID])
GO

ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Profession1]
GO

ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Qualifikation] FOREIGN KEY([QualifikationID])
REFERENCES [dbo].[Qualifikationen] ([QualifikationID])
GO

ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Qualifikation]
GO

