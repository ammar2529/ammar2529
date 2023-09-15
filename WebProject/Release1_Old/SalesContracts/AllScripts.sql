

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






create view [dbo].[VW_Brands]
AS
select childid BrandId,Name Brand  from FX_Common_LOV_Child where ParentTypeId=2 and IsDisable=0

GO




CREATE view [dbo].[VW_CarColor]
as
select childid ColorId,Name Color  from FX_Common_LOV_Child where ParentTypeId=6  and IsDisable=0

GO





CREATE view [dbo].[VW_CarYear]
as
select childid YearId,Name CarYear  from FX_Common_LOV_Child where ParentTypeId=4  and IsDisable=0

GO




CREATE VIEW [dbo].[VW_FX_Workflow_States_Sales_Contracts]
AS
SELECT        RecId, ModuleId, StateId, StateName, [$CreatedBy], [$ModifiedBy], [$DateCreated], [$DateModified]
FROM            dbo.FX_Workflow_States
WHERE        (ModuleId = 'iRental_Sales_Contracts')

GO



CREATE VIEW [dbo].[VW_iRental_CarsForSale]
AS
SELECT        ChassisNo, RecId, RecCode, CarFor, CarNumber, BrandId, ModelId, CarYear, ColorId, TypeId, CurrentMileage AS InsuranceCompanyId, CarLocationId AS InsuranceExpiry, CarStatusId AS InsurancePolicyNo, 
                         CurrentCondition AS InsurancePolicyAmount, [$OwnerOrgId] AS InsurancePolicyValue, [$OwnerUnitId] AS FullInsuranceCompanyId, [$StateId] AS FullInsuranceExpiry, [$CreatedBy] AS FullInsurancePolicyNo, 
                         [$ModifiedBy] AS FullInsurancePolicyAmount, [$DateCreated] AS FullInsurancePolicyValue, [$DateModified] AS CurrentMileage
FROM            dbo.iRental_CarsForSale

GO



CREATE VIEW [dbo].[VW_iRental_CarsForSale_Available]
AS
SELECT        dbo.iRental_CarsForSale.ChassisNo, dbo.iRental_CarsForSale.RecId, dbo.iRental_CarsForSale.RecCode, dbo.iRental_CarsForSale.CarFor, dbo.iRental_CarsForSale.CarNumber, dbo.iRental_CarsForSale.BrandId, 
                         dbo.iRental_CarsForSale.ModelId, dbo.iRental_CarsForSale.YearId, dbo.iRental_CarsForSale.ColorId, dbo.iRental_CarsForSale.TypeId, dbo.iRental_CarsForSale.CurrentMileage, dbo.iRental_CarsForSale.CarLocationId, 
                         dbo.iRental_CarsForSale.CarStatusId, dbo.iRental_CarsForSale.CurrentCondition, dbo.iRental_CarsForSale.[$OwnerOrgId], dbo.iRental_CarsForSale.[$OwnerUnitId], dbo.iRental_CarsForSale.[$StateId], 
                         dbo.iRental_CarsForSale.[$CreatedBy], dbo.iRental_CarsForSale.[$ModifiedBy], dbo.iRental_CarsForSale.[$DateCreated], dbo.iRental_CarsForSale.[$DateModified], 
                         dbo.iRental_SalesCarPrice.Price + dbo.iRental_SalesCarPrice.AdditionalAmount - dbo.iRental_SalesCarPrice.Discount AS TotalAmount, dbo.iRental_SalesCarPrice.Price, dbo.iRental_SalesCarPrice.Discount, 
                         dbo.iRental_SalesCarPrice.AdditionalAmount
FROM            dbo.iRental_CarsForSale LEFT OUTER JOIN
                         dbo.iRental_SalesCarPrice ON dbo.iRental_CarsForSale.BrandId = dbo.iRental_SalesCarPrice.BrandId AND dbo.iRental_CarsForSale.ModelId = dbo.iRental_SalesCarPrice.ModelId AND 
                         dbo.iRental_CarsForSale.YearId = dbo.iRental_SalesCarPrice.YearId

GO



CREATE VIEW [dbo].[VW_iRental_SalesContracts_Payments]
as 
  select ParentRecId,sum(isnull(paymentamount,0)) PaymentAmount 
	  FROM [OnlineSolutions].[dbo].[iRental_SalesContracts_Payments]
	  group by ParentRecId

GO





create view [dbo].[VW_Models]
as
select childid ModelId,Name Model  from FX_Common_LOV_Child where ParentTypeId=3  and IsDisable=0

GO






