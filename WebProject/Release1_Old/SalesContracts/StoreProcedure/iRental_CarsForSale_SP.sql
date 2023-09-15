

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



