USE [Klinikum]
GO

/****** Object:  Table [dbo].[Cases]    Script Date: 24.11.2022 06:02:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cases](
	[CaseID] [int] IDENTITY(1,1) NOT NULL,
	[CaseNummer] [uniqueidentifier] NOT NULL,
	[StartDatum] [datetime] NOT NULL,
	[PatientID] [int] NOT NULL,
	[Symptome] [text] NOT NULL,
	[EndDatum] [datetime] NULL,
	[PersonalID] [int] NOT NULL,
	[Kommentar] [text] NULL,
 CONSTRAINT [PK_Cases_1] PRIMARY KEY CLUSTERED 
(
	[CaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cases] ADD  CONSTRAINT [DF_Cases_CaseNummer]  DEFAULT (newid()) FOR [CaseNummer]
GO

ALTER TABLE [dbo].[Cases] ADD  CONSTRAINT [DF_Cases_StartDatum]  DEFAULT (getdate()) FOR [StartDatum]
GO

ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Patienten] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patienten] ([PatientID])
GO

ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Patienten]
GO

ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [FK_Cases_Personal] FOREIGN KEY([PersonalID])
REFERENCES [dbo].[Personal] ([PersonalID])
GO

ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [FK_Cases_Personal]
GO

ALTER TABLE [dbo].[Cases]  WITH CHECK ADD  CONSTRAINT [CK_Cases_StartDatum] CHECK  (([StartDatum]<=getdate()))
GO

ALTER TABLE [dbo].[Cases] CHECK CONSTRAINT [CK_Cases_StartDatum]
GO

