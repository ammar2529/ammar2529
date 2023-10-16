

ALTER view [dbo].[VW_CarYear]
as
select childid YearId,Name CarYear  from FX_Common_LOV_Child where ParentTypeId=4  and IsDisable=0
GO


