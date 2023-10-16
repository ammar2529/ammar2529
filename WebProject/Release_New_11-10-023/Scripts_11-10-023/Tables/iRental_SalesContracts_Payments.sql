

CREATE TABLE [dbo].[iRental_SalesContracts_Payments](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[LocationReceiptId] [varchar](50) NULL,
	[ParentRecId] [int] NOT NULL,
	[ReceiptId] [int] NULL,
	[PaymentType] [int] NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentAmount] [decimal](15, 3) NOT NULL,
	[PaymentMode] [int] NOT NULL,
	[ChequeNo] [bigint] NULL,
	[AmountInWords] [nvarchar](255) NULL,
	[PaymentComments] [nvarchar](2000) NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NOT NULL,
	[$ModifiedBy] [nvarchar](50) NOT NULL,
	[$DateCreated] [datetime] NOT NULL,
	[$DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_iRental_SalesContracts_Payments] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_PaymentTpye]  DEFAULT ((0)) FOR [PaymentType]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


