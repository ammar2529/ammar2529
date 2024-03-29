USE [OnlineSolutions]
GO
/****** Object:  StoredProcedure [dbo].[UPD_iRental_SalesCarPrice_SP]    Script Date: 8/17/2023 4:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/****** Object:  StoredProcedure [dbo].  
[UPD_iRental_SalesCarPrice]  63,458,59,250,25,25,'insert'   
select * from iRental_SalesCarPrice  
  
select * from iRental_CarsForSale  
Script Date: 8/13/2023 10:12:00 AM ******/  
  
ALTER proc [dbo].[UPD_iRental_SalesCarPrice_SP]  
  
@BrandId int,  
@ModelId int,  
@YearId int,  
@Price decimal (9,3),  
@AdditionalAmount decimal(9,3),  
@Discount decimal(9,3),  
@Comments nvarchar (1000)  
  
as  
begin  
print 'in update '  
INSERT INTO iRental_SalesCarPrice  
                         (BrandId, ModelId, YearId, Price, AdditionalAmount, Discount, Comments)  
VALUES      (@BrandId,@ModelId,@YearId,@Price,@AdditionalAmount,@Discount,@Comments)  
end