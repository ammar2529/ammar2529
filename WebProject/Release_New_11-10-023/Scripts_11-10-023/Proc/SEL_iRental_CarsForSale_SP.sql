USE [OnlineSolutionsDevVMM]
GO

/****** Object:  StoredProcedure [dbo].[SEL_iRental_CarsForSale_SP]    Script Date: 10/28/2023 5:37:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--[SEL_iRental_CarsForSale_SP] null,null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null,null,null,null,null
--[SEL_iRental_CarsForSale_SP] '4444',null,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,null,null,null,null,null
ALTER PROC [dbo].[SEL_iRental_CarsForSale_SP]
	@ChassisNo nvarchar(50),
	@RecId int,
	@CarFor varchar(10),
	@CarNumber nvarchar(10),
	@BrandId int,
	@ModelId int,
	@TypeId int,
	@CarYear int,
	@CarLocationId int,
	@InsuranceCompanyId int,
	@FullInsuranceCompanyId int,
	@NormalInsuranceExpiryDays int,
	@FullInsuranceExpiryDays int,
	@CarStatusId int,
	@__UserId nvarchar(50)

as 

if @ChassisNo is null

begin 

	SELECT        cfs.ChassisNo, cfs.CarNumber, LVBrand.Name as BrandId , LVModel.Name as ModelId, LVYear.Name as YearId, LVColor.Name as Color, LVType.Name as TypeId,
				  --cfs.CurrentMileage,
				  LVLocation.Name as CarLocationId, 
				  --LVStatus.Name as CarStatusId, 
				  --isNull(CFA.Price,0) Price,
				  --TotalAmount,
				  cfs.RecId
	FROM					 iRental_CarsForSale as cfs Left outer join 
	                         FX_Common_LOV_Child as LVBrand on cfs.BrandId  = LVBrand.ChildId Left outer join 
						     FX_Common_LOV_Child as LVModel on cfs.ModelId = LVModel.ChildId left outer join
							 FX_Common_LOV_Child as LVYear on cfs.YearId = LVYear.ChildId left outer join
							 FX_Common_LOV_Child as LVColor on  cfs.ColorId = LVColor.ChildId left outer join
							 FX_Common_LOV_Child as LVType on  cfs.TypeId = LVType.ChildId left outer join 
							 FX_Common_LOV_Child as LVStatus on  cfs.CarStatusId = LVStatus.ChildId left outer join
							 FX_Common_LOV_Child as LVLocation on   cfs.CarLocationId = LVLocation.ChildId  left outer join
							 VW_iRental_CarsForSale_Available as CFA on cfs.ChassisNo = CFA.ChassisNo 
							where  cfs.ChassisNo not in 
											( 
												select  ChassisNo from iRental_SalesContracts 
												where (ReservationDate) >=getdate()
											)
							
							


end


else
begin
--declare @ChassisNo varchar(50) = '4444'
print @ChassisNo
	SELECT       CSF.ChassisNo, CSF.CarNumber, CSF.BrandId, CSF.ModelId, CSF.YearId, CSF.ColorId, CSF.TypeId,
				--CSF.CurrentMileage,
				CSF.CarLocationId,
				 CSF.CarStatusId,
				 --isNull(CFA.Price,0) Price, isNull(CFA.TotalAmount,0) TotalAmount,
				CSF.[$OwnerOrgId], 
				 CSF.[$OwnerUnitId], CSF.[$StateId], CSF.[$CreatedBy], CSF.[$ModifiedBy], CSF.[$DateCreated], CSF.[$DateModified], 
                         CSF.CurrentCondition
	FROM            iRental_CarsForSale as CSF LEFT OUTER JOIN 
						VW_iRental_CarsForSale_Available as CFA on CSF.ChassisNo = CFA.ChassisNo 
					where @ChassisNo = CSF.ChassisNo


end


GO


