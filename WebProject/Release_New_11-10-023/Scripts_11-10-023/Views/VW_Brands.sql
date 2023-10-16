
ALTER view [dbo].[VW_Brands]
AS
select childid BrandId,Name Brand  from FX_Common_LOV_Child where ParentTypeId=2 and IsDisable=0
GO


