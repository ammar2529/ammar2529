

/*  
   select * from iRental_SalesContracts
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,null,null,'5O83','RCD-131',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,'RCD-132',null,5083,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'new ',null,null,'RCD-44',null,5003,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
  [UPD_iRental_SalesContracts_SP]null, null,'Rec-0001','RCC-002','002255',null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,null, null, null, null,  null,  null, null, null, null, null, null, null, null, null, null, null, null, 'TODAY',  'BF8FA44A-1944-4941-889E-3257884788CE', 'new',  null, null,  null,  null 	
         
    [UPD_iRental_SalesContracts_SP]'amirza',1,'23/1','RCD-64588','8778770','N','Finance','491',NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-16 00:00:00','Thursday','4:26 PM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5:17 PM','gg','7A12A121-2672-4A51-B396-AB73F0858CA0','Yes',NULL,NULL,NULL,NULL,NULL,NULL,200.000,'554',0,NULL,0,NULL,'SCCreated',NULL,NULL,70000,1000,0,71000,'update',NULL,NULL,NULL,null
*/  
ALTER   Procedure [dbo].[UPD_iRental_SalesContracts_SP]  
 @__UserId varchar(50),  
  
	@RecId int,  
	@RecCode varchar(20),  
	@CustomerRecCode varchar(20),  
	@ChassisNo nvarchar(10), 
	@CarType varchar(10),
	@PaymenteMethod varchar(50),
	@FinanceCompany varchar(50),
	@CarRateType int,  
	@CarRate decimal(15,3),  
	@CarAllowedKM int,  
	@CarExtraKMRate decimal(15,3),  
	@ContractType varchar(10),  
	@ContractTypeOL varchar(10),  
	@ContractStartDate datetime,  
	@ContractStartDay nvarchar(50),  
	@ContractStartTime nvarchar(5),  
	@ContractExpiryDate datetime,  
	@ContractExpiryDay nvarchar(50),  
	@ContractExpiryTime nvarchar(5),  
	@ContractEndDate datetime,  
	@ContractEndDay nvarchar(50),  
	@ContractEndTime nvarchar(5),  
	@ContractDays int,  
	@ActualContractDays int,  
	@CarPreviousKM int,  
	@ContractKMOut int,  
	@ContractKMIn int,  
	@ContractExtraKM int,  
	@ContractExtraKMCharges decimal(15,3),  
	@ContractPeriodCharges decimal(15,3),  
	@ContractOtherCharges decimal(15,3),  
	@ContractDiscount decimal(15,3),  
	@ContractTotalCharges decimal(15,3),  
	@TotalPaidByCustomer decimal(15,3),  
	@OutLocationId int,  
	@InLocationId int,  
	@ReservationDays int,  
	@ReservationWeekDays nvarchar(50),  
	@ReservationAmount decimal(9,3),  
	@ReservationDate datetime,  
	@ReservationExpireTime nvarchar(50),
	@CarOwnerName varchar(50),
	@CarReplacement varchar(10),
 
	@ContractDate datetime,
	@ContractWeekDay nvarchar(50),
	@ContractTime nvarchar(50),
	@DeliveryDate datetime,
	@DeliveryWeekDays nvarchar(50),
	@DeliveryTime nvarchar(50),
	@EngineWarranty decimal(9, 3),
	@EnginYearsWarranty varchar(50),
	@GearWarranty decimal(9, 3),
	@GearYearsWarranty varchar(50),
	@CarWarranty decimal(9, 3),
	@CarYearsWarranty varchar(50),
	@StateId varchar(50),  
	@fComments nvarchar(2000),  
	@FileGuid uniqueidentifier, 
	@Price decimal(9, 3),
	@AdditionalAmount decimal(9, 3),
	@Discount decimal(9, 3),
	@TotalAmount decimal(11,3),
  
	@Action varchar(50),  
	@NewStateId varchar(50),  
	@DBAction varchar(50),  
	@RowsToDelete varchar(1000),  
	@Status varchar(200) out  
   
As  
  
  
   
   
  
