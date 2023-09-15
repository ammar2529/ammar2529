

CREATE VIEW [dbo].[VW_iRental_SalesContracts_Payments]
as 
  select ParentRecId,sum(isnull(paymentamount,0)) PaymentAmount 
	  FROM [OnlineSolutions].[dbo].[iRental_SalesContracts_Payments]
	  group by ParentRecId

GO



