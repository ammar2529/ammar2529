


/****** Object:  StoredProcedure [dbo].

 [FX_UPD_FileUpload_SP] null, null,'file.jpg','AddUploadedFile','amirza','ok'
  [FX_UPD_FileUpload_SP] 116,null,null,'DeleteFile',null,null,null,null
  [FX_UPD_FileUpload_SP] null,'B0706868-2A19-4974-88E0-A6D9647BF907',null,'GetUploadedFiles',null,null,null,null

 
 truncate table 
 select * FX_FileUpload 
  
  select * from FX_FileUpload 
  where fileguid='B0706868-2A19-4974-88E0-A6D9647BF907'
  order by [$datemodified] desc
Script Date: 8/27/2023 10:20:23 AM ******/

-- select newid()
ALTER proc [dbo].[FX_UPD_FileUpload_SP]
	@RecId bigint,
	@FileGuid uniqueidentifier,
	@FileSize varchar(50),
	@FileName varchar(500),
	@DocType varchar(50),
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

	--  Now, return the updated file list
	 SELECT RecId, FileGuid, FileSize, FileName, DocType, [$CreatedBy], CONVERT(varchar, [$DateModified], 103) as DateModified
	 FROM FX_FileUpload
	 print @Status
	return
END


else if @DBAction = 'AddUploadedFile'
begin 

INSERT INTO FX_FileUpload
                         (FileGuid, FileName,FileSize,DocType, [$CreatedBy], [$ModifiedBy])
VALUES					 (@FileGuid,@FileName,@FileSize,@DocType,@__UserId,@__UserId)

	set @Rid = SCOPE_IDENTITY()
			set @Status=isnull(cast(@Rid as varchar(10)),'-1')+  '||OK|| RecId'  

			print @Status
return
end

else if @DBAction = 'GetUploadedFiles'
begin 
SELECT       RecId ,FileGuid, FileSize, FileName,LVDocType.Name as DocType,[$CreatedBy],CONVERT(varchar, [$DateModified], 103) as DateModified
	 FROM FX_FileUpload as fud left outer join 
	 FX_Common_LOV_Child as LVDocType on fud.DocType = LVDocType.ChildId

		where FileGuid = @FileGuid  
		order by [$DateModified] desc

		print'in GetUploadedFiles '
return
end
			set @Status=isnull(cast(@Rid as varchar(10)),'-1')+  '||NoAction|| No Action Taken'  

return
GO


