

CREATE TABLE [dbo].[iRental_CarsForSale](
	[ChassisNo] [nvarchar](50) NOT NULL,
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[RecCode] [varchar](20) NULL,
	[CarFor] [varchar](10) NULL,
	[CarNumber] [nvarchar](10) NULL,
	[BrandId] [int] NULL,
	[ModelId] [int] NULL,
	[YearId] [int] NULL,
	[ColorId] [int] NULL,
	[TypeId] [int] NULL,
	[CurrentMileage] [int] NULL,
	[CarLocationId] [int] NULL,
	[CarStatusId] [int] NULL,
	[CurrentCondition] [nvarchar](1000) NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ChassisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_CarsForSale] ADD  CONSTRAINT [DF_iRental_CarsForSale_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_CarsForSale] ADD  CONSTRAINT [DF_iRental_CarsForSale_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO





CREATE TABLE [dbo].[iRental_SalesCarPrice](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ModelId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[Price] [decimal](9, 3) NOT NULL,
	[AdditionalAmount] [decimal](9, 3) NOT NULL,
	[Discount] [decimal](9, 3) NOT NULL,
	[Comments] [nvarchar](1000) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NOT NULL,
	[$DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_iRental_SalesCarPrice] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC,
	[ModelId] ASC,
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_AdditionalAmount]  DEFAULT ((0)) FOR [AdditionalAmount]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_Discount]  DEFAULT ((0)) FOR [Discount]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesCarPrice] ADD  CONSTRAINT [DF_iRental_SalesCarPrice_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO





CREATE TABLE [dbo].[iRental_SalesContracts](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[RecCode] [varchar](20) NULL,
	[CustomerRecCode] [varchar](20) NOT NULL,
	[ChassisNo] [varchar](50) NULL,
	[CarRateType] [int] NULL,
	[CarRate] [decimal](15, 3) NULL,
	[CarAllowedKM] [bigint] NULL,
	[CarExtraKMRate] [decimal](15, 3) NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractStartDay] [nvarchar](50) NULL,
	[ContractEndDate] [datetime] NULL,
	[ContractEndDay] [nvarchar](50) NULL,
	[ContractEndTime] [nvarchar](5) NULL,
	[ContractStartTime] [nvarchar](5) NULL,
	[ContractExpiryDate] [datetime] NULL,
	[ContractDays] [int] NULL,
	[ActualContractDays] [int] NULL,
	[CarPreviousKM] [int] NULL,
	[ContractKMOut] [int] NULL,
	[ContractKMIn] [int] NULL,
	[ContractExtraKM] [int] NULL,
	[ContractExtraKMCharges] [decimal](15, 3) NULL,
	[ContractPeriodCharges] [decimal](15, 3) NULL,
	[ContractOtherCharges] [decimal](15, 3) NULL,
	[ContractDiscount] [decimal](15, 3) NULL,
	[ContractTotalCharges] [decimal](15, 3) NULL,
	[TotalPaidByCustomer] [decimal](15, 3) NULL,
	[OutLocationId] [int] NULL,
	[InLocationId] [int] NULL,
	[ReservationDays] [int] NULL,
	[ReservationAmount] [decimal](9, 3) NULL,
	[ReservationDate] [datetime] NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_iRental_SalesContracts] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO





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





CREATE TABLE [dbo].[iRental_SalesContracts_OtherCharges](
	[RecId] [int] IDENTITY(1,1) NOT NULL,
	[ParentRecId] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Charges] [decimal](15, 3) NOT NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NOT NULL,
	[$ModifiedBy] [nvarchar](50) NOT NULL,
	[$DateCreated] [datetime] NOT NULL,
	[$DateModified] [datetime] NOT NULL,
 CONSTRAINT [PK_iRental_SalesContracts_OtherCharges] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_OtherCharges] ADD  CONSTRAINT [DF_iRental_SalesContracts_OtherCharges_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_OtherCharges] ADD  CONSTRAINT [DF_iRental_SalesContracts_OtherCharges_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO





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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_PaymentTpye]  DEFAULT ((0)) FOR [PaymentType]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments_Audit] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_Audit_$DateTime]  DEFAULT (getdate()) FOR [$DateTime]
GO

ALTER TABLE [dbo].[iRental_SalesContracts_Payments_Audit] ADD  CONSTRAINT [DF_iRental_SalesContracts_Payments_Audit_PaymentType]  DEFAULT ((0)) FOR [PaymentType]

GO



