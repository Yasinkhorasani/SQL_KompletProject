USE [Klinikum]
GO

/****** Object:  Table [dbo].[Qualifikationen]    Script Date: 24.11.2022 06:13:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Qualifikationen](
	[QualifikationID] [int] IDENTITY(1,1) NOT NULL,
	[Qualifikation] [nvarchar](50) NOT NULL,
	[QStufeID] [int] NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Qualifikation] PRIMARY KEY CLUSTERED 
(
	[QualifikationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Qualifikationen] ADD  CONSTRAINT [DF_Qualifikationen_Qstuffe]  DEFAULT ((0)) FOR [QStufeID]
GO

ALTER TABLE [dbo].[Qualifikationen]  WITH CHECK ADD  CONSTRAINT [FK_Qualifikationen_QStufen] FOREIGN KEY([QStufeID])
REFERENCES [dbo].[QStufen] ([QStufeID])
GO

ALTER TABLE [dbo].[Qualifikationen] CHECK CONSTRAINT [FK_Qualifikationen_QStufen]
GO

