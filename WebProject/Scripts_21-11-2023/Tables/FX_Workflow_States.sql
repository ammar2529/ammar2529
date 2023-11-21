USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[FX_Workflow_States]    Script Date: 11/21/2023 4:48:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FX_Workflow_States](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [varchar](50) NULL,
	[StateId] [varchar](50) NULL,
	[StateName] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_FX_Workflow_State] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_Workflow_States] ADD  CONSTRAINT [DF_FX_Workflow_State_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[FX_Workflow_States] ADD  CONSTRAINT [DF_FX_Workflow_State_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


