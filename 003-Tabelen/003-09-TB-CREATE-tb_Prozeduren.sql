USE [Klinikum]
GO

/****** Object:  Table [dbo].[Prozeduren]    Script Date: 24.11.2022 06:11:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prozeduren](
	[ProzedurID] [int] IDENTITY(1,1) NOT NULL,
	[ProzedurName] [nvarchar](50) NOT NULL,
	[ProzedurTypID] [int] NOT NULL,
	[Beschreibung] [nvarchar](max) NULL,
	[Dauer] [smallint] NOT NULL,
	[Preis] [money] NOT NULL,
	[QStufeID] [int] NOT NULL,
	[Komentar] [text] NULL,
 CONSTRAINT [PK_Prozeduren] PRIMARY KEY CLUSTERED 
(
	[ProzedurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Prozeduren]  WITH CHECK ADD  CONSTRAINT [FK_Prozeduren_ProzedurTypen] FOREIGN KEY([ProzedurTypID])
REFERENCES [dbo].[ProzedurTypen] ([ProzedurTypID])
GO

ALTER TABLE [dbo].[Prozeduren] CHECK CONSTRAINT [FK_Prozeduren_ProzedurTypen]
GO

ALTER TABLE [dbo].[Prozeduren]  WITH CHECK ADD  CONSTRAINT [FK_Prozeduren_QStufen] FOREIGN KEY([QStufeID])
REFERENCES [dbo].[QStufen] ([QStufeID])
GO

ALTER TABLE [dbo].[Prozeduren] CHECK CONSTRAINT [FK_Prozeduren_QStufen]
GO

