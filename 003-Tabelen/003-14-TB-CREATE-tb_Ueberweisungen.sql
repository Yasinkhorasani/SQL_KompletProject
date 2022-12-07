USE [Klinikum]
GO

/****** Object:  Table [dbo].[Ueberweisungen]    Script Date: 24.11.2022 06:15:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ueberweisungen](
	[UeberweisungID] [int] NOT NULL,
	[UeberweisungNummer] [int] IDENTITY(1,1) NOT NULL,
	[CaseRrozID] [int] NULL,
	[Beschreibung] [nchar](50) NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Ueberweisungen] PRIMARY KEY CLUSTERED 
(
	[UeberweisungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ueberweisungen]  WITH CHECK ADD  CONSTRAINT [FK_Ueberweisungen_Cases-Prozeduren] FOREIGN KEY([CaseRrozID])
REFERENCES [dbo].[Cases-Prozeduren] ([ID])
GO

ALTER TABLE [dbo].[Ueberweisungen] CHECK CONSTRAINT [FK_Ueberweisungen_Cases-Prozeduren]
GO

