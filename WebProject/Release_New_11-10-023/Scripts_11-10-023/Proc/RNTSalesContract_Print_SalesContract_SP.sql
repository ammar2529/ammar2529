


ALTER Procedure [dbo].[RNTSalesContract_Print_SalesContract_SP] 
	@FormCode VarChar(50)

As

SELECT   SC.RecCode as FormCode,CONVERT(varchar(10), SC.ContractStartDate, 103) AS ContractStartDate,SC.ContractStartDay,SC.ContractStartTime,
		 CONVERT(varchar(10), SC.ReservationDate, 103) AS ReservationDate,SC.ReservationWeekDays,SC.ReservationExpireTime,SC.ReservationDays,
		 SC.AdditionalAmount,SC.Discount,SC.TotalAmount,

		 LVCarName.Name as CarName, LvColor.Name as CarColor,LvType.Name as CarType,LvModel.Name as CarModel,LVYear.Name as CarYear,CSF.CarNumber,
		 CSF.ChassisNo,isNull(SCP.Price,0) CarPrice,isNull(SP.PaymentAmount,0) PaymentAmount,TotalAmount - PaymentAmount as AmountDue,
		
		 CUS.CustomerName,LVCusNationality.Name as Nationality,  CONVERT(varchar(10), CUS.NationalIDExpiryDate, 103)  AS NationalIDExpiry,
		 CUS.Address,CUS.DrivingLicenseExpiry,CUS.DrivingLicenseExpiry,CUS.DrivingLicenseNo,CUS.MobileTelephone1,CUS.MobileTelephone2,
		 CUS.WorkTelephone,CUS.ResidenceTelephone,CUS.NationalIDNo

                     
		FROM iRental_SalesContracts as SC left outer join 
		iRental_SalesContracts_Payments as SP on SC.RecId = SP.ParentRecId  left outer join 
		iRental_CarsForSale as CSF on SC.ChassisNo = SC.ChassisNo left outer join 
		iRental_SalesCarPrice as SCP on CSF.RecId = SCP.RecId  left outer join
		iRental_Customers as CUS on SC.CustomerRecCode = CUS.RecCode left outer join 
		FX_Common_LOV_Child as LvColor on CSF.ColorId = LvColor.ChildId left Outer join 
		FX_Common_LOV_Child as LvType on CSF.TypeId = LvType.ChildId left Outer join 
		FX_Common_LOV_Child as LvModel on CSF.ModelId = LvModel.ChildId left Outer join
		FX_Common_LOV_Child as LVYear on CSF.YearId = LVYear.ChildId  left Outer join
		FX_Common_LOV_Child as LVCarName on CSF.BrandId = LVCarName.ChildId left Outer join
		FX_Common_LOV_Child as LVCusNationality on CUS.Nationality = LVCusNationality.ChildId


	WHERE     (SC.RecCode = @FormCode)
GO


