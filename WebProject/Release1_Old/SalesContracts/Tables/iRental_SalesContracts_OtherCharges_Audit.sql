

CREATE TABLE [dbo].[iRental_SalesContracts_OtherCharges_Audit](
	[AuditTrailId] [bigint] IDENTITY(1,1) NOT NULL,
	[$UserId] [nvarchar](50) NOT NULL,
	[$DateTime] [datetime] NOT NULL,
	[$IP] [nvarchar](50) NULL,
	[RecId] [int] NOT NULL,
	[ParentRecId] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Charges] [decimal](15, 3) NOT NULL,
	[$StateId] [varchar](50) NULL,
 CONSTRAINT [PK_iRental_SalesContracts_OtherCharges_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditTrailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_OtherCharges_Audit] ADD  CONSTRAINT [DF_iRental_SalesContracts_OtherCharges_Audit_$DateTime]  DEFAULT (getdate()) FOR [$DateTime]

GO



