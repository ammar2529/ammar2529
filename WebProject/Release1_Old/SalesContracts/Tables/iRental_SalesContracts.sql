

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



