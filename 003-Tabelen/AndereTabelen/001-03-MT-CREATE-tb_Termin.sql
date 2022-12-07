USE [Klinikum]
GO

/****** Object:  Table [dbo].[Termin]    Script Date: 18.11.2022 14:28:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Termin](
	[Termin ID] [int] NOT NULL,
	[Terminzuordnung ID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[Zeit] [datetime] NOT NULL,
	[Kommentar] [nchar](10) NULL,
 CONSTRAINT [PK_Termin] PRIMARY KEY CLUSTERED 
(
	[Termin ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


