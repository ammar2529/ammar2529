

ALTER PROC [dbo].[SEL_iRental_SalesCarPrice_SP] 
	@RecId bigint, 
	@BrandId bigint,
	@ModelId bigint,
	@YeatId bigint,
	@Price decimal(9, 3),
	@Comments nvarchar(1000)

AS

if @RecId is not null
BEGIN

	SELECT        RecId, BrandId, ModelId, YearId, Price,Comments
	FROM            iRental_SalesCarPrice where RecId =  @RecId

return
END

else
BEGIN
	
	

SELECT       LvBrand.Name as BrandId,LVModel.Name as ModelId,LvYear.Name as YearId, Price, Comments
FROM            iRental_SalesCarPrice as SCP	LEFT OUTER JOIN
					FX_Common_LOV_Child as LvBrand on Scp.BrandId =  LvBrand.ChildId LEFT OUTER JOIN
					FX_Common_LOV_Child as LVModel on Scp.ModelId =  LVModel.ChildId LEFT OUTER JOIN
					FX_Common_LOV_Child as LvYear on Scp.YearId =  LvYear.ChildId 	

return
END
GO



