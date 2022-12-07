USE [Klinikum]
GO

/****** Object:  Table [dbo].[Krankenkassen]    Script Date: 24.11.2022 06:04:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Krankenkassen](
	[KrankenkasseID] [int] IDENTITY(10,10) NOT NULL,
	[Krankenkasse] [nvarchar](15) NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_KrankenkasseID] PRIMARY KEY CLUSTERED 
(
	[KrankenkasseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

