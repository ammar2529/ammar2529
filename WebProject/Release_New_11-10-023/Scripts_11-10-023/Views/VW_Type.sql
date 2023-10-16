

ALTER view [dbo].[VW_Type]
as
select childid TypeId,Name Type  from FX_Common_LOV_Child where ParentTypeId=5  and IsDisable=0
GO


