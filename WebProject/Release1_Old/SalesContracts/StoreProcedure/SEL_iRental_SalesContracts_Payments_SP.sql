
/*
select * from iRental_SalesContracts_Payments
[SEL_iRental_SalesContracts_Payments_SP] 1, null
*/
CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Payments_SP]   
	@RecId int,
	@ParentRecId int
			
AS

IF @RecId is not NULL
BEGIN

SELECT    RecId,LocationReceiptId,ParentRecId, PaymentType, PaymentMode, ChequeNo, PaymentAmount, ReceiptId, AmountInWords,
	      CONVERT(varchar, PaymentDate, 103)  AS PaymentDate,PaymentComments
FROM         iRental_SalesContracts_Payments Where RecId = @RecId

END
ELSE
BEGIN

SELECT      RecId  PrintId,
	iRental_SalesContracts_Payments.RecId, 
	iRental_SalesContracts_Payments.LocationReceiptId,
	iRental_SalesContracts_Payments.ParentRecId, 
	CONVERT(varchar, iRental_SalesContracts_Payments.PaymentDate, 103)  AS PaymentDate,
	CASE when iRental_SalesContracts_Payments.PaymentType = 0 THEN 'Receipt'  ELSE 'Return' END AS PaymentType,
	FX_Common_LOV_Child.Name AS PaymentMode, 
	iRental_SalesContracts_Payments.ChequeNo,
	iRental_SalesContracts_Payments.PaymentAmount, 
	iRental_SalesContracts_Payments.ReceiptId, 
	CONVERT(varchar, iRental_SalesContracts_Payments.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Payments.[$DateCreated], 108),5)  AS DateCreated,
	FX_Users.Name AS CreatedBy, 
	iRental_SalesContracts_Payments.[$StateId]  as StateId

FROM         iRental_SalesContracts_Payments LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Payments.[$CreatedBy] = FX_Users.UserId LEFT OUTER JOIN
                      FX_Common_LOV_Child ON iRental_SalesContracts_Payments.PaymentMode = FX_Common_LOV_Child.ChildId

where	(iRental_SalesContracts_Payments.ParentRecId  =@ParentRecId)

order by recid desc
END

GO




