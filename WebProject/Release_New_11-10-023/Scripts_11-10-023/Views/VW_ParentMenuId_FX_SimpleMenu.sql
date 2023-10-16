

ALTER view [dbo].[VW_ParentMenuId_FX_SimpleMenu] 
as
select *  from FX_SimpleMenu 
	where ParentMenuId = 0 
GO


