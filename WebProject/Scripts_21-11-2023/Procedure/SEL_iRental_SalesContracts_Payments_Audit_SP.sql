


ALTER  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Payments_Audit_SP]   
	@RecId int
			
AS

SELECT     
	iRental_SalesContracts_Payments_Audit.AuditTrailId,
	iRental_SalesContracts_Payments_Audit.[$StateId]  as StateId,
	iRental_SalesContracts_Payments_Audit.RecId, 
	iRental_SalesContracts_Payments_Audit.ParentRecId, 
	CONVERT(varchar, iRental_SalesContracts_Payments_Audit.PaymentDate, 103)  AS PaymentDate,

	CASE when iRental_SalesContracts_Payments_Audit.PaymentType = 0 THEN 'Receipt'  ELSE 'Return' END AS PaymentType_Audit,
	FX_Common_LOV_Child.Name AS PaymentMode, 
	iRental_SalesContracts_Payments_Audit.ChequeNo,
	iRental_SalesContracts_Payments_Audit.PaymentAmount, 
	iRental_SalesContracts_Payments_Audit.ReceiptId, 
	CONVERT(varchar, iRental_SalesContracts_Payments_Audit.[$DateTime], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Payments_Audit.[$DateTime], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_Payments_Audit LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Payments_Audit.[$UserId] = FX_Users.UserId LEFT OUTER JOIN
                      FX_Common_LOV_Child ON iRental_SalesContracts_Payments_Audit.PaymentMode = FX_Common_LOV_Child.ChildId

where	(iRental_SalesContracts_Payments_Audit.RecId  =@RecId)


order by AuditTrailId
GO


