
CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_OtherCharges_Audit_SP]   
	@RecId int
			
AS

SELECT     
	iRental_SalesContracts_OtherCharges_Audit.AuditTrailId,
	iRental_SalesContracts_OtherCharges_Audit.[$StateId]  as StateId,
	iRental_SalesContracts_OtherCharges_Audit.RecId, 
	iRental_SalesContracts_OtherCharges_Audit.ParentRecId, 
	iRental_SalesContracts_OtherCharges_Audit.Description,
	iRental_SalesContracts_OtherCharges_Audit.Charges,
	CONVERT(varchar, iRental_SalesContracts_OtherCharges_Audit.[$DateTime], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_OtherCharges_Audit.[$DateTime], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_OtherCharges_Audit LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_OtherCharges_Audit.[$UserId] = FX_Users.UserId

where	(iRental_SalesContracts_OtherCharges_Audit.RecId  =@RecId)

order by AuditTrailId

GO




