USE [OnlineSolutions]
GO
/****** Object:  StoredProcedure [dbo].[FX_UPD_FileUpload_SP]    Script Date: 9/6/2023 2:27:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].

 [FX_UPD_FileUpload_SP] null, null,'file.jpg','AddUploadedFile','amirza','ok'
  [FX_UPD_FileUpload_SP] 2,null,null,'DeleteFile',null,null,null
 
 truncate table FX_FileUpload 
  
  select * from FX_FileUpload
Script Date: 8/27/2023 10:20:23 AM ******/

-- select newid()
ALTER proc [dbo].[FX_UPD_FileUpload_SP]
	@RecId bigint,
	@FileGuid varchar(1000),
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
			set @Status=isnull(cast(@Rid as varchar(20)),'-1')+  '||OK|| RecId'  

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