

/*
select * from iRental_SalesContracts_Payments where ReceiptId =5945
[UPD_iRental_SalesContracts_Payments_SP] 'anonyus',null,3,1013,86,5945,null,23,138,26,null,null,null,null,'update'
*/
CREATE  Procedure [dbo].[UPD_iRental_SalesContracts_Payments_SP]
	@__UserId varchar(50),
	@__IP varchar(50),
	@RecId int,
	@LocationReceiptId varchar(50),
	@ParentRecId int,
	@ReceiptId int,
	@PaymentType int,
	@PaymentDate datetime,
	@PaymentAmount float,
	@PaymentMode int,
	@ChequeNo bigint,
	@AmountInWords nvarchar(255),
	@PaymentComments nvarchar(2000),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int
declare @NewTotalPaidByCustomer float
declare @NewTotalReturnToCustomer float
declare @OutLocationId int
declare @LocationMaxId int

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Update iRental_SalesContracts_Payments
	SET
	[$StateId] = 'Deleted',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  

INSERT INTO iRental_Contracts_Payments_Audit
                      ([$UserId], [$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo, AmountInWords, PaymentComments, [$StateId])
SELECT    @__UserId [$UserId], @__IP [$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo, AmountInWords, PaymentComments,'Deleted' [$StateId]
FROM         iRental_SalesContracts_Payments where   RecId in  
	(  
		select RTD.value   
		from [dbo].[Split](@RowsToDelete,',') RTD  
	)  
	
	set @Status = @@RowCount 

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId

	Update  iRental_SalesContracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
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

	Update iRental_SalesContracts_Payments
	SET
	ReceiptId = @ReceiptId,
	PaymentType = @PaymentType,
	PaymentDate = @PaymentDate,
	PaymentAmount = @PaymentAmount,
	PaymentMode = @PaymentMode,
	ChequeNo = @ChequeNo,
	AmountInWords = @AmountInWords,
	PaymentComments = @PaymentComments,
	[$StateId] = 'Modified',
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId


	Update iRental_Contracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
	where RecId= @ParentRecId

	INSERT INTO iRental_Contracts_Payments_Audit
	                      ([$UserId],[$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments, [$StateId])
	VALUES     (@__UserId,@__IP, @RecId,@LocationReceiptId, @ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Modified')

			set @Status=@Status+'||OK||'+@Status+ ' Records Update Successfully'  

return
end
else
begin

Begin Tran Ins

	INSERT INTO iRental_SalesContracts_Payments
	                      (ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments,	[$StateId],  [$CreatedBy], [$ModifiedBy])
	VALUES     (@ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Created' ,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )

	select @OutLocationId = isnull(sum(OutLocationId),0) from iRental_Contracts where RecId = @ParentRecId

	select   @LocationMaxId =  isnull(COUNT(*), 1)
	from         dbo.iRental_Contracts INNER JOIN
	                      dbo.iRental_SalesContracts_Payments ON dbo.iRental_Contracts.RecId = dbo.iRental_SalesContracts_Payments.ParentRecId
	where dbo.iRental_Contracts.OutLocationId = @OutLocationId
	GROUP BY dbo.iRental_Contracts.OutLocationId 


	Update iRental_SalesContracts_Payments
	SET
	LocationReceiptId = cast(@OutLocationId as varchar(50))   + '/' +  cast(@LocationMaxId as varchar(50))   + '/' +  cast(@NewRecId as varchar(50)) 
	where RecId= @NewRecId

	select @NewTotalPaidByCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=0 and ParentRecId = @ParentRecId

	select @NewTotalReturnToCustomer = isnull(sum(PaymentAmount),0) from iRental_SalesContracts_Payments where [$StateId] != 'Deleted' and PaymentType=1 and ParentRecId = @ParentRecId

	Update iRental_Contracts
	SET
	TotalPaidByCustomer = (@NewTotalPaidByCustomer - @NewTotalReturnToCustomer)
	where RecId= @ParentRecId

	INSERT INTO iRental_Contracts_Payments_Audit
	                      ([$UserId],[$IP], RecId, LocationReceiptId, ParentRecId, ReceiptId, PaymentType, PaymentDate, PaymentAmount, PaymentMode, ChequeNo,AmountInWords,PaymentComments, [$StateId])
	VALUES     (@__UserId,@__IP, @NewRecId,cast(@OutLocationId as varchar(50))   + '/' +  cast(@LocationMaxId as varchar(50))   + '/' +  cast(@NewRecId as varchar(50)) ,@ParentRecId,@ReceiptId, @PaymentType,@PaymentDate, @PaymentAmount, @PaymentMode, @ChequeNo,@AmountInWords,@PaymentComments, 'Created')

Commit Tran Ins
  set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Insert Successfully'
  return
end

set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||NoAction||No Action Happen'

GO