/*select * from iRental_CarsForSaleForSale  
select * from iRental_CarsForSale*/
CREATE VIEW [dbo].[VW_SEL_iRental_SalesContracts_Details]
AS
SELECT        dbo.iRental_SalesContracts.RecId, dbo.iRental_SalesContracts.RecCode, dbo.iRental_SalesContracts.CustomerRecCode, dbo.iRental_SalesContracts.ChassisNo, dbo.iRental_SalesContracts.CarRateType, 
                         dbo.iRental_SalesContracts.CarRate, dbo.iRental_SalesContracts.CarAllowedKM, dbo.iRental_SalesContracts.CarExtraKMRate,
                         dbo.iRental_SalesContracts.ContractStartDate, dbo.iRental_SalesContracts.ContractStartDay, dbo.iRental_SalesContracts.ContractStartTime, dbo.iRental_SalesContracts.ContractExpiryDate, 
                          dbo.iRental_SalesContracts.ContractEndDate, dbo.iRental_SalesContracts.ContractEndDay, 
                         dbo.iRental_SalesContracts.ContractEndTime, dbo.iRental_SalesContracts.ContractDays, dbo.iRental_SalesContracts.ActualContractDays, dbo.iRental_SalesContracts.CarPreviousKM, 
                         dbo.iRental_SalesContracts.ContractKMOut, dbo.iRental_SalesContracts.ContractKMIn, dbo.iRental_SalesContracts.ContractExtraKM, dbo.iRental_SalesContracts.ContractExtraKMCharges, 
                         dbo.iRental_SalesContracts.ContractPeriodCharges, dbo.iRental_SalesContracts.ContractOtherCharges, dbo.iRental_SalesContracts.ContractDiscount, dbo.iRental_SalesContracts.ContractTotalCharges, 
                         dbo.iRental_SalesContracts.TotalPaidByCustomer, dbo.iRental_SalesContracts.OutLocationId, dbo.iRental_SalesContracts.InLocationId, dbo.iRental_SalesContracts.ReservationDays, 
                         dbo.iRental_SalesContracts.ReservationAmount, dbo.iRental_SalesContracts.ReservationDate, dbo.iRental_SalesContracts.[$OwnerOrgId], dbo.iRental_SalesContracts.[$OwnerUnitId], dbo.iRental_SalesContracts.[$StateId], 
                         dbo.iRental_SalesContracts.[$CreatedBy], dbo.iRental_SalesContracts.[$ModifiedBy], dbo.iRental_SalesContracts.[$DateCreated], dbo.iRental_SalesContracts.[$DateModified], dbo.iRental_Customers.CustomerType, 
                         dbo.iRental_Customers.Gender, dbo.iRental_Customers.CustomerName, dbo.iRental_Customers.Nationality, dbo.iRental_Customers.PassportNo, dbo.iRental_Customers.NationalIDNo, 
                         dbo.iRental_Customers.DrivingLicenseNo, dbo.iRental_Customers.WorkTelephone, dbo.iRental_Customers.ResidenceTelephone, dbo.iRental_Customers.MobileTelephone1, dbo.iRental_Customers.MobileTelephone2, 
                         dbo.VW_iRental_CarsForSale_Available.CarNumber, dbo.VW_iRental_CarsForSale_Available.BrandId, dbo.VW_iRental_CarsForSale_Available.ModelId, dbo.VW_iRental_CarsForSale_Available.ColorId, 
                         dbo.VW_iRental_CarsForSale_Available.TypeId, dbo.VW_iRental_CarsForSale_Available.CurrentMileage, dbo.VW_Models.Model, dbo.VW_CarColor.Color, dbo.VW_Type.Type, dbo.VW_Brands.Brand, dbo.VW_CarYear.CarYear, 
                         dbo.VW_FX_Workflow_States_Sales_Contracts.StateName, dbo.VW_FX_Workflow_States_Sales_Contracts.StateId, dbo.VW_iRental_SalesContracts_Payments.PaymentAmount, dbo.VW_iRental_CarsForSale_Available.Price, 
                         dbo.VW_iRental_CarsForSale_Available.Discount, dbo.VW_iRental_CarsForSale_Available.AdditionalAmount, dbo.VW_iRental_CarsForSale_Available.TotalAmount
FROM            dbo.VW_FX_Workflow_States_Sales_Contracts RIGHT OUTER JOIN
                         dbo.iRental_SalesContracts LEFT OUTER JOIN
                         dbo.VW_iRental_SalesContracts_Payments ON dbo.iRental_SalesContracts.RecId = dbo.VW_iRental_SalesContracts_Payments.ParentRecId ON 
                         dbo.VW_FX_Workflow_States_Sales_Contracts.StateId = dbo.iRental_SalesContracts.[$StateId] LEFT OUTER JOIN
                         dbo.iRental_Customers ON dbo.iRental_SalesContracts.CustomerRecCode = dbo.iRental_Customers.RecCode LEFT OUTER JOIN
                         dbo.VW_iRental_CarsForSale_Available LEFT OUTER JOIN
                         dbo.VW_CarColor ON dbo.VW_iRental_CarsForSale_Available.ColorId = dbo.VW_CarColor.ColorId LEFT OUTER JOIN
                         dbo.VW_CarYear ON dbo.VW_iRental_CarsForSale_Available.YearId = dbo.VW_CarYear.YearId LEFT OUTER JOIN
                         dbo.VW_Brands ON dbo.VW_iRental_CarsForSale_Available.BrandId = dbo.VW_Brands.BrandId LEFT OUTER JOIN
                         dbo.VW_Type ON dbo.VW_iRental_CarsForSale_Available.TypeId = dbo.VW_Type.TypeId ON dbo.iRental_SalesContracts.ChassisNo = dbo.VW_iRental_CarsForSale_Available.ChassisNo LEFT OUTER JOIN
                         dbo.VW_Models ON dbo.VW_iRental_CarsForSale_Available.ModelId = dbo.VW_Models.ModelId

GO




create view [dbo].[VW_Type]
as
select childid TypeId,Name Type  from FX_Common_LOV_Child where ParentTypeId=5  and IsDisable=0

GO





CREATE proc [dbo].[INS_iRental_CarsForSales_SP]
 @ChassisNo nvarchar(50),  
 @RecId int,  
 @CarFor varchar(10),  
 @CarNumber nvarchar(10),  
 @BrandId int,  
 @ModelId int,  
 @TypeId int,  
 @CarYear int,  
 @ColorId int,  
 @CurrentMileage int,  
 @CarLocationId int,  
 @CarStatusId int,  
 @CurrentCondition nvarchar(1000),  
  
 @RowsToDelete varchar(1000),  
 @__UserId varchar(50),  
 @Status varchar(200) out  
  
as
begin
		INSERT INTO iRental_CarsForSale
            (ChassisNo, CarNumber, BrandId, ModelId, TypeId, YearId, ColorId, CurrentMileage,   
             CarLocationId, CarStatusId, CurrentCondition, [$CreatedBy], [$ModifiedBy])  
        VALUES     
            (@ChassisNo,@CarNumber, @BrandId, @ModelId, @TypeId, @CarYear, @ColorId, @CurrentMileage,  
           @CarLocationId, @CarStatusId, @CurrentCondition, @__UserId, @__UserId);
		set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Insert Successfully'
end

GO





--[iRental_CarsForSale_SP] 0000,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
CREATE PROC [dbo].[iRental_CarsForSale_SP]
	@RecId int,
	@__UserId nvarchar(50),	
	@CarFor varchar(10),
	@CarNumber nvarchar(10),
	@ChassisNo nvarchar(50),
	@BrandId int,
	@ModelId int,
	@TypeId int,
	@CarYear int,
	@CarLocationId int,
	@InsuranceCompanyId int,
	@FullInsuranceCompanyId int,
	@NormalInsuranceExpiryDays int,
	@FullInsuranceExpiryDays int,
	@CarStatusId int
as 


begin 
	SELECT        ChassisNo, RecCode, CarFor, CarNumber, BrandId, ModelId, CarYear, ColorId, TypeId, InsuranceCompanyId, InsuranceExpiry, InsurancePolicyNo, InsurancePolicyAmount, InsurancePolicyValue, FullInsuranceCompanyId, 
                         FullInsuranceExpiry, FullInsurancePolicyNo, FullInsurancePolicyAmount, FullInsurancePolicyValue, CurrentMileage, CarLocationId, CarStatusId, CurrentCondition, [$OwnerOrgId], [$OwnerUnitId], [$StateId], [$CreatedBy], 
                         [$ModifiedBy], [$DateCreated], [$DateModified], RecId
