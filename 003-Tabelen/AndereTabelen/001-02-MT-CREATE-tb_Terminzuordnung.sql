USE [Klinikum]
GO

/****** Object:  Table [dbo].[Terminzuordnung]    Script Date: 18.11.2022 14:28:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Terminzuordnung](
	[ID] [int] NOT NULL,
	[Krankheiten ID] [int] NOT NULL,
	[Patient ID] [int] NOT NULL,
 CONSTRAINT [PK_Terminzuordnung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


