
ALTER   Procedure [dbo].[UPD_iRental_Customers_sp]
	@__UserId varchar(50),
	@RecId int,
	@CustomerName nvarchar(200),
	@NationalIDNo nvarchar(50),
	@NationalIDExpiryDate datetime,
	@Nationality int,
	@Gender nvarchar(50),
	@DrivingLicenseNo nvarchar(50),
	@DrivingLicenseExpiry datetime,
	@PassportNo nvarchar(50),
	@PassportExpiry datetime,
	@Address nvarchar(1000),
	@WorkTelephone int,
	@ResidenceTelephone int,
	@MobileTelephone1 int,
	@MobileTelephone2 int,
	@EmailAddress nvarchar(100),
	@CustomerType nvarchar(50),
	@CustomerStatus nvarchar(50),
	@CustomerNotes nvarchar(1000),
	@RowsToDelete varchar(1000),
	@Status varchar(200) out
	
As

declare @NewRecId int

IF @RowsToDelete is not null
BEGIN
	SET NOCOUNT OFF  
	
	Delete From  iRental_Customers
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

	Update iRental_Customers
	SET
	CustomerName = @CustomerName,
	NationalIDNo =	@NationalIDNo,
	NationalIDExpiryDate = @NationalIDExpiryDate,
	Nationality = @Nationality,
	Gender = @Gender,
	DrivingLicenseNo = @DrivingLicenseNo,
	DrivingLicenseExpiry = @DrivingLicenseExpiry,
	PassportNo = @PassportNo,
	PassportExpiry = @PassportExpiry,
	Address= @Address,
	WorkTelephone = @WorkTelephone,
	ResidenceTelephone = @ResidenceTelephone,
	MobileTelephone1 = @MobileTelephone1,
	MobileTelephone2 = @MobileTelephone2,
	EmailAddress =	@EmailAddress,
	CustomerType = @CustomerType,
	CustomerStatus = @CustomerStatus,
	CustomerNotes = @CustomerNotes,
	[$ModifiedBy] = @__UserId, 
	[$DateModified] = getdate()
	 
	where RecId= @RecId

	set @NewRecId = @@RowCount
	set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'

end
else
begin
	INSERT INTO iRental_Customers
	                      (CustomerName, NationalIDNo, NationalIDExpiryDate, Nationality, Gender, DrivingLicenseNo, DrivingLicenseExpiry, PassportNo, PassportExpiry, 
	                      Address, WorkTelephone, ResidenceTelephone, MobileTelephone1, MobileTelephone2, EmailAddress, CustomerType, CustomerStatus, 
	                      CustomerNotes, [$CreatedBy], [$ModifiedBy])
	VALUES     (@CustomerName,@NationalIDNo,@NationalIDExpiryDate,@Nationality,@Gender,@DrivingLicenseNo,@DrivingLicenseExpiry,@PassportNo,@PassportExpiry,@Address,@WorkTelephone,
	@ResidenceTelephone,@MobileTelephone1,@MobileTelephone2,@EmailAddress,@CustomerType,@CustomerStatus,@CustomerNotes,@__UserId,@__UserId)
	
	set @NewRecId = SCOPE_IDENTITY( )
	
	Update iRental_Customers set RecCode='RCD-' + cast(@NewRecId as varchar(10)) where RecId =  @NewRecId
	set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Inserted Successfully'

end

---set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK||Record Updated Successfully'
GO


