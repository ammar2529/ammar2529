

/*  
   
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,null,null,'5O83','RCD-131',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,'RCD-132',null,5083,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'new ',null,null,'RCD-44',null,5003,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
  
         
  
 select * from iRental_SalesContracts where CarNumber = '5O84'  
*/  
CREATE   Procedure [dbo].[UPD_iRental_SalesContracts_SP]  
 @__UserId varchar(50),  
  
 @RecId int,  
 @RecCode varchar(20),  
 @CustomerRecCode varchar(20),  
 @ChassisNo nvarchar(10),  
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
 @StateId varchar(50),  
 @fComments varchar (2000),  
 @FileGuid uniqueidentifier,  
  
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
  
ELSE IF @DBAction='Reserve'  
BEGIN  
   
 Update iRental_SalesContracts  
 SET ReservationDays=@ReservationDays,  
  ReservationAmount=@ReservationAmount,  
  ReservationWeekDays = @ReservationWeekDays,  
  ReservationExpireTime = @ReservationExpireTime,  
  ReservationDate=GETDATE()  
  
    
  set @Status=@Status+'||OK||'+@Status+ ' Records Reserved Successfully'    
  
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
 (  CustomerRecCode, ChassisNo, CarPreviousKM, ContractKMOut, OutLocationId,   
 ContractStartDate, ContractStartDay, ContractStartTime, ReservationDate, ReservationDays,ReservationExpireTime,ReservationWeekDays, ContractDays,  
 CarRateType, CarRate, CarAllowedKM, CarExtraKMRate,  ContractEndTime, ActualContractDays,fComments,FileGuid,  
 [$StateId], [$CreatedBy], [$ModifiedBy])  
 VALUES       
 ( @CustomerRecCode, @ChassisNo, @CarPreviousKM, @ContractKMOut, @OutLocationId,   
 @ContractStartDate, @ContractStartDay, @ContractStartTime, @ReservationDate,@ReservationDays,@ReservationExpireTime,@ReservationWeekDays, @ContractDays,  
 @CarRateType, @CarRate, @CarAllowedKM, @CarExtraKMRate, @ContractEndTime, @ActualContractDays,@fComments,@FileGuid,  
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



