USE [Klinikum]
GO

/****** Object:  Table [dbo].[ProzedurTypen]    Script Date: 24.11.2022 06:12:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProzedurTypen](
	[ProzedurTypID] [int] IDENTITY(100,100) NOT NULL,
	[ProzedurTyp] [nvarchar](50) NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_ProzedurTypen] PRIMARY KEY CLUSTERED 
(
	[ProzedurTypID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

