

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

