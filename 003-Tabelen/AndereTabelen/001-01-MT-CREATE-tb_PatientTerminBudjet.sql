USE [Klinikum]
GO

/****** Object:  Table [dbo].[PatientTerminBudjet]    Script Date: 18.11.2022 14:28:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PatientTerminBudjet](
	[PatientTerminBudget ID] [int] NOT NULL,
	[Patient ID] [int] NOT NULL,
	[Budget] [bit] NOT NULL,
	[Kommentar] [nchar](10) NULL
) ON [PRIMARY]
GO


