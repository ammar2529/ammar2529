
CREATE TABLE [dbo].[FX_Common_LOV_Child](
	[ChildId] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentTypeId] [bigint] NOT NULL,
	[SubParentTypeId] [bigint] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Description] [varchar](200) NULL,
	[Code] [varchar](5) NULL,
	[DelParentTypeId] [bigint] NULL,
	[IsDisable] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Common_LOV_Child] PRIMARY KEY CLUSTERED 
(
	[ParentTypeId] ASC,
	[SubParentTypeId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Common_LOV_Child] UNIQUE NONCLUSTERED 
(
	[ChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_Common_LOV_Child] ADD  CONSTRAINT [DF_Common_LOV_Child_SubParentTypeId]  DEFAULT (0) FOR [SubParentTypeId]
GO

ALTER TABLE [dbo].[FX_Common_LOV_Child] ADD  CONSTRAINT [DF_Common_LOV_Child_isDisabled]  DEFAULT (0) FOR [IsDisable]
GO


