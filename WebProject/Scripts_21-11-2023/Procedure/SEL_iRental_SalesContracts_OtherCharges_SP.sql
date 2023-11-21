

ALTER  PROCEDURE [dbo].[SEL_iRental_SalesContracts_OtherCharges_SP]   
	@RecId int,
	@ParentRecId bigint
			
AS


IF @RecId is not NULL
BEGIN

SELECT    RecId, ParentRecId, Description,Charges
FROM         iRental_SalesContracts_OtherCharges Where RecId = @RecId

END
ELSE
BEGIN

SELECT     
iRental_SalesContracts_OtherCharges.RecId, 
iRental_SalesContracts_OtherCharges.ParentRecId, 
iRental_SalesContracts_OtherCharges.Description,
iRental_SalesContracts_OtherCharges.Charges,
CONVERT(varchar, iRental_SalesContracts_OtherCharges.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_OtherCharges.[$DateCreated], 108),5)  AS DateCreated,

FX_Users.Name AS CreatedBy,
iRental_SalesContracts_OtherCharges.[$StateId]  as StateId

FROM         iRental_SalesContracts_OtherCharges LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_OtherCharges.[$CreatedBy] = FX_Users.UserId

where	(iRental_SalesContracts_OtherCharges.ParentRecId  =@ParentRecId)

order by recid desc
END
GO