declare @NewRecId int  
  
  
print '@RecId:'+ cast(@RecId as varchar(20))  
  
IF @RowsToDelete is not null  
BEGIN  
 SET NOCOUNT OFF    
   
 Delete From  iRental_SalesContracts  
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
 ELSE IF @DBAction='NewCar' 
 BEGIN
 select * from iRental_CarsForSale
 End
ELSE IF @DBAction='SCReserved'  
BEGIN  
   
 Update iRental_SalesContracts  
 SET ReservationDays=@ReservationDays,  
  ReservationAmount=@ReservationAmount,  
  ReservationWeekDays = @ReservationWeekDays,  
  ReservationExpireTime = @ReservationExpireTime,  
  ReservationDate=@ReservationDate ,
  [$StateId] = 'RRCReserved'
  
    
  set @Status='1||OK|| Car Reserved Successfully'    
  
  return  
END  
ELSE IF @Action = 'update' -- When Update the record --   @RecId is not null  
BEGIN  
   
 if @NewStateId is null  
 BEGIN  
  set @NewStateId = @StateId  
 END  
  
 Update iRental_SalesContracts  
 SET  
   
	 --ContractType=@ContractType,   
	 --ContractTypeOL=@ContractTypeOL,   
	 CustomerRecCode=@CustomerRecCode,   
	 ChassisNo=@ChassisNo,
	 CarType=@CarType,
	 PaymenteMethod=@PaymenteMethod,
	 FinanceCompany = @FinanceCompany,
	 CarOwnerName = @CarOwnerName,
	 CarReplacement = @CarReplacement,
	 CarPreviousKM=@CarPreviousKM,   
	 ContractKMOut=@ContractKMOut,   
	 OutLocationId=@OutLocationId,   
	 ContractStartDate=@ContractStartDate,   
	 ContractStartDay=@ContractStartDay,   
	 ContractStartTime=@ContractStartTime,   
	 ContractExpiryDate = @ContractExpiryDate,   
	 ContractExpiryDay = @ContractExpiryDay,   
	 ContractExpiryTime = @ContractExpiryTime,   
	 ReservationDate = @ReservationDate,  
	 ContractDate =@ContractDate,
	 ContractWeekDay = @ContractWeekDay,
	 ContractTime = @ContractTime,
	 DeliveryDate = @DeliveryDate,
	 DeliveryWeekDays = @DeliveryWeekDays,
	 DeliveryTime = @DeliveryTime,
	 EngineWarranty=@EngineWarranty,
	 EnginYearsWarranty=@EnginYearsWarranty,
	 GearWarranty=@GearWarranty,
	 GearYearsWarranty=@GearYearsWarranty,
	 CarWarranty=@CarWarranty,
	 CarYearsWarranty=@CarYearsWarranty,
	 ContractDays = @ContractDays,  
	 ContractEndDate=@ContractEndDate,  
	 ContractEndDay=@ContractEndDay,  
	 ContractEndTime=@ContractEndTime,  
	 ActualContractDays=@ActualContractDays,  
	 CarRateType= @CarRateType,   
	 CarRate = @CarRate,  
	 CarAllowedKM = @CarAllowedKM,   
	 CarExtraKMRate=@CarExtraKMRate,  
	 ContractKMIn = @ContractKMIn,  
	 InLocationId = @InLocationId,  
	 ContractPeriodCharges = @ContractPeriodCharges,  
	 ContractExtraKM = @ContractExtraKM,  
	 ContractExtraKMCharges = @ContractExtraKMCharges,  
	 ContractOtherCharges = @ContractOtherCharges,  
	 ContractDiscount = @ContractDiscount,  
	 ContractTotalCharges = @ContractTotalCharges,  
	 TotalPaidByCustomer = @TotalPaidByCustomer,  
	 fComments = @fComments,  
	 FileGuid=@FileGuid,
	 Price = @Price,
	 AdditionalAmount=@AdditionalAmount,
	 Discount=@Discount,
	 TotalAmount=@TotalAmount,
	 [$StateId] = @NewStateId,  
	 [$ModifiedBy] = @__UserId,   
	 [$DateModified] = getdate()  
  
 where RecId= @RecId  
 set @NewRecId = @@RowCount  
   print 'in update operation'  
  
 set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK|| Contract updated Successfully'  
   
  
  
  
 --if (@NewStateId = 'RRCContractOpen')  
 --Begin  
 -- UPDATE    iRental_Cars  
 -- SET        CarStatusId = 31  
 -- WHERE     (CarNumber = @CarNumber)  
 --end  
  
 --if (@NewStateId = 'RRCContractOpenCarIn' or @NewStateId = 'RRCContractClosedPendingPayment' or @NewStateId = 'RRCContractClosed' or @NewStateId = 'RRCContractCancelled')  
 --Begin  
 -- UPDATE    iRental_Cars  
 -- SET         CurrentMileage = @ContractKMIn, CarStatusId = 30  
 -- WHERE     (CarNumber = @CarNumber)  
 --end  
  return  
  
