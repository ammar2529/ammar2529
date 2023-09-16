

CREATE TABLE [dbo].[FX_FileUpload](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[FileGuid] [uniqueidentifier] NULL,
	[FileName] [varchar](500) NULL,
	[$CreatedBy] [nvarchar](256) NULL,
	[$ModifiedBy] [nvarchar](256) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_FX_FileUpload] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FX_FileUpload] ADD  CONSTRAINT [DF_FX_FileUpload_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[FX_FileUpload] ADD  CONSTRAINT [DF_FX_FileUpload_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO





CREATE TABLE [dbo].[iRental_SalesContracts](
	[RecId] [bigint] IDENTITY(1,1) NOT NULL,
	[RecCode] [varchar](20) NULL,
	[CustomerRecCode] [varchar](20) NOT NULL,
	[ChassisNo] [varchar](50) NULL,
	[CarRateType] [int] NULL,
	[CarRate] [decimal](15, 3) NULL,
	[CarAllowedKM] [bigint] NULL,
	[CarExtraKMRate] [decimal](15, 3) NULL,
	[ContractStartDate] [datetime] NULL,
	[ContractStartDay] [nvarchar](50) NULL,
	[ContractEndDate] [datetime] NULL,
	[ContractEndDay] [nvarchar](50) NULL,
	[ContractEndTime] [nvarchar](5) NULL,
	[ContractStartTime] [nvarchar](5) NULL,
	[ContractExpiryDay] [nvarchar](50) NULL,
	[ContractExpiryDate] [datetime] NULL,
	[ContractDays] [int] NULL,
	[ActualContractDays] [int] NULL,
	[CarPreviousKM] [int] NULL,
	[ContractKMOut] [int] NULL,
	[ContractKMIn] [int] NULL,
	[ContractExtraKM] [int] NULL,
	[ContractExtraKMCharges] [decimal](15, 3) NULL,
	[ContractPeriodCharges] [decimal](15, 3) NULL,
	[ContractOtherCharges] [decimal](15, 3) NULL,
	[ContractDiscount] [decimal](15, 3) NULL,
	[ContractTotalCharges] [decimal](15, 3) NULL,
	[TotalPaidByCustomer] [decimal](15, 3) NULL,
	[OutLocationId] [int] NULL,
	[InLocationId] [int] NULL,
	[ContractExpiryTime] [nvarchar](50) NULL,
	[ReservationDays] [int] NULL,
	[ReservationAmount] [decimal](9, 3) NULL,
	[ReservationDate] [datetime] NULL,
	[ReservationWeekDays] [nvarchar](50) NULL,
	[ReservationExpireTime] [nvarchar](50) NULL,
	[fComments] [varchar](2000) NULL,
	[FileGuid] [uniqueidentifier] NULL,
	[$OwnerOrgId] [int] NULL,
	[$OwnerUnitId] [int] NULL,
	[$StateId] [varchar](50) NULL,
	[$CreatedBy] [nvarchar](50) NULL,
	[$ModifiedBy] [nvarchar](50) NULL,
	[$DateCreated] [datetime] NULL,
	[$DateModified] [datetime] NULL,
 CONSTRAINT [PK_iRental_SalesContracts] PRIMARY KEY CLUSTERED 
(
	[RecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateCreated]  DEFAULT (getdate()) FOR [$DateCreated]
GO

ALTER TABLE [dbo].[iRental_SalesContracts] ADD  CONSTRAINT [DF_iRental_SalesContracts_$DateModified]  DEFAULT (getdate()) FOR [$DateModified]

GO



USE [OnlineSolutions]
GO

/****** Object:  StoredProcedure [dbo].[FX_UPD_FileUpload_SP]    Script Date: 9/15/2023 6:02:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].

 [FX_UPD_FileUpload_SP] null, null,'file.jpg','AddUploadedFile','amirza','ok'
  [FX_UPD_FileUpload_SP] 2,null,null,'DeleteFile',null,null,null
  [FX_UPD_FileUpload_SP] null,'BF8FA44A-1944-4941-889E-3257884788CB',null,'GetUploadedFiles',null,null

 
 truncate table FX_FileUpload 
  
  select * from FX_FileUpload
Script Date: 8/27/2023 10:20:23 AM ******/

-- select newid()
Alter proc [dbo].[FX_UPD_FileUpload_SP]
	@RecId bigint,
	@FileGuid uniqueidentifier,
	@FileName varchar(500),
	@DBAction varchar(500),
	@__UserId varchar(50),

	@Status varchar(200) out


as 
declare @Rid int


if @DBAction = 'DeleteFile'
BEGIN
	 SET NOCOUNT OFF    
   
	 Delete From  FX_FileUpload  
	 where   RecId = @RecId    
  
    set @Status =isnull(cast(@Rid as varchar(10)),'-1') + '||OK||File Delete  Successfully' 
	print @Status
	return
END


else if @DBAction = 'AddUploadedFile'
begin 

INSERT INTO FX_FileUpload
                         (FileGuid, FileName, [$CreatedBy], [$ModifiedBy])
VALUES					 (@FileGuid,@FileName,@__UserId,@__UserId)

	set @Rid = SCOPE_IDENTITY()
			set @Status=isnull(cast(@Rid as varchar(10)),'-1')+  '||OK|| RecId'  

			print @Status
return
end

else if @DBAction = 'GetUploadedFiles'
begin 
SELECT       RecId ,FileGuid, FileName
FROM            FX_FileUpload
		where FileGuid = @FileGuid


return
end
			set @Status=isnull(cast(@Rid as varchar(10)),'-1')+  '||NoAction|| No Action Taken'  

return
GO


USE [OnlineSolutions]
GO

/****** Object:  StoredProcedure [dbo].[SEL_iRental_SalesContracts_SP]    Script Date: 9/15/2023 6:05:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  
  
--[SEL_iRental_SalesContracts_SP] 3, null,null,null,null, null,null,null,null,null,null,null  
--select * from iRental_SalesContracts  
  
ALTER  PROCEDURE [dbo].[SEL_iRental_SalesContracts_SP]     
 @RecId int,  
 @__UserId nvarchar(50),  
 @RecCode varchar(20),  
 @CarNumber nvarchar(10),  
 @BrandId int,  
 @ModelId int,  
 @CarYearId int,  
 @OutLocationId int,  
 @NationalIDNo nvarchar(50),  
 @CustomerName nvarchar(200),  
 @fComments varchar(2000),  
 @CreatedBy nvarchar(255),  
 @ReservationDate datetime,  
 @ReservationDays int,  
 @ReservationExpireTime nvarchar(50),  
 @ReservationWeekDays nvarchar(50),  
 @StateId varchar(255)  
     
AS  
  
IF @RecId is not NULL  
BEGIN  
  
  SELECT       
  RecId,RecCode,[$CreatedBy] CreatedBy, StateId, StateName, CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,  
   OutLocationId, InLocationId,  
  CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate, ContractStartDay, ContractStartTime,  
  CONVERT(varchar, ContractExpiryDate, 103)  AS ContractExpiryDate, ContractDays,  
  CONVERT(varchar, ContractEndDate, 103)  AS ContractEndDate, ContractEndDay, ContractEndTime, ActualContractDays,  
  
  CarPreviousKM, CarRateType, CarRate, CarAllowedKM, CarExtraKMRate,  
  ContractKMOut, ContractKMIn,  
  ContractExtraKM, ContractExtraKMCharges,   
  ContractPeriodCharges, ContractOtherCharges, ContractDiscount, ContractTotalCharges, TotalPaidByCustomer,  
  CarNumber, ChassisNo, Brand BrandId, Model ModelId, CarYear,Color , isNull(Price,0) Price, isNull(Discount,0) Discount,isNull(AdditionalAmount,0) AdditionalAmount,isNull(TotalAmount,0) TotalAmount, [Type] TypeId,isNull(PaymentAmount,0) PaymentAmount,  
  --'3rd - ' +CONVERT(varchar, InsuranceExpiry, 103)  AS InsuranceExpiry,  
  --'Full - '+CONVERT(varchar, FullInsuranceExpiry, 103)  AS FullInsuranceExpiry,  
  CustomerRecCode, CustomerName, Gender, Nationality, TotalAmount - PaymentAmount as AmountDue,fComments,  
   convert(varchar, ReservationDate,103) as ReservationDate,  
  ReservationDays,ReservationWeekDays,ReservationExpireTime,  
  WorkTelephone,   
  ResidenceTelephone,   
  MobileTelephone1,   
  MobileTelephone2,   
  --EmailAddress,  
  --Address,  
  PassportNo, --CONVERT(varchar, PassportExpiry, 103)  AS PassportExpiry,  
  NationalIDNo, --CONVERT(varchar, NationalIDExpiryDate, 103)  AS NationalIDExpiryDate,  
  DrivingLicenseNo, --CONVERT(varchar, DrivingLicenseExpiry, 103)  AS DrivingLicenseExpiry,  
   FileGuid,  
  CASE when CustomerType = 'Local' THEN 'Local Residence'  when CustomerType = 'International' THEN 'International - On Visit' ELSE '' END AS CustomerType  
  
FROM        VW_SEL_iRental_SalesContracts_Details Where RecId= @RecId         
   
END  
ELSE  
BEGIN  
  
IF EXISTS (SELECT     roles  
                        FROM         FX_Users  
                        WHERE     UserId = @__UserId AND roles LIKE '%iRen_Contracts_Lawyer%')   
Begin  
 if @StateId is null  
  Set @StateId = 'RRCWithLegalContractOpenCarOut,RRCWithLegalContractOpenCarIn,RRCWithLegalContractClosedPendingPayment'  
 else  
 BEGIN  
  IF NOT ( @StateId  ='RRCWithLegalContractOpenCarOut' OR @StateId  ='RRCWithLegalContractOpenCarIn' OR @StateId  ='RRCWithLegalContractClosedPendingPayment')  
  Set @StateId = 'Dummy'  
  
 END  
End  
  
  
SELECT    top 500 RecId, RecCode, CarNumber, Brand, Model, CarYear, CustomerName, CONVERT(varchar, ContractStartDate, 103)  AS ContractStartDate,  [$CreatedBy], StateName,  
 ContractStartTime,Nationality,  
 MobileTelephone1,  
 MobileTelephone2,  
 CONVERT(varchar, [$DateCreated], 103)  AS DateCreated,  
 LEFT(CONVERT(varchar,  [$DateCreated], 108),5)  AS DateCreatedTime,  
 NationalIDNo, isnull(ContractTotalCharges,0) as ContractTotalCharges , 0 as TotalAmountDue  
  
FROM           VW_SEL_iRental_SalesContracts_Details  
 where   
 (RecCode like '%' + @RecCode+ '%' or @RecCode is null) and  
 (CarNumber like '%' + @CarNumber+ '%' or @CarNumber is null) and  
 (BrandId= @BrandId or @BrandId is null) and  
 (ModelId= @ModelId or @ModelId is null) and  
 (CarYear= @CarYearId or @CarYearId is null) and  
 (OutLocationId= @OutLocationId or @OutLocationId is null) and  
 (NationalIDNo= @NationalIDNo or @NationalIDNo is null) and  
 (CustomerName like '%' + @CustomerName+ '%' or @CustomerName is null) and  
 ([$CreatedBy] like '%' + @CreatedBy+ '%' or @CreatedBy is null) and  
 (  
  StateId in(select RTD.value     
   from [dbo].[Split](@StateId,',') RTD)  
  
 or @StateId is null)  
  
order by RecId Desc  
   
  
/*  
SELECT     iRental_Cars_Rates.RecId,  
FX_Common_LOV_Child_1.Name AS RateTypeId,  
FX_Common_LOV_Child_2.Name AS BrandId,  
FX_Common_LOV_Child_3.Name AS ModelId,  
FX_Common_LOV_Child_4.Name  AS CarYear,   
iRental_Cars_Rates.Rate,  
iRental_Cars_Rates.AllowedKM,   
iRental_Cars_Rates.ExtraKMRate,  
  
CASE WHEN iRental_Cars_Rates.IsDisable = 0 THEN 'No' ELSE 'Yes' END AS IsDisable  
  
FROM         iRental_Cars_Rates  
  
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_1 ON iRental_Cars_Rates.RateTypeId = FX_Common_LOV_Child_1.ChildId  
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_2 ON iRental_Cars_Rates.BrandId = FX_Common_LOV_Child_2.ChildId  
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_3 ON iRental_Cars_Rates.ModelId = FX_Common_LOV_Child_3.ChildId  
LEFT OUTER JOIN FX_Common_LOV_Child AS FX_Common_LOV_Child_4 ON iRental_Cars_Rates.CarYear = FX_Common_LOV_Child_4.ChildId  
  
where (iRental_Cars_Rates.RateTypeId= @RateTypeId or @RateTypeId is null) and  
 (iRental_Cars_Rates.BrandId= @BrandId or @BrandId is null) and  
 (iRental_Cars_Rates.ModelId= @ModelId or @ModelId is null) and  
 (iRental_Cars_Rates.CarYear= @CarYear or @CarYear is null) and  
 (iRental_Cars_Rates.IsDisable =@IsDisable or @IsDisable is null)  
  
order by RecId Desc  
*/  
END  
GO


USE [OnlineSolutions]
GO

/****** Object:  StoredProcedure [dbo].[UPD_iRental_SalesContracts_SP]    Script Date: 9/15/2023 6:04:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*  
   
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,null,null,'5O83','RCD-131',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'test',2,null,'RCD-132',null,5083,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
exec [UPD_iRental_SalesContracts_SP] 'new ',null,null,'RCD-44',null,5003,23232,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null  
  [UPD_iRental_SalesContracts_SP]null, null,'Rec-0001','RCC-002','002255',null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,null, null, null, null,  null,  null, null, null, null, null, null, null, null, null, null, null, null, 'TODAY',  'BF8FA44A-1944-4941-889E-3257884788CE', 'new',  null, null,  null,  null 	
         
  
 select * from iRental_SalesContracts where FileGuid = 'BF8FA44A-1944-4941-889E-3257884788CE'  
*/  
Alter   Procedure [dbo].[UPD_iRental_SalesContracts_SP]  
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
	 FileGuid=@FileGuid,
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


USE [OnlineSolutions]
GO

/****** Object:  View [dbo].[VW_SEL_iRental_SalesContracts_Details]    Script Date: 9/15/2023 6:07:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*  
select * from iRental_CarsForSaleForSale      
select * from iRental_CarsForSale  
select * from iRental_SalesContracts  
  
*/  
aLTER VIEW [dbo].[VW_SEL_iRental_SalesContracts_Details]  
AS  
SELECT        dbo.iRental_SalesContracts.RecId, dbo.iRental_SalesContracts.RecCode, dbo.iRental_SalesContracts.CustomerRecCode, dbo.iRental_SalesContracts.ChassisNo, dbo.iRental_SalesContracts.CarRateType,   
                         dbo.iRental_SalesContracts.CarRate, dbo.iRental_SalesContracts.CarAllowedKM, dbo.iRental_SalesContracts.CarExtraKMRate, dbo.iRental_SalesContracts.fComments, dbo.iRental_SalesContracts.ContractExpiryTime,   
                         dbo.iRental_SalesContracts.ContractStartDate, dbo.iRental_SalesContracts.ContractStartDay, dbo.iRental_SalesContracts.ContractStartTime, dbo.iRental_SalesContracts.ContractExpiryDate,   
                         dbo.iRental_SalesContracts.ContractEndDate, dbo.iRental_SalesContracts.ContractEndDay, dbo.iRental_SalesContracts.ContractEndTime, dbo.iRental_SalesContracts.ContractDays,   
                         dbo.iRental_SalesContracts.ActualContractDays, dbo.iRental_SalesContracts.CarPreviousKM, dbo.iRental_SalesContracts.ContractKMOut, dbo.iRental_SalesContracts.ContractKMIn,   
                         dbo.iRental_SalesContracts.ContractExtraKM, dbo.iRental_SalesContracts.ContractExtraKMCharges, dbo.iRental_SalesContracts.ContractPeriodCharges, dbo.iRental_SalesContracts.ContractOtherCharges,   
                         dbo.iRental_SalesContracts.ContractDiscount, dbo.iRental_SalesContracts.ContractTotalCharges, dbo.iRental_SalesContracts.TotalPaidByCustomer, dbo.iRental_SalesContracts.OutLocationId,   
                         dbo.iRental_SalesContracts.InLocationId, dbo.iRental_SalesContracts.ReservationDays, dbo.iRental_SalesContracts.ReservationAmount, dbo.iRental_SalesContracts.ReservationDate,   
                         dbo.iRental_SalesContracts.[$OwnerOrgId], dbo.iRental_SalesContracts.[$OwnerUnitId], dbo.iRental_SalesContracts.[$StateId], dbo.iRental_SalesContracts.[$CreatedBy], dbo.iRental_SalesContracts.[$ModifiedBy],   
                         dbo.iRental_SalesContracts.[$DateCreated], dbo.iRental_SalesContracts.[$DateModified], dbo.iRental_Customers.CustomerType, dbo.iRental_Customers.Gender, dbo.iRental_Customers.CustomerName,   
                         dbo.iRental_Customers.Nationality, dbo.iRental_Customers.PassportNo, dbo.iRental_Customers.NationalIDNo, dbo.iRental_Customers.DrivingLicenseNo, dbo.iRental_Customers.WorkTelephone,   
                         dbo.iRental_Customers.ResidenceTelephone, dbo.iRental_Customers.MobileTelephone1, dbo.iRental_Customers.MobileTelephone2, dbo.VW_iRental_CarsForSale_Available.CarNumber,   
                         dbo.VW_iRental_CarsForSale_Available.BrandId, dbo.VW_iRental_CarsForSale_Available.ModelId, dbo.VW_iRental_CarsForSale_Available.ColorId, dbo.VW_iRental_CarsForSale_Available.TypeId,   
                         dbo.VW_iRental_CarsForSale_Available.CurrentMileage, dbo.VW_Models.Model, dbo.VW_CarColor.Color, dbo.VW_Type.Type, dbo.VW_Brands.Brand, dbo.VW_CarYear.CarYear,   
                         dbo.VW_FX_Workflow_States_Sales_Contracts.StateName, dbo.VW_FX_Workflow_States_Sales_Contracts.StateId, dbo.VW_iRental_SalesContracts_Payments.PaymentAmount, dbo.VW_iRental_CarsForSale_Available.Price,   
                         dbo.VW_iRental_CarsForSale_Available.Discount, dbo.VW_iRental_CarsForSale_Available.AdditionalAmount, dbo.VW_iRental_CarsForSale_Available.TotalAmount, dbo.iRental_SalesContracts.ContractExpiryDay,   
                         dbo.iRental_SalesContracts.ReservationExpireTime, dbo.iRental_SalesContracts.ReservationWeekDays  , FileGuid
FROM            dbo.VW_FX_Workflow_States_Sales_Contracts RIGHT OUTER JOIN  
                         dbo.iRental_SalesContracts LEFT OUTER JOIN  
                         dbo.VW_iRental_SalesContracts_Payments ON dbo.iRental_SalesContracts.RecId = dbo.VW_iRental_SalesContracts_Payments.ParentRecId ON   
                         dbo.VW_FX_Workflow_States_Sales_Contracts.StateId = dbo.iRental_SalesContracts.[$StateId] LEFT OUTER JOIN  
                         dbo.iRental_Customers ON dbo.iRental_SalesContracts.CustomerRecCode = dbo.iRental_Customers.RecCode LEFT OUTER JOIN  
                         dbo.VW_iRental_CarsForSale_Available LEFT OUTER JOIN  
                         dbo.VW_CarColor ON dbo.VW_iRental_CarsForSale_Available.ColorId = dbo.VW_CarColor.ColorId LEFT OUTER JOIN  
                         dbo.VW_CarYear ON dbo.VW_iRental_CarsForSale_Available.YearId = dbo.VW_CarYear.YearId LEFT OUTER JOIN  
                         dbo.VW_Brands ON dbo.VW_iRental_CarsForSale_Available.BrandId = dbo.VW_Brands.BrandId LEFT OUTER JOIN  
                         dbo.VW_Type ON dbo.VW_iRental_CarsForSale_Available.TypeId = dbo.VW_Type.TypeId ON dbo.iRental_SalesContracts.ChassisNo = dbo.VW_iRental_CarsForSale_Available.ChassisNo LEFT OUTER JOIN  
                         dbo.VW_Models ON dbo.VW_iRental_CarsForSale_Available.ModelId = dbo.VW_Models.ModelId  

GO


