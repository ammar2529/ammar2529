

CREATE TABLE [dbo].[iRental_SalesContracts_Comments](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[ParentRecId] [int] NOT NULL,
	[Comments] [nvarchar](2000) NOT NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NOT NULL,
	[$ModifiedBy] [nvarchar](50) NOT NULL,
	[$DateCreated] [datetime] NOT NULL,
	[$DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_iRental_SalesContracts_Comments] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Comments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Comments_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Comments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Comments_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO



