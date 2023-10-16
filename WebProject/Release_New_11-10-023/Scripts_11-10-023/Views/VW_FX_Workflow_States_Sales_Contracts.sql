
ALTER VIEW [dbo].[VW_FX_Workflow_States_Sales_Contracts]
AS
SELECT        RecId, ModuleId, StateId, StateName, [$CreatedBy], [$ModifiedBy], [$DateCreated], [$DateModified]
FROM            dbo.FX_Workflow_States
WHERE        (ModuleId = 'iRental_Sales_Contracts')
GO


