

ALTER  PROCEDURE [dbo].[SEL_iRental_Customers_SP]   
	@RecId int,
	@__UserId nvarchar(50),	
	@RecCode varchar(50),
	@CustomerName nvarchar(200),
	@NationalIDNo nvarchar(50),
	@MobileTelephone1 int,
	@CustomerStatus varchar(50)
			
AS

IF @RecId is not NULL
BEGIN

SELECT     RecId, RecCode, CustomerName, NationalIDNo, MobileTelephone1, CustomerStatus, CONVERT(varchar, NationalIDExpiryDate, 103) AS NationalIDExpiryDate , Nationality, Gender, DrivingLicenseNo, CONVERT(varchar, DrivingLicenseExpiry, 103) AS DrivingLicenseExpiry, PassportNo, CONVERT(varchar, PassportExpiry, 103) AS PassportExpiry, 
	                      Address, WorkTelephone, ResidenceTelephone, MobileTelephone2, EmailAddress, CustomerType, 
	                      CustomerNotes
FROM         iRental_Customers Where RecId = @RecId

END
ELSE
BEGIN

SELECT     RecId, RecCode, CustomerName, NationalIDNo, MobileTelephone1, CustomerStatus
FROM         iRental_Customers
where	(RecCode like '%' + @RecCode+ '%' or @RecCode is null) and
	(CustomerName like '%' + @CustomerName+ '%' or @CustomerName is null) and
	(NationalIDNo= @NationalIDNo or @NationalIDNo is null) and
	(MobileTelephone1 =@MobileTelephone1 or @MobileTelephone1 is null) and
	(CustomerStatus =@CustomerStatus or @CustomerStatus is null)

order by RecId Desc

END
GO


