
/****** Object:  StoredProcedure [dbo].[SEL_iRental_SalesContracts_SP]    Script Date: 10/11/2023 3:17:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

    
    
--
-- [SEL_iRental_SalesContracts_SP] 5, null,null,null,null, null,null,null,null,null,null,null,null,null,null,null,null   
--select * from iRental_SalesContracts    
ALTER  PROCEDURE [dbo].[SEL_iRental_SalesContracts_SP]       
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
 @fComments varchar(2000),    
 @CreatedBy nvarchar(255),    
 @ReservationDate datetime,    
 @ReservationDays int,    
 @ReservationExpireTime nvarchar(50),    
 @ReservationWeekDays nvarchar(50),    
 @StateId varchar(255)    
       
AS    
    
IF @RecId is not NULL    
BEGIN    
    
  SELECT         
  RecId,RecCode,[$CreatedBy] CreatedBy, StateId, StateName, CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,    
   OutLocationId, InLocationId,    
  --CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate, ContractStartDay, ContractStartTime,    
  --CONVERT(varchar, ContractExpiryDate, 103)  AS ContractExpiryDate, ContractDays,    
  --CONVERT(varchar, ContractEndDate, 103)  AS ContractEndDate, ContractEndDay, ContractEndTime, ActualContractDays,    
    
  --CarPreviousKM, CarRateType, CarRate, CarAllowedKM, CarExtraKMRate,    
  --ContractKMOut, ContractKMIn,    
  --ContractExtraKM, ContractExtraKMCharges,     
  --ContractPeriodCharges, ContractOtherCharges, ContractDiscount, ContractTotalCharges, TotalPaidByCustomer,    
  CarNumber, ChassisNo, Brand BrandId, Model ModelId, CarYear,Color , isNull(Price,0) Price, isNull(Discount,0) Discount,isNull(AdditionalAmount,0) AdditionalAmount,isNull(TotalAmount,0) TotalAmount, [Type] TypeId,isNull(PaymentAmount,0) PaymentAmount,   
 
  --'3rd - ' +CONVERT(varchar, InsuranceExpiry, 103)  AS InsuranceExpiry,    
  --'Full - '+CONVERT(varchar, FullInsuranceExpiry, 103)  AS FullInsuranceExpiry,    
  CustomerRecCode, CustomerName, Gender, Nationality, TotalAmount - PaymentAmount as AmountDue,fComments,    
   convert(varchar, ReservationDate,103) as ReservationDate,    
  ReservationDays,ReservationWeekDays,ReservationExpireTime,    
  WorkTelephone,     
  ResidenceTelephone,     
  MobileTelephone1,     
  MobileTelephone2,     
  --EmailAddress,    
  --Address,    
  PassportNo, --CONVERT(varchar, PassportExpiry, 103)  AS PassportExpiry,    
  NationalIDNo, --CONVERT(varchar, NationalIDExpiryDate, 103)  AS NationalIDExpiryDate,    
  DrivingLicenseNo, --CONVERT(varchar, DrivingLicenseExpiry, 103)  AS DrivingLicenseExpiry,    
   FileGuid,    
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
    
    
	SELECT   RecId, RecCode, CarNumber, Brand, Model, CarYear, CustomerName, CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate,  [$CreatedBy], StateName,    
	 ContractStartTime,Nationality,  MobileTelephone1,MobileTelephone2,CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,    
	 LEFT(CONVERT(varchar,  [$DateCreated], 108),5)  AS DateCreatedTime,    
	 NationalIDNo , isNull(PaymentAmount,0) PaymentAmount,isNull(TotalAmount,0) TotalAmount, TotalAmount - PaymentAmount as AmountDue
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
		 or @StateId is null
	 )    
	order by RecId Desc    
   
  
END 
GO

