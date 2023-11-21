

/****** Object:  Table [dbo].[iRental_SalesContracts_Payments_Audit]    Script Date: 11/21/2023 4:59:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[iRental_SalesContracts_Payments_Audit](
	[AuditTrailId] [bigint] IDENTITY(1,1) NOT NULL,
	[$UserId] [nvarchar](50) NOT NULL,
	[$DateTime] [datetime] NOT NULL,
	[$IP] [nvarchar](50) NULL,
	[RecId] [int] NOT NULL,
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
	[$StateId] [varchar](50) NULL,
 CONSTRAINT [PK_iRental_SalesContracts_Payments_Audit] PRIMARY KEY CLUSTERED 
(
	[AuditTrailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments_Audit] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_Audit_$DateTime]  DEFAULT (getdate()) FOR [$DateTime]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments_Audit] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_Audit_PaymentType]  DEFAULT ((0)) FOR [PaymentType]
GO


