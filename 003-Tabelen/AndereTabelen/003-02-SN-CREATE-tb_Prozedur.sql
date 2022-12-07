USE [Klinikum]
GO

/****** Object:  Table [dbo].[Prozeduren]    Script Date: 18.11.2022 13:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prozeduren](
	[ProzedurenID] [int] NOT NULL,
	[ProzName] [nvarchar](50) NULL,
	[ProzTypeID] [int] NULL,
	[GebitID] [int] NULL,
	[ProzeBeschreibung] [nvarchar](50) NULL,
	[NormDauer] [int] NULL,
	[Komentar] [nvarchar](50) NULL
) ON [PRIMARY]
GO

