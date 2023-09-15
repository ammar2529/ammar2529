

CREATE  PROCEDURE [dbo].[SEL_iRental_SalesContracts_Comments_SP]   
	@RecId int,
	@ParentRecId int
			
AS


IF @RecId is not NULL
BEGIN

SELECT    RecId, ParentRecId, Comments
FROM         iRental_SalesContracts_Comments Where RecId = @RecId

END
ELSE
BEGIN

SELECT     
	iRental_SalesContracts_Comments.RecId, 
	iRental_SalesContracts_Comments.ParentRecId, 
	iRental_SalesContracts_Comments.Comments, 
	CONVERT(varchar, iRental_SalesContracts_Comments.[$DateCreated], 103) + ' ' + LEFT(CONVERT(varchar, iRental_SalesContracts_Comments.[$DateCreated], 108),5)  AS DateCreated,

	FX_Users.Name AS CreatedBy

FROM         iRental_SalesContracts_Comments LEFT OUTER JOIN
                      FX_Users ON iRental_SalesContracts_Comments.[$CreatedBy] = FX_Users.UserId

where	(iRental_SalesContracts_Comments.ParentRecId  =@ParentRecId)

order by recid desc
END

GO



