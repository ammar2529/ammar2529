USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[FX_Users]    Script Date: 11/21/2023 4:55:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FX_Users](
	[UserId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Password] [varchar](1000) NOT NULL,
	[PasswordResetToken] [varchar](50) NULL,
	[UserEmail] [varchar](100) NULL,
	[OrgId] [int] NULL,
	[UnitId] [int] NULL,
	[Roles] [varchar](8000) NULL,
	[IsLocked] [int] NOT NULL,
	[IsDisabled] [int] NOT NULL,
	[ShowEmpInfo] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_User_Profile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_Users] ADD  CONSTRAINT [DF_User_Profile_IsLocked]  DEFAULT (0) FOR [IsLocked]
GO

ALTER TABLE [dbo].[FX_Users] ADD  CONSTRAINT [DF_User_Profile_IsDisabled]  DEFAULT (0) FOR [IsDisabled]
GO

ALTER TABLE [dbo].[FX_Users] ADD  CONSTRAINT [DF_FX_Users_ShowEmpInfo]  DEFAULT (0) FOR [ShowEmpInfo]
GO

ALTER TABLE [dbo].[FX_Users] ADD  CONSTRAINT [DF_User_Profile_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[FX_Users] ADD  CONSTRAINT [DF_User_Profile_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


