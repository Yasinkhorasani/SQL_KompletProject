USE [Klinikum]
GO

/****** Object:  Table [dbo].[Krankenkassen]    Script Date: 18.11.2022 07:00:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Krankenkassen](
	[KrankenkasseID] [int] IDENTITY(1,1) NOT NULL,
	[Krankenkasse] [nchar](50) NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Krankenkassen] PRIMARY KEY CLUSTERED 
(
	[KrankenkasseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

