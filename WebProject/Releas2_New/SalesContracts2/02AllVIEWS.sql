USE [OnlineSolutions]
GO

/****** Object:  View [dbo].[VW_SEL_iRental_SalesContracts_Details]    Script Date: 9/15/2023 6:07:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*  
select * from iRental_CarsForSaleForSale      
select * from iRental_CarsForSale  
select * from iRental_SalesContracts  
  
*/  
aLTER VIEW [dbo].[VW_SEL_iRental_SalesContracts_Details]  
AS  
SELECT        dbo.iRental_SalesContracts.RecId, dbo.iRental_SalesContracts.RecCode, dbo.iRental_SalesContracts.CustomerRecCode, dbo.iRental_SalesContracts.ChassisNo, dbo.iRental_SalesContracts.CarRateType,   
                         dbo.iRental_SalesContracts.CarRate, dbo.iRental_SalesContracts.CarAllowedKM, dbo.iRental_SalesContracts.CarExtraKMRate, dbo.iRental_SalesContracts.fComments, dbo.iRental_SalesContracts.ContractExpiryTime,   
                         dbo.iRental_SalesContracts.ContractStartDate, dbo.iRental_SalesContracts.ContractStartDay, dbo.iRental_SalesContracts.ContractStartTime, dbo.iRental_SalesContracts.ContractExpiryDate,   
                         dbo.iRental_SalesContracts.ContractEndDate, dbo.iRental_SalesContracts.ContractEndDay, dbo.iRental_SalesContracts.ContractEndTime, dbo.iRental_SalesContracts.ContractDays,   
                         dbo.iRental_SalesContracts.ActualContractDays, dbo.iRental_SalesContracts.CarPreviousKM, dbo.iRental_SalesContracts.ContractKMOut, dbo.iRental_SalesContracts.ContractKMIn,   
                         dbo.iRental_SalesContracts.ContractExtraKM, dbo.iRental_SalesContracts.ContractExtraKMCharges, dbo.iRental_SalesContracts.ContractPeriodCharges, dbo.iRental_SalesContracts.ContractOtherCharges,   
                         dbo.iRental_SalesContracts.ContractDiscount, dbo.iRental_SalesContracts.ContractTotalCharges, dbo.iRental_SalesContracts.TotalPaidByCustomer, dbo.iRental_SalesContracts.OutLocationId,   
                         dbo.iRental_SalesContracts.InLocationId, dbo.iRental_SalesContracts.ReservationDays, dbo.iRental_SalesContracts.ReservationAmount, dbo.iRental_SalesContracts.ReservationDate,   
                         dbo.iRental_SalesContracts.[$OwnerOrgId], dbo.iRental_SalesContracts.[$OwnerUnitId], dbo.iRental_SalesContracts.[$StateId], dbo.iRental_SalesContracts.[$CreatedBy], dbo.iRental_SalesContracts.[$ModifiedBy],   
                         dbo.iRental_SalesContracts.[$DateCreated], dbo.iRental_SalesContracts.[$DateModified], dbo.iRental_Customers.CustomerType, dbo.iRental_Customers.Gender, dbo.iRental_Customers.CustomerName,   
                         dbo.iRental_Customers.Nationality, dbo.iRental_Customers.PassportNo, dbo.iRental_Customers.NationalIDNo, dbo.iRental_Customers.DrivingLicenseNo, dbo.iRental_Customers.WorkTelephone,   
                         dbo.iRental_Customers.ResidenceTelephone, dbo.iRental_Customers.MobileTelephone1, dbo.iRental_Customers.MobileTelephone2, dbo.VW_iRental_CarsForSale_Available.CarNumber,   
                         dbo.VW_iRental_CarsForSale_Available.BrandId, dbo.VW_iRental_CarsForSale_Available.ModelId, dbo.VW_iRental_CarsForSale_Available.ColorId, dbo.VW_iRental_CarsForSale_Available.TypeId,   
                         dbo.VW_iRental_CarsForSale_Available.CurrentMileage, dbo.VW_Models.Model, dbo.VW_CarColor.Color, dbo.VW_Type.Type, dbo.VW_Brands.Brand, dbo.VW_CarYear.CarYear,   
                         dbo.VW_FX_Workflow_States_Sales_Contracts.StateName, dbo.VW_FX_Workflow_States_Sales_Contracts.StateId, dbo.VW_iRental_SalesContracts_Payments.PaymentAmount, dbo.VW_iRental_CarsForSale_Available.Price,   
                         dbo.VW_iRental_CarsForSale_Available.Discount, dbo.VW_iRental_CarsForSale_Available.AdditionalAmount, dbo.VW_iRental_CarsForSale_Available.TotalAmount, dbo.iRental_SalesContracts.ContractExpiryDay,   
                         dbo.iRental_SalesContracts.ReservationExpireTime, dbo.iRental_SalesContracts.ReservationWeekDays  , FileGuid
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


