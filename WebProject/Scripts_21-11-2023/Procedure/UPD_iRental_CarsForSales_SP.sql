

/*

[UPD_iRental_CarsForSales_SP] '8778788',122,66,80,57,336,53,323,5,NULL,null,null,'8778787','update',null,null,null
[UPD_iRental_CarsForSales_SP] '8778770',123,64,76,55,325,53,323,5,32,'a',null,'8778788','update',null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,'GAM-18-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,'GAM-18-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,null,null,null,null,null,null,null,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 90999009,49,'5683',null,null,null,null,null,NULL,null,null,null,null,null,null,null
[UPD_iRental_CarsForSales_SP] 909,null,'444444',null,null,null,null,null,NULL,null,null,null,null,null,null,null
select * from iRental_CarsForSale
[UPD_iRental_CarsForSales_SP] null,34,'GAM-19-5683',66,80,57,326,52,NULL,null,null,null,null,null,null,null
*/
ALTER   Procedure [dbo].[UPD_iRental_CarsForSales_SP]  
 @ChassisNo nvarchar(50),  
 @CarNumber nvarchar(10),  
 @BrandId int,  
 @ModelId int,  
 @TypeId int,  
 @YearId int,  
 @ColorId int,
 @CarType char(1),
 @CurrentMileage int,  
 @CarLocationId int,  
 @CarStatusId int,  
 @CurrentCondition nvarchar(1000),  
 @RecId int,
 @ChassisNo_Original nvarchar(50),
 @Action varchar(20),
 @RowsToDelete varchar(1000),  
 @__UserId varchar(50),  
 @Status varchar(200) out  
  
  
  
  
As  
  
/* 
declare 
 @ChassisNo nvarchar(50) ='10009',  
 @RecId int=null,  
 @CarFor varchar(10)=null,
 @CarNumber nvarchar(10)=null,
 @BrandId int=null,
 @ModelId int=null,
 @TypeId int=null, 
 @CarYear int=null,
 @ColorId int=null,
 @CurrentMileage int=null,  
 @CarLocationId int=null,  
 @CarStatusId int=null,  
 @CurrentCondition nvarchar(1000)=null,  
 @action varchar(20)='new',
 @RowsToDelete varchar(1000)=null, 
 @__UserId varchar(50)=  'testuser',
 @Status varchar(200) =''

 */
 print @Action
declare @NewRecId int  
  
IF @RowsToDelete is not null  
BEGIN  
	 SET NOCOUNT OFF    
   
	 Delete From  iRental_CarsForSale  
	 where   ChassisNo in    
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
ELSE IF  @Action='update'
begin  
  
	 Update iRental_CarsForSale  
	 SET  
  
	ChassisNo=@ChassisNo,
	 CarNumber = @CarNumber, 
	 BrandId = @BrandId,  
	 ModelId = @ModelId,  
	 TypeId = @TypeId,  
	 YearId = @YearId,  
	 ColorId = @ColorId,  
	 CarType = @CarType,
	 CurrentMileage = @CurrentMileage,  
  
	 CarLocationId = @CarLocationId,  
	 CarStatusId = @CarStatusId,  
	 CurrentCondition = @CurrentCondition,  
	 [$ModifiedBy] = @__UserId,   
	 [$DateModified] = getdate()  
    
	WHERE ChassisNo = @ChassisNo_Original;
	--WHERE RecId = @RecId;


  
	 set @NewRecId = @@RowCount  
	   	print 'in update operation'

	 set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Updated Successfully'
	 return
  end

 ELSE IF @Action = 'new'
    BEGIN

	print 'in insert operation'
        -- INSERT operation
        INSERT INTO iRental_CarsForSale
            (ChassisNo, CarNumber, BrandId, ModelId, TypeId, YearId, ColorId,CarType, CurrentMileage,   
             CarLocationId, CarStatusId, CurrentCondition, [$CreatedBy], [$ModifiedBy])  
        VALUES     
            (@ChassisNo,@CarNumber, @BrandId, @ModelId, @TypeId, @YearId, @ColorId,@CarType, @CurrentMileage,  
           @CarLocationId, @CarStatusId, @CurrentCondition, @__UserId, @__UserId);
		   
   
	 --set @NewRecId = SCOPE_IDENTITY( )  
   
 --Update iRental_Cars set RecCode='RCR-' + cast(@NewRecId as varchar(10)) where RecId =  @NewRecId  
  set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Insert Successfully'
  return 
end  
  
   set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||NoAction||No Action Taken'
 
-- SELECT ChassisNo, COUNT(*) AS DuplicateCount
--FROM [iRental_CarsForSale]
--GROUP BY ChassisNo
--HAVING COUNT(*) > 1;

GO


