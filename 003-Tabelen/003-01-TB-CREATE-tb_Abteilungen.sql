USE [Klinikum]
GO

/****** Object:  Table [dbo].[Abteilungen]    Script Date: 24.11.2022 06:01:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Abteilungen](
	[AbteilungsID] [int] IDENTITY(10,10) NOT NULL,
	[Abteilung] [nvarchar](50) NOT NULL,
	[Medabteilung] [bit] NOT NULL,
	[Kommentar] [ntext] NULL,
 CONSTRAINT [PK_AbteilungsID] PRIMARY KEY CLUSTERED 
(
	[AbteilungsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Abteilungen] ADD  CONSTRAINT [DF_Abteilungen_Medabteilung]  DEFAULT ((1)) FOR [Medabteilung]
GO

