
CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_OtherCharges_SP]
	@__UserId varchar(50),
	@__IP varchar(50),
	@RecId int,
	@ParentRecId int,
	@Description nvarchar(1000),
	@Charges float,
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int
declare @NewContractOtherCharges float

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  

	Update iRental_SalesContracts_OtherCharges
	SET
	[$StateId] = 'Deleted',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  


INSERT INTO iRental_SalesContracts_OtherCharges_Audit
                      ([$UserId], [$IP], RecId, ParentRecId, Description,Charges,[$StateId])
SELECT    @__UserId [$UserId], @__IP [$IP], RecId, ParentRecId, Description, Charges,'Deleted' [$StateId]
FROM         iRental_SalesContracts_OtherCharges where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	set @Status = @@RowCount  

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

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

	Update iRental_SalesContracts_OtherCharges
	SET
	Description = @Description,
	Charges = @Charges,
	[$StateId] = 'Modified',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

	INSERT INTO iRental_SalesContracts_OtherCharges_Audit
	                      ([$UserId],[$IP], RecId, ParentRecId, Description,Charges,[$StateId])
	VALUES     (@__UserId,@__IP, @RecId, @ParentRecId,@Description,@Charges,'Modified')

end
else
begin


	INSERT INTO iRental_SalesContracts_OtherCharges
	                      (ParentRecId, Description,Charges,[$StateId], [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@Description,@Charges,'Created' ,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

	select @NewContractOtherCharges = isnull(sum(Charges),0) from iRental_SalesContracts_OtherCharges where [$StateId] != 'Deleted' and ParentRecId = @ParentRecId

	Update iRental_SalesContracts
	SET
	ContractOtherCharges = @NewContractOtherCharges
	where RecId= @ParentRecId

	INSERT INTO iRental_SalesContracts_OtherCharges_Audit
	                      ([$UserId],[$IP], RecId, ParentRecId, Description,Charges,[$StateId])
	VALUES     (@__UserId,@__IP, @NewRecId, @ParentRecId,@Description,@Charges,'Created')

end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'

GO




