
ALTER VIEW [dbo].[VW_SEL_iRental_SalesContracts]
AS
SELECT     RecId, RecCode, CarNumber, BrandId, Brand, ModelId, Model, CarYearId, CarYear, NationalIDNo, CustomerName, ContractStartDate, OutLocationId, OutLocation, 
                      CreatedBy, StateId, StateName, ContractTypeOL, DateCreated, ContractStartTime, MobileTelephone1, MobileTelephone2, Nationality, CarRate, ContractPeriodCharges, 
                      ContractExtraKMCharges, ContractOtherCharges, ContractDiscount, TotalPaidByCustomer, CASE WHEN StateName = 'Created - Reservation' THEN (0) 
                      WHEN StateName = 'Contract Open - Car Out' THEN (ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) = 0 THEN 1 ELSE DATEDIFF([day], 
                      ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) 
                      WHEN StateName = 'Contract Open - Car In' THEN (ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) = 0 THEN 1 ELSE DATEDIFF([day], 
                      ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) 
                      WHEN StateName = 'With Legal - Contract Open - Car Out' THEN (ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) 
                      = 0 THEN 1 ELSE DATEDIFF([day], ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) 
                      - ISNULL(ContractDiscount, 0)) WHEN StateName = 'With Legal - Contract Open - Car In' THEN (ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, 
                      getDate()) = 0 THEN 1 ELSE DATEDIFF([day], ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) 
                      - ISNULL(ContractDiscount, 0)) WHEN StateName = 'With Legal - Contract Closed - Pending Payment' THEN (isnull(ContractPeriodCharges, 0) 
                      + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) 
                      WHEN StateName = 'Contract Closed - Pending Payment' THEN (isnull(ContractPeriodCharges, 0) + ISNULL(ContractExtraKMCharges, 0) 
                      + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) WHEN StateName = 'Contract Closed - Payment Cleared' THEN (isnull(ContractTotalCharges, 0)) 
                      WHEN StateName = 'Contract Cancelled' THEN (0) END AS ContractTotalCharges, CASE WHEN StateName = 'Created - Reservation' THEN (0) 
                      WHEN StateName = 'Contract Open - Car Out' THEN ((ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) = 0 THEN 1 ELSE DATEDIFF([day], 
                      ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) 
                      - isnull(TotalPaidByCustomer, 0)) WHEN StateName = 'Contract Open - Car In' THEN ((ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) 
                      = 0 THEN 1 ELSE DATEDIFF([day], ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) 
                      - ISNULL(ContractDiscount, 0)) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'With Legal - Contract Open - Car Out' THEN ((ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) 
                      = 0 THEN 1 ELSE DATEDIFF([day], ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) 
                      - ISNULL(ContractDiscount, 0)) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'With Legal - Contract Open - Car In' THEN ((ISNULL((CarRate * CASE WHEN DATEDIFF([day], ContractStartDate, getDate()) 
                      = 0 THEN 1 ELSE DATEDIFF([day], ContractStartDate, getDate()) END), 0) + ISNULL(ContractExtraKMCharges, 0) + ISNULL(ContractOtherCharges, 0) 
                      - ISNULL(ContractDiscount, 0)) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'With Legal - Contract Closed - Pending Payment' THEN ((isnull(ContractPeriodCharges, 0) + ISNULL(ContractExtraKMCharges, 0) 
                      + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'Contract Closed - Pending Payment' THEN ((isnull(ContractPeriodCharges, 0) + ISNULL(ContractExtraKMCharges, 0) 
                      + ISNULL(ContractOtherCharges, 0) - ISNULL(ContractDiscount, 0)) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'Contract Closed - Payment Cleared' THEN (isnull(ContractTotalCharges, 0) - isnull(TotalPaidByCustomer, 0)) 
                      WHEN StateName = 'Contract Cancelled' THEN (0) END AS TotalAmountDue, Address
FROM         dbo.VW_SEL_iRental_Contracts_Base
GO


