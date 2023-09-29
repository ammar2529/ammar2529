


/****** Object:  StoredProcedure [dbo].
[SEL_iRental_SalesCarPrice_SP]   4,null,null,null,null,null,null,null 

Script Date: 8/17/2023 4:04:27 PM ******/




Alter PROC [dbo].[SEL_iRental_SalesCarPrice_SP] 
	@RecId bigint, 
	@BrandId bigint,
	@ModelId bigint,
	@YeatId bigint,
	@Price decimal(9, 3),
	@AdditionalAmount decimal(9, 3),
	@Discount decimal(9, 3),
	@Comments nvarchar(1000)

AS

if @RecId is not null
BEGIN

	SELECT        RecId, BrandId, ModelId, YearId, Price, AdditionalAmount, Discount, Comments
	FROM            iRental_SalesCarPrice where RecId =  @RecId

return
END

else
BEGIN
	
	

SELECT       LvBrand.Name as BrandId,LVModel.Name as ModelId,LvYear.Name as YearId, Price, AdditionalAmount, Discount, Comments
FROM            iRental_SalesCarPrice as SCP	LEFT OUTER JOIN
					FX_Common_LOV_Child as LvBrand on Scp.BrandId =  LvBrand.ChildId LEFT OUTER JOIN
					FX_Common_LOV_Child as LVModel on Scp.ModelId =  LVModel.ChildId LEFT OUTER JOIN
					FX_Common_LOV_Child as LvYear on Scp.YearId =  LvYear.ChildId 	

return
END

GO