FROM            iRental_CarsForSale
end

GO






--[SEL_iRental_CarsForSale_SP] null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null,null,null,null,null
--[SEL_iRental_CarsForSale_SP] '4444',null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null,null,null,null,null
CREATE PROC [dbo].[SEL_iRental_CarsForSale_SP]
	@ChassisNo nvarchar(50),
	@RecId int,
	@CarFor varchar(10),
	@CarNumber nvarchar(10),
	@BrandId int,
	@ModelId int,
	@TypeId int,
	@CarYear int,
	@CarLocationId int,
	@InsuranceCompanyId int,
	@FullInsuranceCompanyId int,
	@NormalInsuranceExpiryDays int,
	@FullInsuranceExpiryDays int,
	@CarStatusId int,
	@__UserId nvarchar(50)

as 

if @ChassisNo is null

begin 

	SELECT        cfs.ChassisNo, cfs.CarNumber, LVBrand.Name as BrandId , LVModel.Name as ModelId, LVYear.Name as CarYear, LVColor.Name as Color, LVType.Name as TypeId,
				  cfs.CurrentMileage, LVLocation.Name as CarLocationId, LVStatus.Name as CarStatusId, isNull(CFA.Price,0) Price,isNull(CFA.AdditionalAmount,0) AdditionalAmount,
				  isNull(CFA.Discount,0) Discount,isNull(CFA.TotalAmount,0) TotalAmount,cfs.RecId
	FROM					 iRental_CarsForSale as cfs Left outer join 
	                         FX_Common_LOV_Child as LVBrand on cfs.BrandId  = LVBrand.ChildId Left outer join 
						     FX_Common_LOV_Child as LVModel on cfs.ModelId = LVModel.ChildId left outer join
							 FX_Common_LOV_Child as LVYear on cfs.YearId = LVYear.ChildId left outer join
							 FX_Common_LOV_Child as LVColor on  cfs.ColorId = LVColor.ChildId left outer join
							 FX_Common_LOV_Child as LVType on  cfs.TypeId = LVType.ChildId left outer join 
							 FX_Common_LOV_Child as LVStatus on  cfs.CarStatusId = LVStatus.ChildId left outer join
							 FX_Common_LOV_Child as LVLocation on   cfs.CarLocationId = LVLocation.ChildId  left outer join
							 VW_iRental_CarsForSale_Available as CFA on cfs.ChassisNo = CFA.ChassisNo


end


else
begin
--declare @ChassisNo varchar(50) = '4444'
print @ChassisNo
	SELECT       CSF.ChassisNo, CSF.CarNumber, CSF.BrandId, CSF.ModelId, CSF.YearId, CSF.ColorId, CSF.TypeId, CSF.CurrentMileage, CSF.CarLocationId,
				 CSF.CarStatusId,isNull(CFA.Price,0) Price, isNull(CFA.AdditionalAmount,0) AdditionalAmount,isNull(CFA.TotalAmount,0) TotalAmount,isNull(CFA.Discount,0) Discount,
				CSF.[$OwnerOrgId], 
				 CSF.[$OwnerUnitId], CSF.[$StateId], CSF.[$CreatedBy], CSF.[$ModifiedBy], CSF.[$DateCreated], CSF.[$DateModified], 
                         CSF.CurrentCondition
	FROM            iRental_CarsForSale as CSF LEFT OUTER JOIN 
						VW_iRental_CarsForSale_Available as CFA on CSF.ChassisNo = CFA.ChassisNo 
					where @ChassisNo = CSF.ChassisNo


end



GO





CREATE  PROCEDURE [dbo].[SEL_iRental_Contracts_Customers_SP]   
	@Search nvarchar(200)
			
AS

SELECT     RecCode, CustomerName, NationalIDNo, MobileTelephone1, CustomerStatus, CONVERT(varchar, NationalIDExpiryDate, 103) AS NationalIDExpiryDate, Gender, DrivingLicenseNo, CONVERT(varchar, DrivingLicenseExpiry, 103) AS DrivingLicenseExpiry, PassportNo, CONVERT(varchar, PassportExpiry, 103) AS PassportExpiry, 
	                     WorkTelephone, ResidenceTelephone, MobileTelephone2,
CASE when CustomerType = 'Local' THEN 'Local Residence'  when CustomerType = 'International' THEN 'International - On Visit' ELSE '' END AS CustomerType,

                      FX_Common_LOV_Child.Name AS Nationality,RecCode CustomerRecCode
FROM         iRental_Customers LEFT OUTER JOIN
                      FX_Common_LOV_Child ON iRental_Customers.Nationality = FX_Common_LOV_Child.ChildId

where	(RecCode like '%' + @Search+ '%' or @Search is null) or
	(CustomerName like '%' + @Search+ '%' or @Search is null) or
	(cast (NationalIDNo as nvarchar(200))= @Search or @Search is null) or
	(cast (MobileTelephone1 as nvarchar(200)) =@Search or @Search is null)


	select * from iRental_Customers

GO





CREATE PROC [dbo].[SEL_iRental_SalesCarPrice_SP] 
@RecId bigint

AS

if @RecId is not null
BEGIN

SELECT        RecId, BrandId, ModelId, YearId, Price, AdditionalAmount, Discount, Comments
FROM            iRental_SalesCarPrice where @RecId =  RecId
END

BEGIN
	
	SET NOCOUNT ON;

SELECT       LvBrand.Name as BrandId,LVModel.Name as ModelId,LvYear.Name as YearId, Price, AdditionalAmount, Discount, Comments
FROM            iRental_SalesCarPrice as SCP	INNER JOIN
					FX_Common_LOV_Child as LvBrand on Scp.BrandId =  LvBrand.ChildId INNER JOIN 
					FX_Common_LOV_Child as LVModel on Scp.ModelId =  LVModel.ChildId INNER JOIN
					FX_Common_LOV_Child as LvYear on Scp.YearId =  LvYear.ChildId 	


END

GO






CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Comments_SP]   
	@RecId int,
	@ParentRecId int
			
AS


IF @RecId is not NULL
BEGIN

