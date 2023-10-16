

ALTER VIEW [dbo].[VW_SEL_MenuName]
AS
SELECT     TOP 100 PERCENT MenuId, MenuName
FROM         dbo.FX_SimpleMenu
WHERE     (ParentMenuId > 0)
ORDER BY MenuName
GO


