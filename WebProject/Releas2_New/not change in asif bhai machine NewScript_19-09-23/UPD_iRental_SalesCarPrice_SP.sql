
  
/****** Object:  StoredProcedure [dbo].  
[UPD_iRental_SalesCarPrice_SP] 1,64,75,53,16000,100,25,'upd',null,'Ammar','upd'   
[UPD_iRental_SalesCarPrice_SP] null,null,null,null,null,null,null,null,1,null,null   

select * from iRental_SalesCarPrice  
  
select * from iRental_SalesCarPrice  
Script Date: 8/13/2023 10:12:00 AM ******/  
  
Alter proc [dbo].[UPD_iRental_SalesCarPrice_SP]  

	@RecId bigint,  
	@BrandId bigint,  
	@ModelId bigint,  
	@YearId bigint,  
	@Price decimal (9,3),  
	@AdditionalAmount decimal(9,3),  
	@Discount decimal(9,3),  
	@Comments nvarchar (1000) ,
	@RowsToDelete varchar(1000),
	 @__UserId varchar(50),
	@Status varchar(200) out
  
	as  
	declare @NewRecId bigint

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Delete From  iRental_SalesCarPrice
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

else if @RecId is not null
begin 
	
UPDATE       iRental_SalesCarPrice
SET
	BrandId =@BrandId,
	ModelId =@ModelId,
	YearId =@YearId,
	Price =@Price,
	AdditionalAmount =@AdditionalAmount,
	Discount =@Discount,
	Comments =@Comments,
	[$CreatedBy] = @__UserId,
	[$ModifiedBy] = @__UserId,
	[$DateCreated] =GETDATE(),
	[$DateModified] = GETDATE()

	where RecId = @RecId
		  


		set @NewRecId = @@RowCount

		set @Status=@Status+'||OK||'+@Status+ ' Record Update Successfully'  


return
end

else
begin  
	print 'in insert '  
	INSERT INTO iRental_SalesCarPrice  
							 (BrandId, ModelId, YearId , Price, AdditionalAmount, Discount, Comments,[$CreatedBy],[$ModifiedBy])  
	VALUES      (@BrandId,@ModelId,@YearId,@Price,@AdditionalAmount,@Discount,@Comments,@__UserId,@__UserId)  

					set @Status=@Status+'||OK||'+@Status+ ' Record Insert Successfully'
					print @Status
	return
end

				set @Status=@Status+'||NoAction||'+@Status+ 'No Action Takken'  
GO




