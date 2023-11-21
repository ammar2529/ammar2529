


ALTER Procedure [dbo].[RNTSalesContract_Print_SalesContract_SP] 
	@FormCode VarChar(50)

As

SELECT   SC.RecCode as FormCode,CONVERT(varchar(10), SC.ContractStartDate, 103) AS ContractStartDate,SC.ContractStartDay,SC.ContractStartTime,
		 CONVERT(varchar(10), SC.ReservationDate, 103) AS ReservationDate,SC.ReservationWeekDays,SC.ReservationExpireTime,SC.ReservationDays,
		 SC.Price,SC.AdditionalAmount,SC.Discount,SC.TotalAmount,
		 CONVERT(varchar(10), SC.ContractDate, 103) AS ContractDate,
		 CONVERT(varchar(10), SC.[$DateCreated], 103) AS DateCreated,
		 CONVERT(varchar(10), SC.[$DateModified], 103) AS DateModified,
		 sc.EngineWarranty,sc.EnginYearsWarranty,GearWarranty,GearYearsWarranty,sc.CarWarranty,sc.CarYearsWarranty,

		LVCarName.Name as CarName, LvColor.Name as CarColor,LvType.Name as CarType,LvModel.Name as CarModel,LVYear.Name as CarYear,CSF.CarNumber,
		 CSF.ChassisNo,isNull(SCP.Price,0) CarPrice,isNull(SP.PaymentAmount,0) PaymentAmount,TotalAmount - PaymentAmount as AmountDue,
		
		 CUS.CustomerName,LVCusNationality.Name as Nationality,  CONVERT(varchar(10), CUS.NationalIDExpiryDate, 103)  AS NationalIDExpiry,
		 CUS.Address,CUS.DrivingLicenseExpiry,CUS.DrivingLicenseExpiry,CUS.DrivingLicenseNo,CUS.MobileTelephone1,CUS.MobileTelephone2,
		 CUS.WorkTelephone,CUS.ResidenceTelephone,CUS.NationalIDNo

                     
		FROM iRental_SalesContracts as SC left outer join 
		iRental_SalesContracts_Payments as SP on SC.RecId = SP.ParentRecId inner join 
		iRental_CarsForSale as CSF on SC.ChassisNo = SC.ChassisNo inner join 
		iRental_SalesCarPrice as SCP on CSF.RecId = SCP.RecId  inner join
		iRental_Customers as CUS on SC.CustomerRecCode = CUS.RecCode inner join 
		FX_Common_LOV_Child as LvColor on CSF.ColorId = LvColor.ChildId inner join 
		FX_Common_LOV_Child as LvType on CSF.TypeId = LvType.ChildId inner join 
		FX_Common_LOV_Child as LvModel on CSF.ModelId = LvModel.ChildId inner join
		FX_Common_LOV_Child as LVYear on CSF.YearId = LVYear.ChildId  inner join
		FX_Common_LOV_Child as LVCarName on CSF.BrandId = LVCarName.ChildId inner join
		FX_Common_LOV_Child as LVCusNationality on CUS.Nationality = LVCusNationality.ChildId


	WHERE     (SC.RecCode = @FormCode)
GO