SELECT    RecId, ParentRecId, Comments
FROM         iRental_SalesContracts_Comments Where RecId = @RecId

END
ELSE
BEGIN

SELECT     
	iRental_SalesContracts_Comments.RecId, 
	iRental_SalesContracts_Comments.ParentRecId, 
	iRental_SalesContracts_Comments.Comments, 
	CONVERT(varchar, iRental_SalesContracts_Comments.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Comments.[$DateCreated], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_Comments LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Comments.[$CreatedBy] = FX_Users.UserId

where	(iRental_SalesContracts_Comments.ParentRecId  =@ParentRecId)

order by recid desc
END

GO




CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_OtherCharges_Audit_SP]   
	@RecId int
			
AS

SELECT     
	iRental_SalesContracts_OtherCharges_Audit.AuditTrailId,
	iRental_SalesContracts_OtherCharges_Audit.[$StateId]  as StateId,
	iRental_SalesContracts_OtherCharges_Audit.RecId, 
	iRental_SalesContracts_OtherCharges_Audit.ParentRecId, 
	iRental_SalesContracts_OtherCharges_Audit.Description,
	iRental_SalesContracts_OtherCharges_Audit.Charges,
	CONVERT(varchar, iRental_SalesContracts_OtherCharges_Audit.[$DateTime], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_OtherCharges_Audit.[$DateTime], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_OtherCharges_Audit LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_OtherCharges_Audit.[$UserId] = FX_Users.UserId

where	(iRental_SalesContracts_OtherCharges_Audit.RecId  =@RecId)

order by AuditTrailId

GO





CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_OtherCharges_SP]   
	@RecId int,
	@ParentRecId bigint
			
AS


IF @RecId is not NULL
BEGIN

SELECT    RecId, ParentRecId, Description,Charges
FROM         iRental_SalesContracts_OtherCharges Where RecId = @RecId

END
ELSE
BEGIN

SELECT     
iRental_SalesContracts_OtherCharges.RecId, 
iRental_SalesContracts_OtherCharges.ParentRecId, 
iRental_SalesContracts_OtherCharges.Description,
iRental_SalesContracts_OtherCharges.Charges,
CONVERT(varchar, iRental_SalesContracts_OtherCharges.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_OtherCharges.[$DateCreated], 108),5)  AS DateCreated,

FX_Users.Name AS CreatedBy,
iRental_SalesContracts_OtherCharges.[$StateId]  as StateId

FROM         iRental_SalesContracts_OtherCharges LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_OtherCharges.[$CreatedBy] = FX_Users.UserId

where	(iRental_SalesContracts_OtherCharges.ParentRecId  =@ParentRecId)

order by recid desc
END

GO





CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Payments_Audit_SP]   
	@RecId int
			
AS

SELECT     
	iRental_SalesContracts_Payments_Audit.AuditTrailId,
	iRental_SalesContracts_Payments_Audit.[$StateId]  as StateId,
	iRental_SalesContracts_Payments_Audit.RecId, 
	iRental_SalesContracts_Payments_Audit.ParentRecId, 
	CONVERT(varchar, iRental_SalesContracts_Payments_Audit.PaymentDate, 103)  AS PaymentDate,

	CASE when iRental_SalesContracts_Payments_Audit.PaymentType = 0 THEN 'Receipt'  ELSE 'Return' END AS PaymentType_Audit,
	FX_Common_LOV_Child.Name AS PaymentMode, 
	iRental_SalesContracts_Payments_Audit.ChequeNo,
	iRental_SalesContracts_Payments_Audit.PaymentAmount, 
	iRental_SalesContracts_Payments_Audit.ReceiptId, 
	CONVERT(varchar, iRental_SalesContracts_Payments_Audit.[$DateTime], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Payments_Audit.[$DateTime], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_Payments_Audit LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Payments_Audit.[$UserId] = FX_Users.UserId LEFT OUTER JOIN
                      FX_Common_LOV_Child ON iRental_SalesContracts_Payments_Audit.PaymentMode = FX_Common_LOV_Child.ChildId

where	(iRental_SalesContracts_Payments_Audit.RecId  =@RecId)


order by AuditTrailId

GO





/*
select * from iRental_SalesContracts_Payments
[SEL_iRental_SalesContracts_Payments_SP] 1, null
*/
CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Payments_SP]   
	@RecId int,
	@ParentRecId int
			
AS

IF @RecId is not NULL
BEGIN

SELECT    RecId,LocationReceiptId,ParentRecId, PaymentType, PaymentMode, ChequeNo, PaymentAmount, ReceiptId, AmountInWords,
	      CONVERT(varchar, PaymentDate, 103)  AS PaymentDate,PaymentComments
FROM         iRental_SalesContracts_Payments Where RecId = @RecId

END
ELSE
BEGIN

SELECT      RecId  PrintId,
	iRental_SalesContracts_Payments.RecId, 
	iRental_SalesContracts_Payments.LocationReceiptId,
	iRental_SalesContracts_Payments.ParentRecId, 
	CONVERT(varchar, iRental_SalesContracts_Payments.PaymentDate, 103)  AS PaymentDate,
	CASE when iRental_SalesContracts_Payments.PaymentType = 0 THEN 'Receipt'  ELSE 'Return' END AS PaymentType,
	FX_Common_LOV_Child.Name AS PaymentMode, 
	iRental_SalesContracts_Payments.ChequeNo,
	iRental_SalesContracts_Payments.PaymentAmount, 
	iRental_SalesContracts_Payments.ReceiptId, 
	CONVERT(varchar, iRental_SalesContracts_Payments.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Payments.[$DateCreated], 108),5)  AS DateCreated,
	FX_Users.Name AS CreatedBy, 
	iRental_SalesContracts_Payments.[$StateId]  as StateId

FROM         iRental_SalesContracts_Payments LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Payments.[$CreatedBy] = FX_Users.UserId LEFT OUTER JOIN
                      FX_Common_LOV_Child ON iRental_SalesContracts_Payments.PaymentMode = FX_Common_LOV_Child.ChildId

where	(iRental_SalesContracts_Payments.ParentRecId  =@ParentRecId)

order by recid desc
END

GO





--[SEL_iRental_SalesContracts_SP] 3, null,null,null,null, null,null,null,null,null,null,null
--select * from iRental_SalesContracts

CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_SP]   
	@RecId int,
	@__UserId nvarchar(50),
	@RecCode varchar(20),
	@CarNumber nvarchar(10),
	@BrandId int,
	@ModelId int,
	@CarYearId int,
	@OutLocationId int,
	@NationalIDNo nvarchar(50),
	@CustomerName nvarchar(200),
	@CreatedBy nvarchar(255),
	@StateId varchar(255)
			
AS

IF @RecId is not NULL
BEGIN

		SELECT     
		RecId,RecCode,[$CreatedBy] CreatedBy, StateId, StateName, CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,
		 OutLocationId, InLocationId,
		CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate, ContractStartDay, ContractStartTime,
		CONVERT(varchar, ContractExpiryDate, 103)  AS ContractExpiryDate, ContractDays,
		CONVERT(varchar, ContractEndDate, 103)  AS ContractEndDate, ContractEndDay, ContractEndTime, ActualContractDays,

		CarPreviousKM, CarRateType, CarRate, CarAllowedKM, CarExtraKMRate,
		ContractKMOut, ContractKMIn,
		ContractExtraKM, ContractExtraKMCharges, 
		ContractPeriodCharges, ContractOtherCharges, ContractDiscount, ContractTotalCharges, TotalPaidByCustomer,
		CarNumber, ChassisNo, Brand BrandId, Model ModelId, CarYear,Color , isNull(Price,0) Price, isNull(Discount,0) Discount,isNull(AdditionalAmount,0) AdditionalAmount,isNull(TotalAmount,0) TotalAmount, [Type] TypeId,isNull(PaymentAmount,0) PaymentAmount,
		--'3rd - ' +CONVERT(varchar, InsuranceExpiry, 103)  AS InsuranceExpiry,
		--'Full - '+CONVERT(varchar, FullInsuranceExpiry, 103)  AS FullInsuranceExpiry,
		CustomerRecCode, CustomerName, Gender, Nationality, 
		WorkTelephone, 
		ResidenceTelephone, 
		MobileTelephone1, 
		MobileTelephone2, 
		--EmailAddress,
		--Address,
		PassportNo, --CONVERT(varchar, PassportExpiry, 103)  AS PassportExpiry,
		NationalIDNo, --CONVERT(varchar, NationalIDExpiryDate, 103)  AS NationalIDExpiryDate,
		DrivingLicenseNo, --CONVERT(varchar, DrivingLicenseExpiry, 103)  AS DrivingLicenseExpiry,
		CASE when CustomerType = 'Local' THEN 'Local Residence'  when CustomerType = 'International' THEN 'International - On Visit' ELSE '' END AS CustomerType

FROM        VW_SEL_iRental_SalesContracts_Details Where RecId= @RecId

END
ELSE
BEGIN

IF EXISTS (SELECT     roles
                        FROM         FX_Users
                        WHERE     UserId = @__UserId AND roles LIKE '%iRen_Contracts_Lawyer%') 
Begin
	if @StateId is null
		Set @StateId = 'RRCWithLegalContractOpenCarOut,RRCWithLegalContractOpenCarIn,RRCWithLegalContractClosedPendingPayment'
	else
	BEGIN
		IF NOT ( @StateId  ='RRCWithLegalContractOpenCarOut' OR @StateId  ='RRCWithLegalContractOpenCarIn' OR @StateId  ='RRCWithLegalContractClosedPendingPayment')
		Set @StateId = 'Dummy'

	END
End


SELECT    top 500 RecId, RecCode, CarNumber, Brand, Model, CarYear, CustomerName, CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate,  [$CreatedBy], StateName,
	ContractStartTime,Nationality,
	MobileTelephone1,
	MobileTelephone2,
	CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,
	LEFT(CONVERT(varchar,  [$DateCreated], 108),5)  AS DateCreatedTime,
	NationalIDNo, isnull(ContractTotalCharges,0) as ContractTotalCharges , 0 as TotalAmountDue

FROM           VW_SEL_iRental_SalesContracts_Details
	where	
	(RecCode like '%' + @RecCode+ '%' or @RecCode is null) and
	(CarNumber like '%' + @CarNumber+ '%' or @CarNumber is null) and
	(BrandId= @BrandId or @BrandId is null) and
	(ModelId= @ModelId or @ModelId is null) and
	(CarYear= @CarYearId or @CarYearId is null) and
	(OutLocationId= @OutLocationId or @OutLocationId is null) and
	(NationalIDNo= @NationalIDNo or @NationalIDNo is null) and
	(CustomerName like '%' + @CustomerName+ '%' or @CustomerName is null) and
	([$CreatedBy] like '%' + @CreatedBy+ '%' or @CreatedBy is null) and
	(
		StateId in(select RTD.value   
			from [dbo].[Split](@StateId,',') RTD)

	or @StateId is null)

order by RecId Desc
	

/*
SELECT     iRental_Cars_Rates.RecId,
FX_Common_LOV_Child_1.Name AS RateTypeId,
FX_Common_LOV_Child_2.Name AS BrandId,
FX_Common_LOV_Child_3.Name AS ModelId,
FX_Common_LOV_Child_4.Name  AS CarYear, 
iRental_Cars_Rates.Rate,
iRental_Cars_Rates.AllowedKM, 
iRental_Cars_Rates.ExtraKMRate,

CASE WHEN iRental_Cars_Rates.IsDisable = 0 THEN 'No' ELSE 'Yes' END AS IsDisable

FROM         iRental_Cars_Rates

LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_1 ON iRental_Cars_Rates.RateTypeId = FX_Common_LOV_Child_1.ChildId
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_2 ON iRental_Cars_Rates.BrandId = FX_Common_LOV_Child_2.ChildId
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_3 ON iRental_Cars_Rates.ModelId = FX_Common_LOV_Child_3.ChildId
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_4 ON iRental_Cars_Rates.CarYear = FX_Common_LOV_Child_4.ChildId

where	(iRental_Cars_Rates.RateTypeId= @RateTypeId or @RateTypeId is null) and
	(iRental_Cars_Rates.BrandId= @BrandId or @BrandId is null) and
	(iRental_Cars_Rates.ModelId= @ModelId or @ModelId is null) and
	(iRental_Cars_Rates.CarYear= @CarYear or @CarYear is null) and
	(iRental_Cars_Rates.IsDisable =@IsDisable or @IsDisable is null)

order by RecId Desc
*/
END

GO






