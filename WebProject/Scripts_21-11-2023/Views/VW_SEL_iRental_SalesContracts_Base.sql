

ALTER VIEW [dbo].[VW_SEL_iRental_SalesContracts_Base]
AS
SELECT     dbo.iRental_SalesContracts.RecId, dbo.iRental_SalesContracts.RecCode,  dbo.iRental_CarsForSale.BrandId, 
                      dbo.FX_Common_LOV_Child.Name AS Brand, dbo.iRental_CarsForSale.ModelId, FX_Common_LOV_Child_1.Name AS Model, dbo.iRental_CarsForSale.YearId AS CarYearId,
					 
                      FX_Common_LOV_Child_2.Name AS CarYear, dbo.iRental_Customers.NationalIDNo, dbo.iRental_Customers.CustomerName, dbo.iRental_SalesContracts.ContractStartDate, 
                     FX_Common_LOV_Child_3.Name AS OutLocation, dbo.FX_Users.Name AS CreatedBy, 
                      dbo.iRental_SalesContracts.[$StateId] AS StateId, dbo.FX_Workflow_States.StateName,
                      dbo.iRental_SalesContracts.[$DateCreated] AS DateCreated, dbo.iRental_SalesContracts.ContractStartTime, dbo.iRental_Customers.MobileTelephone1, 
                      dbo.iRental_Customers.MobileTelephone2, dbo.iRental_Customers.Address, FX_Common_LOV_Child_4.Name AS Nationality, 
                      dbo.iRental_SalesContracts.Discount, dbo.iRental_SalesContracts.TotalAmount
FROM				 dbo.FX_Common_LOV_Child AS FX_Common_LOV_Child_4 RIGHT OUTER JOIN
                      dbo.iRental_Customers ON FX_Common_LOV_Child_4.ChildId = dbo.iRental_Customers.Nationality RIGHT OUTER JOIN
                      dbo.FX_Workflow_States RIGHT OUTER JOIN
                      dbo.iRental_SalesContracts ON dbo.FX_Workflow_States.StateId = dbo.iRental_SalesContracts.[$StateId] LEFT OUTER JOIN
                      dbo.FX_Users ON dbo.iRental_SalesContracts.[$CreatedBy] = dbo.FX_Users.UserId LEFT OUTER JOIN
                      dbo.FX_Common_LOV_Child AS FX_Common_LOV_Child_3 ON dbo.iRental_SalesContracts.OutLocationId = FX_Common_LOV_Child_3.ChildId LEFT OUTER JOIN
                      dbo.FX_Common_LOV_Child AS FX_Common_LOV_Child_2 RIGHT OUTER JOIN
                      dbo.iRental_CarsForSale ON FX_Common_LOV_Child_2.ChildId = dbo.iRental_CarsForSale.YearId LEFT OUTER JOIN
                      dbo.FX_Common_LOV_Child AS FX_Common_LOV_Child_1 ON dbo.iRental_CarsForSale.ModelId = FX_Common_LOV_Child_1.ChildId LEFT OUTER JOIN
                      dbo.FX_Common_LOV_Child ON dbo.iRental_CarsForSale.BrandId = dbo.FX_Common_LOV_Child.ChildId 
					  ON 
                      dbo.iRental_SalesContracts.ChassisNo = dbo.iRental_CarsForSale.ChassisNo ON dbo.iRental_Customers.RecCode = dbo.iRental_SalesContracts.CustomerRecCode 
GO


