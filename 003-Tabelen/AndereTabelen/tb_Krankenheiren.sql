USE [Klinikum]
GO

/****** Object:  Table [dbo].[tb_Krankenheiten]    Script Date: 18.11.2022 12:49:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Krankenheiten](
	[Krankheiten ID] [int] IDENTITY(1,1) NOT NULL,
	[Krankenheiten] [nvarchar](50) NOT NULL,
	[Krankenheitsgruppen ID] [int] NOT NULL,
 CONSTRAINT [PK_tb_Krankenheiten] PRIMARY KEY CLUSTERED 
(
	[Krankheiten ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