/*

[UPD_iRental_CarsForSales_SP] '8778788',122,66,80,57,336,53,323,5,NULL,null,null,'8778787','update',null,null,null
[UPD_iRental_CarsForSales_SP] '8778770',123,64,76,55,325,53,323,5,32,'a',null,'8778788','update',null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,'GAM-18-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,'GAM-18-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,null,null,null,null,null,null,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,49,'5683',null,null,null,null,null,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 909,null,'444444',null,null,null,null,null,NULL,null,null,null,null,null,null,null
select * from iRental_CarsForSale
[UPD_iRental_CarsForSales_SP] null,34,'GAM-19-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
*/
CREATE   Procedure [dbo].[UPD_iRental_CarsForSales_SP]  
 @ChassisNo nvarchar(50),  
 @CarNumber nvarchar(10),  
 @BrandId int,  
 @ModelId int,  
 @TypeId int,  
 @CarYear int,  
 @ColorId int,  
 @CurrentMileage int,  
 @CarLocationId int,  
 @CarStatusId int,  
 @CurrentCondition nvarchar(1000),  
 @RecId int,
 @ChassisNo_Original nvarchar(50),
 @action varchar(20),
 @RowsToDelete varchar(1000),  
 @__UserId varchar(50),  
 @Status varchar(200) out  
  
  
  
  
As  
  
/* 
declare 
 @ChassisNo nvarchar(50) ='10009',  
 @RecId int=null,  
 @CarFor varchar(10)=null,
 @CarNumber nvarchar(10)=null,
 @BrandId int=null,
 @ModelId int=null,
 @TypeId int=null, 
 @CarYear int=null,
 @ColorId int=null,
 @CurrentMileage int=null,  
 @CarLocationId int=null,  
 @CarStatusId int=null,  
 @CurrentCondition nvarchar(1000)=null,  
 @action varchar(20)='new',
 @RowsToDelete varchar(1000)=null, 
 @__UserId varchar(50)=  'testuser',
 @Status varchar(200) =''

 */
 print @action
declare @NewRecId int  
  
IF @RowsToDelete is not null  
BEGIN  
	 SET NOCOUNT OFF    
   
	 Delete From  iRental_CarsForSale  
	 where   ChassisNo in    
	 (    
	  select RTD.value     
	  from [dbo].[Split](@RowsToDelete,',') RTD    
	 )    
   
   
	 set @Status = @@RowCount    
	 if(@Status ='0' )    
	  set @Status= '0||OK||Unable to delete records!'    
	 else if (@Status ='1' )    
	  set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'    
	 else     
	  set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'    
	 return  
	 SET NOCOUNT ON  
END  
ELSE IF  @action='update'
begin  
  
	 Update iRental_CarsForSale  
	 SET  
  
	ChassisNo=@ChassisNo,
	 CarNumber = @CarNumber, 
	 BrandId = @BrandId,  
	 ModelId = @ModelId,  
	 TypeId = @TypeId,  
	 CarYear = @CarYear,  
	 ColorId = @ColorId,  
	 CurrentMileage = @CurrentMileage,  
  
	 CarLocationId = @CarLocationId,  
	 CarStatusId = @CarStatusId,  
	 CurrentCondition = @CurrentCondition,  
	 [$ModifiedBy] = @__UserId,   
	 [$DateModified] = getdate()  
    
	WHERE ChassisNo = @ChassisNo_Original;
	--WHERE RecId = @RecId;


  
	 set @NewRecId = @@RowCount  
	   	print 'in update operation'

	 set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Updated Successfully'
	 return
  end

 ELSE IF @action = 'new'
    BEGIN

	print 'in insert operation'
        -- INSERT operation
        INSERT INTO iRental_CarsForSale
            (ChassisNo, CarNumber, BrandId, ModelId, TypeId, CarYear, ColorId, CurrentMileage,   
             CarLocationId, CarStatusId, CurrentCondition, [$CreatedBy], [$ModifiedBy])  
        VALUES     
            (@ChassisNo,@CarNumber, @BrandId, @ModelId, @TypeId, @CarYear, @ColorId, @CurrentMileage,  
           @CarLocationId, @CarStatusId, @CurrentCondition, @__UserId, @__UserId);
   
	 --set @NewRecId = SCOPE_IDENTITY( )  
   
 --Update iRental_Cars set RecCode='RCR-' + cast(@NewRecId as varchar(10)) where RecId =  @NewRecId  
  set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Insert Successfully'
  return 
end  
  
   set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||NoAction||No Action Taken'
 
-- SELECT ChassisNo, COUNT(*) AS DuplicateCount
--FROM [iRental_CarsForSale]
--GROUP BY ChassisNo
--HAVING COUNT(*) > 1;


--  select * from iRental_Cars

GO





  
/****** Object:  StoredProcedure [dbo].  
[UPD_iRental_SalesCarPrice]  63,458,59,250,25,25,'insert'   
select * from iRental_SalesCarPrice  
  
select * from iRental_CarsForSale  
Script Date: 8/13/2023 10:12:00 AM ******/  
  
CREATE proc [dbo].[UPD_iRental_SalesCarPrice_SP]  
  
@BrandId int,  
@ModelId int,  
@CarYear int,  
@Price decimal (9,3),  
@AdditionalAmount decimal(9,3),  
@Discount decimal(9,3),  
@Comments nvarchar (1000)  
  
as  
begin  
print 'in update '  
INSERT INTO iRental_SalesCarPrice  
                         (BrandId, ModelId, YearId, Price, AdditionalAmount, Discount, Comments)  
VALUES      (@BrandId,@ModelId,@CarYear,@Price,@AdditionalAmount,@Discount,@Comments)  
end

GO






CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_Comments_SP]
	@__UserId varchar(50),
	@RecId int,
	@ParentRecId int,
	@Comments nvarchar(2000),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Delete From  iRental_SalesContracts_Comments
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	
	set @Status = @@RowCount  
	if(@Status ='0' )  
		set @Status= '0||OK||Unable to delete records!'  
	else if (@Status ='1' )  
		set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'  
	else   
		set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'  
	return
	SET NOCOUNT ON
END
ELSE IF @RecId > 0
begin

	Update iRental_SalesContracts_Comments
	SET
	Comments = @Comments,
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

