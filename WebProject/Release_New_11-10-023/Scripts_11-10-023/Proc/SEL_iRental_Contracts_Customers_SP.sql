

ALTER  PROCEDURE [dbo].[SEL_iRental_Contracts_Customers_SP]   
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

Order by [$DateModified] desc
GO


