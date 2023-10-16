

ALTER view [dbo].[VW_Models]
as
select childid ModelId,Name Model  from FX_Common_LOV_Child where ParentTypeId=3  and IsDisable=0
GO