end  
else IF @Action = 'new'  
begin  
 declare @CStateId varchar(50)='SCCreated'  
  
 if(@DBAction is not null)  
 BEGIN  
  SET @CStateId=@DBAction  
 END  
  
	 INSERT INTO  iRental_SalesContracts  
	 (  CustomerRecCode, ChassisNo,CarType,PaymenteMethod,FinanceCompany,CarOwnerName,CarReplacement, CarPreviousKM, ContractKMOut, OutLocationId,   
	 ContractStartDate, ContractStartDay, ContractStartTime, ReservationDate, ReservationDays,ReservationExpireTime,ReservationWeekDays, ContractDays,
	 ContractDate,ContractWeekDay,ContractTime,DeliveryDate,DeliveryWeekDays,DeliveryTime,EngineWarranty,EnginYearsWarranty,GearWarranty,GearYearsWarranty,CarWarranty,CarYearsWarranty,
	 CarRateType, CarRate, CarAllowedKM, CarExtraKMRate,  ContractEndTime, ActualContractDays,fComments,FileGuid,Price,AdditionalAmount,Discount,TotalAmount,  
	 [$StateId], [$CreatedBy], [$ModifiedBy])  
	 VALUES       
	 ( @CustomerRecCode, @ChassisNo,@CarType,@PaymenteMethod,@FinanceCompany,@CarOwnerName,@CarReplacement,  @CarPreviousKM, @ContractKMOut, @OutLocationId,   
	 @ContractStartDate, @ContractStartDay, @ContractStartTime, @ReservationDate,@ReservationDays,@ReservationExpireTime,@ReservationWeekDays, @ContractDays,
	 @ContractDate,@ContractWeekDay,@ContractTime,@DeliveryDate,@DeliveryWeekDays,@DeliveryTime,@EngineWarranty,@EnginYearsWarranty,@GearWarranty,@GearYearsWarranty,@CarWarranty,@CarYearsWarranty,
	 @CarRateType, @CarRate, @CarAllowedKM, @CarExtraKMRate, @ContractEndTime, @ActualContractDays,@fComments,@FileGuid,@Price,@AdditionalAmount,@Discount,@TotalAmount, 
	 @CstateId, @__UserId, @__UserId)  
	   print 'in Insert operation'  
  
	 set @NewRecId = SCOPE_IDENTITY( )  
   
  
	 Update iRental_SalesContracts set RecCode=right(year(getdate()), 2) + '/' + cast(@NewRecId as varchar(10)) where RecId =  @NewRecId  
   
  
	 Update    iRental_CarsForSale SET CarStatusId = 32 WHERE (ChassisNo = @ChassisNo)  

	
  
  set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||OK|| Record Insert Successfully'  
  return  
  
end  
  
IF @Status IS NOT NUll OR LTRIM(LTRIM(@Status)) = ''  
BEGIN  
 set @Status =isnull(cast(@NewRecId as varchar(10)),'-1') + '||NoAction||No data updated'  
END  
  
  
GO