end
else
begin


	INSERT INTO iRental_SalesContracts_Comments
	                      (ParentRecId, Comments, [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@Comments,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'

GO





CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_OtherCharges_SP]
	@__UserId varchar(50),
	@__IP varchar(50),
	@RecId int,
	@ParentRecId int,
	@Description nvarchar(1000),
	@Charges float,
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int
declare @NewContractOtherCharges float

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  

	Update iRental_SalesContracts_OtherCharges
	SET
	[$StateId] = 'Deleted',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  


INSERT INTO iRental_SalesContracts_OtherCharges_Audit
                      ([$UserId], [$IP], RecId, ParentRecId, Description,Charges,[$StateId])
SELECT    @__UserId [$UserId], @__IP [$IP], RecId, ParentRecId, Description, Charges,'Deleted' [$StateId]
FROM         iRental_SalesContracts_OtherCharges where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	set @Status = @@RowCount  

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

	if(@Status ='0' )  
		set @Status= '0||OK||Unable to delete records!'  
	else if (@Status ='1' )  
		set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'  
	else   
		set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'  
	return
	SET NOCOUNT ON

END
ELSE IF @RecId > 0
begin

	Update iRental_SalesContracts_OtherCharges
	SET
	Description = @Description,
	Charges = @Charges,
	[$StateId] = 'Modified',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

	INSERT INTO iRental_SalesContracts_OtherCharges_Audit
	                      ([$UserId],[$IP], RecId, ParentRecId, Description,Charges,[$StateId])
	VALUES     (@__UserId,@__IP, @RecId, @ParentRecId,@Description,@Charges,'Modified')

end
else
begin


	INSERT INTO iRental_SalesContracts_OtherCharges
	                      (ParentRecId, Description,Charges,[$StateId], [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@Description,@Charges,'Created' ,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

	INSERT INTO iRental_SalesContracts_OtherCharges_Audit
	                      ([$UserId],[$IP], RecId, ParentRecId, Description,Charges,[$StateId])
	VALUES     (@__UserId,@__IP, @NewRecId, @ParentRecId,@Description,@Charges,'Created')

end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'

GO






/*
select * from iRental_SalesContracts_Payments where ReceiptId =5945
[UPD_iRental_SalesContracts_Payments_SP] 'anonyus',null,3,1013,86,5945,null,23,138,26,null,null,null,null,'update'
*/
CREATE  Procedure [dbo].[UPD_iRental_SalesContracts_Payments_SP]
	@__UserId varchar(50),
	@__IP varchar(50),
	@RecId int,
	@LocationReceiptId varchar(50),
	@ParentRecId int,
	@ReceiptId int,
	@PaymentType int,
	@PaymentDate datetime,
	@PaymentAmount float,
	@PaymentMode int,
	@ChequeNo bigint,
	@AmountInWords nvarchar(255),
	@PaymentComments nvarchar(2000),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int
declare @NewTotalPaidByCustomer float
declare @NewTotalReturnToCustomer float
declare @OutLocationId int
declare @LocationMaxId int

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Update iRental_SalesContracts_Payments
	SET
	[$StateId] = 'Deleted',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  

INSERT INTO iRental_Contracts_Payments_Audit
                      ([$UserId], [$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo, AmountInWords, PaymentComments, [$StateId])
SELECT    @__UserId [$UserId], @__IP [$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo, AmountInWords, PaymentComments,'Deleted' [$StateId]
FROM         iRental_SalesContracts_Payments where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	set @Status = @@RowCount 

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId

	Update  iRental_SalesContracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
	where RecId= @ParentRecId

	if(@Status ='0' )  
		set @Status= '0||OK||Unable to delete records!'  
	else if (@Status ='1' )  
		set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'  
	else   
		set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'  
	return
	SET NOCOUNT ON
	

END
ELSE IF @RecId > 0
begin

	Update iRental_SalesContracts_Payments
	SET
	ReceiptId = @ReceiptId,
	PaymentType = @PaymentType,
	PaymentDate = @PaymentDate,
	PaymentAmount = @PaymentAmount,
	PaymentMode = @PaymentMode,
	ChequeNo = @ChequeNo,
	AmountInWords = @AmountInWords,
	PaymentComments = @PaymentComments,
	[$StateId] = 'Modified',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId


	Update iRental_Contracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
	where RecId= @ParentRecId

	INSERT INTO iRental_Contracts_Payments_Audit
	                      ([$UserId],[$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments, [$StateId])
	VALUES     (@__UserId,@__IP, @RecId,@LocationReceiptId, @ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Modified')

			set @Status=@Status+'||OK||'+@Status+ ' Records Update Successfully'  

return
end
else
begin

Begin Tran Ins

	INSERT INTO iRental_SalesContracts_Payments
	                      (ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments,	[$StateId],  [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Created' ,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

	select @OutLocationId = isnull(sum(OutLocationId),0) from iRental_Contracts where RecId = @ParentRecId

	select   @LocationMaxId =  isnull(COUNT(*), 1)
	from         dbo.iRental_Contracts INNER JOIN
	                      dbo.iRental_SalesContracts_Payments ON dbo.iRental_Contracts.RecId = dbo.iRental_SalesContracts_Payments.ParentRecId
	where dbo.iRental_Contracts.OutLocationId = @OutLocationId
	GROUP BY dbo.iRental_Contracts.OutLocationId 


	Update iRental_SalesContracts_Payments
	SET
	LocationReceiptId = cast(@OutLocationId as varchar(50))   + '/' +  cast(@LocationMaxId as varchar(50))   + '/' +  cast(@NewRecId as varchar(50)) 
	where RecId= @NewRecId

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId

	Update iRental_Contracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
	where RecId= @ParentRecId

	INSERT INTO iRental_Contracts_Payments_Audit
	                      ([$UserId],[$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments, [$StateId])
	VALUES     (@__UserId,@__IP, @NewRecId,cast(@OutLocationId as varchar(50))   + '/' +  cast(@LocationMaxId as varchar(50))   + '/' +  cast(@NewRecId as varchar(50)) ,@ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Created')

Commit Tran Ins
  set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Insert Successfully'
  return
end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||NoAction||No Action Happen'

GO






/*
	
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,null,null,'5O83','RCD-131',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,'RCD-132',null,5083,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null
exec [UPD_iRental_SalesContracts_SP] 'new ',null,null,'RCD-44',null,5003,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null

						 

	select * from iRental_SalesContracts where CarNumber = '5O84'
*/
CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_SP]
	@__UserId varchar(50),

	@RecId int,
	@RecCode varchar(20),
	@CustomerRecCode varchar(20),
	@ChassisNo nvarchar(10),
	@CarRateType int,
	@CarRate decimal(15,3),
	@CarAllowedKM int,
	@CarExtraKMRate decimal(15,3),
	@ContractType varchar(10),
	@ContractTypeOL varchar(10),
	@ContractStartDate datetime,
	@ContractStartDay nvarchar(50),
	@ContractStartTime nvarchar(5),
	@ContractExpiryDate datetime,
	@ContractExpiryDay nvarchar(50),
	@ContractExpiryTime nvarchar(5),
	@ContractEndDate datetime,
	@ContractEndDay nvarchar(50),
	@ContractEndTime nvarchar(5),
	@ContractDays int,
	@ActualContractDays int,
	@CarPreviousKM int,
	@ContractKMOut int,
	@ContractKMIn int,
	@ContractExtraKM int,
	@ContractExtraKMCharges decimal(15,3),
	@ContractPeriodCharges decimal(15,3),
	@ContractOtherCharges decimal(15,3),
	@ContractDiscount decimal(15,3),
	@ContractTotalCharges decimal(15,3),
	@TotalPaidByCustomer decimal(15,3),
	@OutLocationId int,
	@InLocationId int,
	@ReservationDays int,
	@ReservationAmount decimal(9,3),
	@ReservationDate datetime,
	@StateId varchar(50),

	@Action varchar(50),
	@NewStateId varchar(50),
	@DBAction varchar(50),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As


	
	

declare @NewRecId int


print '@RecId:'+ cast(@RecId as varchar(20))

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Delete From  iRental_SalesContracts
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	set @Status = @@RowCount  
	if(@Status ='0' )  
		set @Status= '0||OK||Unable to delete records!'  
	else if (@Status ='1' )  
		set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'  
	else   
		set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'  
	return
	SET NOCOUNT ON
END
ELSE IF @DBAction='Reserve'
BEGIN
	
	Update iRental_SalesContracts
	SET ReservationDays=@ReservationDays,
		ReservationAmount=@ReservationAmount,
		ReservationDate=GETDATE()

END
ELSE IF @Action = 'update' -- When Update the record --   @RecId is not null
BEGIN
	
	if @NewStateId is null
	BEGIN
		set @NewStateId = @StateId
	END

	Update iRental_SalesContracts
	SET
	
	--ContractType=@ContractType, 
	--ContractTypeOL=@ContractTypeOL, 
	CustomerRecCode=@CustomerRecCode, 
	ChassisNo=@ChassisNo, 
	CarPreviousKM=@CarPreviousKM, 
	ContractKMOut=@ContractKMOut, 
	OutLocationId=@OutLocationId, 
	ContractStartDate=@ContractStartDate, 
	ContractStartDay=@ContractStartDay, 
	ContractStartTime=@ContractStartTime, 
	ContractExpiryDate = @ContractExpiryDate, 
	--tractExpiryDay = @ContractExpiryDay, 
--	ContractExpiryTime = @ContractExpiryTime, 
	ContractDays = @ContractDays,
	ContractEndDate=@ContractEndDate,
	ContractEndDay=@ContractEndDay,
	ContractEndTime=@ContractEndTime,
	ActualContractDays=@ActualContractDays,
	CarRateType= @CarRateType, 
	CarRate = @CarRate,
	CarAllowedKM = @CarAllowedKM, 
	CarExtraKMRate=@CarExtraKMRate,
	ContractKMIn = @ContractKMIn,
	InLocationId = @InLocationId,
	ContractPeriodCharges = @ContractPeriodCharges,
	ContractExtraKM = @ContractExtraKM,
	ContractExtraKMCharges = @ContractExtraKMCharges,
	ContractOtherCharges = @ContractOtherCharges,
	ContractDiscount = @ContractDiscount,
	ContractTotalCharges = @ContractTotalCharges,
	TotalPaidByCustomer = @TotalPaidByCustomer,
	[$StateId] = @NewStateId,
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()

	where RecId= @RecId
	set @NewRecId = @@RowCount
		 print 'in update operation'

	set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK|| Contract updated Successfully'
	



	--if (@NewStateId = 'RRCContractOpen')
	--Begin
	--	UPDATE    iRental_Cars
	--	SET        CarStatusId = 31
	--	WHERE     (CarNumber = @CarNumber)
	--end

	--if (@NewStateId = 'RRCContractOpenCarIn' or @NewStateId = 'RRCContractClosedPendingPayment' or @NewStateId = 'RRCContractClosed' or @NewStateId = 'RRCContractCancelled')
	--Begin
	--	UPDATE    iRental_Cars
	--	SET         CurrentMileage = @ContractKMIn, CarStatusId = 30
	--	WHERE     (CarNumber = @CarNumber)
	--end
		return

end
else IF @Action = 'new'
begin
	declare @CStateId varchar(50)='SCCreated'

	if(@DBAction is not null)
	BEGIN
		SET @CStateId=@DBAction
	END

	INSERT INTO  iRental_SalesContracts
	(  CustomerRecCode, ChassisNo, CarPreviousKM, ContractKMOut, OutLocationId, 
	ContractStartDate, ContractStartDay, ContractStartTime, ReservationDate, ReservationDays, ContractDays,
	CarRateType, CarRate, CarAllowedKM, CarExtraKMRate, ContractEndDate, ContractEndDay, ContractEndTime, ActualContractDays,
	[$StateId], [$CreatedBy], [$ModifiedBy])
	VALUES     
	( @CustomerRecCode, @ChassisNo, @CarPreviousKM, @ContractKMOut, @OutLocationId, 
	@ContractStartDate, @ContractStartDay, @ContractStartTime, @ReservationDate,@ReservationDays, @ContractDays,
	@CarRateType, @CarRate, @CarAllowedKM, @CarExtraKMRate,@ContractEndDate, @ContractEndDay, @ContractEndTime, @ActualContractDays,
	@CstateId, @__UserId, @__UserId)
		 print 'in Insert operation'

	set @NewRecId = SCOPE_IDENTITY( )
	

	Update iRental_SalesContracts set RecCode=right(year(getdate()), 2) + '/' + cast(@NewRecId as varchar(10)) where RecId =  @NewRecId
	

	Update    iRental_CarsForSale SET CarStatusId = 32 WHERE (ChassisNo = @ChassisNo)

		set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK|| Record Insert Successfully'
		return

end

IF @Status IS NOT NUll OR LTRIM(LTRIM(@Status)) = ''
BEGIN
	set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||NoAction||No data updated'
END


GO


