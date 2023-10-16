

ALTER VIEW [dbo].[VW_iRental_SalesContracts_Payments]
AS
SELECT        ParentRecId, SUM(ISNULL(PaymentAmount, 0)) AS PaymentAmount
FROM            dbo.iRental_SalesContracts_Payments
GROUP BY ParentRecId
GO


