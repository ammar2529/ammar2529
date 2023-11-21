USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[FX_Roles]    Script Date: 11/21/2023 4:47:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FX_Roles](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[MenuId] [int] NULL,
	[RoleId] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsDisabled] [int] NOT NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_FX_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_Roles] ADD  CONSTRAINT [DF_FX_Roles_IsDisabled]  DEFAULT (0) FOR [IsDisabled]
GO

ALTER TABLE [dbo].[FX_Roles] ADD  CONSTRAINT [DF_FX_Roles_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[FX_Roles] ADD  CONSTRAINT [DF_FX_Roles_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


