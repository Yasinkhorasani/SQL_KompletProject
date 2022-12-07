USE [Klinikum]
GO

/****** Object:  Table [dbo].[Diagnosen]    Script Date: 24.11.2022 06:04:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Diagnosen](
	[DiagnoseID] [int] IDENTITY(1,1) NOT NULL,
	[DiagnoseNummer] [uniqueidentifier] NOT NULL,
	[CaseProzID] [int] NULL,
	[Diagnose] [nchar](50) NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Diagnosen] PRIMARY KEY CLUSTERED 
(
	[DiagnoseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Diagnosen] ADD  CONSTRAINT [DF_Diagnosen_DiagnoseNummer]  DEFAULT (newid()) FOR [DiagnoseNummer]
GO

ALTER TABLE [dbo].[Diagnosen] ADD  CONSTRAINT [DF_Diagnosen_Diagnose]  DEFAULT (N'Eine Diagnose') FOR [Diagnose]
GO

ALTER TABLE [dbo].[Diagnosen]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosen_Cases-Prozeduren] FOREIGN KEY([CaseProzID])
REFERENCES [dbo].[Cases-Prozeduren] ([ID])
GO

ALTER TABLE [dbo].[Diagnosen] CHECK CONSTRAINT [FK_Diagnosen_Cases-Prozeduren]
GO

