

CREATE proc [dbo].[INS_iRental_CarsForSales_SP]
 @ChassisNo nvarchar(50),  
 @RecId int,  
 @CarFor varchar(10),  
 @CarNumber nvarchar(10),  
 @BrandId int,  
 @ModelId int,  
 @TypeId int,  
 @CarYear int,  
 @ColorId int,  
 @CurrentMileage int,  
 @CarLocationId int,  
 @CarStatusId int,  
 @CurrentCondition nvarchar(1000),  
  
 @RowsToDelete varchar(1000),  
 @__UserId varchar(50),  
 @Status varchar(200) out  
  
as
begin
		INSERT INTO iRental_CarsForSale
            (ChassisNo, CarNumber, BrandId, ModelId, TypeId, YearId, ColorId, CurrentMileage,   
             CarLocationId, CarStatusId, CurrentCondition, [$CreatedBy], [$ModifiedBy])  
        VALUES     
            (@ChassisNo,@CarNumber, @BrandId, @ModelId, @TypeId, @CarYear, @ColorId, @CurrentMileage,  
           @CarLocationId, @CarStatusId, @CurrentCondition, @__UserId, @__UserId);
		set @Status =isnull(cast(@ChassisNo as varchar(10)),'-1') + '||OK||Record Insert Successfully'
end

GO



