USE [Klinikum]
GO

/****** Object:  Table [dbo].[Rezepte]    Script Date: 24.11.2022 06:14:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Rezepte](
	[RezeptID] [int] NOT NULL,
	[RezeptNummer] [int] IDENTITY(1,1) NOT NULL,
	[CaseProzID] [int] NOT NULL,
	[Medikament] [nchar](50) NOT NULL,
	[Menge] [int] NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Rezepte] PRIMARY KEY CLUSTERED 
(
	[RezeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Rezepte] ADD  CONSTRAINT [DF_Rezepte_Menge]  DEFAULT ((1)) FOR [Menge]
GO

ALTER TABLE [dbo].[Rezepte]  WITH CHECK ADD  CONSTRAINT [FK_Rezepte_Cases-Prozeduren] FOREIGN KEY([CaseProzID])
REFERENCES [dbo].[Cases-Prozeduren] ([ID])
GO

ALTER TABLE [dbo].[Rezepte] CHECK CONSTRAINT [FK_Rezepte_Cases-Prozeduren]
GO

