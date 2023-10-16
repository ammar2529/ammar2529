

ALTER view [dbo].[VW_CarColor]
as
select childid ColorId,Name Color  from FX_Common_LOV_Child where ParentTypeId=6  and IsDisable=0
GO


