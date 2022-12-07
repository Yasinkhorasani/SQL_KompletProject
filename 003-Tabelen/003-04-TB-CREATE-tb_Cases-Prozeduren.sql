USE [Klinikum]
GO

/****** Object:  Table [dbo].[Cases-Prozeduren]    Script Date: 24.11.2022 06:09:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cases-Prozeduren](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NOT NULL,
	[ProzedurID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[PersonalID] [int] NOT NULL,
	[Kommentar] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cases-Prozeduren] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cases-Prozeduren] ADD  CONSTRAINT [DF_Cases-Prozeduren_Datum]  DEFAULT (getdate()) FOR [Datum]
GO

ALTER TABLE [dbo].[Cases-Prozeduren]  WITH CHECK ADD  CONSTRAINT [FK_Cases-Prozeduren_Cases] FOREIGN KEY([CaseID])
REFERENCES [dbo].[Cases] ([CaseID])
GO

ALTER TABLE [dbo].[Cases-Prozeduren] CHECK CONSTRAINT [FK_Cases-Prozeduren_Cases]
GO

ALTER TABLE [dbo].[Cases-Prozeduren]  WITH CHECK ADD  CONSTRAINT [FK_Cases-Prozeduren_Personal] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[Personal] ([PersonalID])
GO

ALTER TABLE [dbo].[Cases-Prozeduren] CHECK CONSTRAINT [FK_Cases-Prozeduren_Personal]
GO

ALTER TABLE [dbo].[Cases-Prozeduren]  WITH CHECK ADD  CONSTRAINT [FK_Cases-Prozeduren_Prozeduren] FOREIGN KEY([ProzedurID])
REFERENCES [dbo].[Prozeduren] ([ProzedurID])
GO

ALTER TABLE [dbo].[Cases-Prozeduren] CHECK CONSTRAINT [FK_Cases-Prozeduren_Prozeduren]
GO

