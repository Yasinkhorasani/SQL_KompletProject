USE [Klinikum]
GO

/****** Object:  Table [dbo].[Abteilung]    Script Date: 18.11.2022 11:41:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Abteilung](
	[AbteilungsID] [int] IDENTITY(10,10) NOT NULL,
	[Abteilung] [nvarchar](50) NOT NULL,
	[Projektabteilung] [bit] NOT NULL,
	[Kommentar] [ntext] NULL,
 CONSTRAINT [PK_Abteilung] PRIMARY KEY CLUSTERED 
(
	[AbteilungsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

