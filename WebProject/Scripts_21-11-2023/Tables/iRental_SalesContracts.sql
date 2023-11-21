USE [OnlineSolutionsDevVMM]
GO

/****** Object:  Table [dbo].[iRental_SalesContracts]    Script Date: 11/21/2023 4:57:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[iRental_SalesContracts](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[RecCode] [varchar](20) NULL,
	[CustomerRecCode] [varchar](20) NOT NULL,
	[ChassisNo] [varchar](50) NULL,
	[CarType] [varchar](10) NULL,
	[PaymenteMethod] [varchar](50) NULL,
	[FinanceCompany] [varchar](50) NULL,
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
	[ContractExpiryDay] [nvarchar](50) NULL,
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
	[ContractExpiryTime] [nvarchar](50) NULL,
	[ReservationDays] [int] NULL,
	[ReservationAmount] [decimal](9, 3) NULL,
	[ReservationDate] [datetime] NULL,
	[ReservationWeekDays] [nvarchar](50) NULL,
	[ReservationExpireTime] [nvarchar](50) NULL,
	[ContractDate] [datetime] NULL,
	[ContractWeekDay] [nvarchar](50) NULL,
	[ContractTime] [nvarchar](50) NULL,
	[DeliveryDate] [datetime] NULL,
	[DeliveryWeekDays] [nvarchar](50) NULL,
	[DeliveryTime] [nvarchar](50) NULL,
	[EngineWarranty] [decimal](9, 3) NULL,
	[EnginYearsWarranty] [varchar](50) NULL,
	[GearWarranty] [decimal](9, 3) NULL,
	[GearYearsWarranty] [varchar](50) NULL,
	[CarWarranty] [decimal](9, 3) NULL,
	[CarYearsWarranty] [varchar](50) NULL,
	[CarOwnerName] [varchar](50) NULL,
	[CarReplacement] [varchar](10) NULL,
	[fComments] [nvarchar](2000) NULL,
	[FileGuid] [uniqueidentifier] NULL,
	[Price] [decimal](9, 3) NULL,
	[AdditionalAmount] [decimal](9, 3) NULL,
	[Discount] [decimal](9, 3) NULL,
	[TotalAmount] [decimal](11, 3) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]
GO


