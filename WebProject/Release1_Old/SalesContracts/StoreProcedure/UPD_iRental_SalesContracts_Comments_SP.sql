

CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_Comments_SP]
	@__UserId varchar(50),
	@RecId int,
	@ParentRecId int,
	@Comments nvarchar(2000),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Delete From  iRental_SalesContracts_Comments
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	
	set @Status = @@RowCount  
	if(@Status ='0' )  
		set @Status= '0||OK||Unable to delete records!'  
	else if (@Status ='1' )  
		set @Status=@Status+'||OK||'+@Status+ ' Record Deleted Successfully'  
	else   
		set @Status=@Status+'||OK||'+@Status+ ' Records Deleted Successfully'  
	return
	SET NOCOUNT ON
END
ELSE IF @RecId > 0
begin

	Update iRental_SalesContracts_Comments
	SET
	Comments = @Comments,
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

end
else
begin


	INSERT INTO iRental_SalesContracts_Comments
	                      (ParentRecId, Comments, [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@Comments,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'

GO




