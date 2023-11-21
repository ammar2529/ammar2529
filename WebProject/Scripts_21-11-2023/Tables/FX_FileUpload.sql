USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[FX_FileUpload]    Script Date: 11/21/2023 4:45:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FX_FileUpload](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileGuid] [uniqueidentifier] NULL,
	[FileName] [varchar](500) NULL,
	[FileSize] [varchar](50) NULL,
	[DocType] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](256) NULL,
	[$ModifiedBy] [nvarchar](256) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_FX_FileUpload] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_FileUpload] ADD  CONSTRAINT [DF_FX_FileUpload_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[FX_FileUpload] ADD  CONSTRAINT [DF_FX_FileUpload_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


