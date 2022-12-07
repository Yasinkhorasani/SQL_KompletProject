USE [Klinikum]
GO

/****** Object:  Table [dbo].[KlinikumRoutine]    Script Date: 18.11.2022 14:25:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KlinikumRoutine](
	[KlinikumRoutineID] [int] NOT NULL,
	[PersonalID] [int] NOT NULL,
	[DatumID] [int] NULL,
	[ProzedurenID] [int] NULL,
	[PatientenID] [int] NULL,
 CONSTRAINT [PK_KlinikumRoutine] PRIMARY KEY CLUSTERED 
(
	[KlinikumRoutineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

