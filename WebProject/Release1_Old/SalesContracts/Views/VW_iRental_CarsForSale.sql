

CREATE VIEW [dbo].[VW_iRental_CarsForSale]
AS
SELECT        ChassisNo, RecId, RecCode, CarFor, CarNumber, BrandId, ModelId, CarYear, ColorId, TypeId, CurrentMileage AS InsuranceCompanyId, CarLocationId AS InsuranceExpiry, CarStatusId AS InsurancePolicyNo, 
                         CurrentCondition AS InsurancePolicyAmount, [$OwnerOrgId] AS InsurancePolicyValue, [$OwnerUnitId] AS FullInsuranceCompanyId, [$StateId] AS FullInsuranceExpiry, [$CreatedBy] AS FullInsurancePolicyNo, 
                         [$ModifiedBy] AS FullInsurancePolicyAmount, [$DateCreated] AS FullInsurancePolicyValue, [$DateModified] AS CurrentMileage
FROM            dbo.iRental_CarsForSale

GO

